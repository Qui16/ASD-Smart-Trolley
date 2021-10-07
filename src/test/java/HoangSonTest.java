/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author casio
 */
import java.sql.Connection;
import java.sql.SQLException;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import uts.asd.model.Payment;
import uts.asd.model.PaymentHistory;
import uts.asd.model.dao.DBConnector;
import uts.asd.model.dao.DBManager;
import uts.asd.model.dao.PaymentManager;


public class HoangSonTest {

    private DBConnector connector;
    private Connection conn;
    private PaymentManager paymentManager;
    private uts.asd.controller.Validator validate = new uts.asd.controller.Validator();

    //This method will be called before each test
    @Before
    public void SetUp() throws ClassNotFoundException, SQLException {

        connector = new DBConnector();
        conn = connector.openConnection();
        paymentManager = new PaymentManager(conn);
        uts.asd.controller.Validator validate = new uts.asd.controller.Validator();

        
    }

//This method will be called after each test
    @After
    public void Teardown() throws ClassNotFoundException, SQLException {
        connector.closeConnection();       
        
    }

    @Test
    public void TestCreateSavePaymentDetail() throws ClassNotFoundException, SQLException {
        paymentManager.addPaymentDetail(1022, "card", "1593574862019537", "09/30", "321", "HoangSon");
        Payment payment1 = paymentManager.searchPaymentDetail(1022);
        Payment payment2 = paymentManager.searchPaymentDetail(1030);
        Payment payment3 = paymentManager.searchPaymentDetail(10232);
        Assert.assertNotNull(payment1);
        Assert.assertNull(payment2);
        Assert.assertNull(payment3);
    }
    
    @Test
    public void TestDeletePaymentDetail() throws ClassNotFoundException, SQLException {
        paymentManager.addPaymentDetail(1022, "card", "1593574862019537", "09/30", "321", "HoangSon");
        paymentManager.deletePaymentDetail(1022);
        Payment payment1 = paymentManager.searchPaymentDetail(1022);
        paymentManager.addPaymentDetail(1020, "card", "3216549870987654", "08/15", "123", "HoangSon");
        paymentManager.deletePaymentDetail(1011);
        Payment payment2 = paymentManager.searchPaymentDetail(1020);
        Assert.assertNull(payment1);
        Assert.assertNotNull(payment2);
    }
    
    @Test
    public void TestUpdatePaymentDetail() throws ClassNotFoundException, SQLException {
        paymentManager.addPaymentDetail(1022, "card", "1593574862019537", "09/30", "321", "HoangSon");
        paymentManager.updatePaymentDetail(1022, "card", "8529637410456321", "09/30", "321", "HoangSon");
        Payment payment1 = paymentManager.searchPaymentDetail(1022);
        paymentManager.addPaymentDetail(1020, "card", "3216549870987654", "08/15", "123", "HoangSon");
        paymentManager.updatePaymentDetail(1022, "card", "3216549870987654", "09/26", "321", "HoangSon");
        Payment payment2 = paymentManager.searchPaymentDetail(1020);
        Assert.assertEquals("8529637410456321", payment1.getCardNumber());
        Assert.assertNotEquals("8529637410456321", payment2.getCardNumber());
    }
    
    @Test
    public void TestMakePayment() throws ClassNotFoundException, SQLException {
        paymentManager.addPayment(119,"card",500, "1593574862019537", "09/30", "321", "HoangSon", "18/05/2021");
        int paymentID1 = paymentManager.getPaymentId("1593574862019537");
        paymentManager.addPayment(119,"card",500, "3216549870987654", "08/15", "321", "HoangSon", "18/05/2021");
        int paymentID2 = paymentManager.getPaymentId("3216549870987654");
        Assert.assertEquals(146, paymentID1);
        Assert.assertNotEquals(142, paymentID2);
    }
    
    @Test
    public void TestShowPaymentHistory1() throws ClassNotFoundException, SQLException {
        paymentManager.addPayment(119,"card",500, "1593574862019537", "09/30", "321", "HoangSon", "18/05/2021");
        paymentManager.addHistory(1022,143,119,"card",500, "1593574862019537", "HoangSon", "18/05/2021");
        PaymentHistory payment1 = paymentManager.searchPaymentHistory(143,"18/05/2021");
        paymentManager.addPayment(119,"card",500, "8529637410456321", "08/15", "123", "HoangSon", "18/05/2021");
        paymentManager.addHistory(1022,140,119,"card",500, "8529637410456321", "HoangSon", "18/05/2021");
        PaymentHistory payment2 = paymentManager.searchPaymentHistory(140,"18/05/2021");
        Assert.assertNotEquals("8529637410456321", payment1.getCardNumber());
        Assert.assertEquals("8529637410456321", payment2.getCardNumber());
    }
    
    @Test(expected = NullPointerException.class)
    public void TestShowPaymentHistory2() throws ClassNotFoundException, SQLException {
        paymentManager.addPayment(119,"card",500, "3216549870987654", "08/15", "321", "HoangSon", "18/05/2021");
        PaymentHistory payment2 = paymentManager.searchPaymentHistory(142,"18/05/2021");
        Assert.assertEquals("3216549870987654",payment2.getCardNumber());
    }
    
    @Test
    public void TestValidate() throws ClassNotFoundException, SQLException {
        boolean check;
        //sucessful test case
        check=validate.checkEmpty("","");
        Assert.assertTrue(check);
        check=validate.checkEmpty("test1","");
        Assert.assertTrue(check);
        check=validate.checkEmpty("","test2");
        Assert.assertTrue(check);
        check=validate.validateID("1000");
        Assert.assertTrue(check);
        check=validate.validateEmail("test@gmail.com");
        Assert.assertTrue(check);
        check=validate.validateName("Kevin Murphy");
        Assert.assertTrue(check);
        check=validate.validatePhone("0123456789");
        Assert.assertTrue(check);
        check=validate.validatePassword("Qu!123456");
        Assert.assertTrue(check);
        check=validate.validateAddress("299 Lakemba st");
        Assert.assertTrue(check);
        check=validate.validateDate("2020-09-09");     
        Assert.assertTrue(check);
        
        //fail test case
        check=validate.checkEmpty("test1","test2");
        Assert.assertFalse(check);
        check=validate.validateID("");
        Assert.assertFalse(check);
        check=validate.validateID("1000/");
        Assert.assertFalse(check);
        check=validate.validateEmail("test@gmail.com/");
        Assert.assertFalse(check);
        check=validate.validateEmail("");
        Assert.assertFalse(check);
        check=validate.validateName("Kevin Murphy/");
        Assert.assertFalse(check);
        check=validate.validateName("Kevin/ Murphy");
        Assert.assertFalse(check);
        check=validate.validatePhone("0123456789/");
        Assert.assertFalse(check);
        check=validate.validatePhone("012345678");
        Assert.assertFalse(check);
        check=validate.validatePassword("Q!12");
        Assert.assertFalse(check);
        check=validate.validateAddress("299/ Lakemba st");
        Assert.assertFalse(check);
        check=validate.validateDate("202009-09");     
        Assert.assertFalse(check);
    }
}