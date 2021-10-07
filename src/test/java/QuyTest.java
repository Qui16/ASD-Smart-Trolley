/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author quyda
 */
import java.sql.Connection;
import java.sql.SQLException;
import javax.faces.validator.Validator;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import uts.asd.model.Customer;
import uts.asd.model.Staff;
import uts.asd.model.dao.DBConnector;
import uts.asd.model.dao.DBManager;


public class QuyTest {

    private DBConnector connector;
    private Connection conn;
    private DBManager manager;
    private uts.asd.controller.Validator validate = new uts.asd.controller.Validator();

    //This method will be called before each test
    @Before
    public void SetUp() throws ClassNotFoundException, SQLException {

        connector = new DBConnector();
        conn = connector.openConnection();
        manager = new DBManager(conn);  
        uts.asd.controller.Validator validate = new uts.asd.controller.Validator();

        
    }

//This method will be called after each test
    @After
    public void Teardown() throws ClassNotFoundException, SQLException {
        connector.closeConnection();       
        
    }

    @Test
    public void TestCustomerLogin() throws ClassNotFoundException, SQLException {
        Customer customer1=manager.FindCustomer2("test9@gmail.com", "Quy!1234");
        Customer customer2=manager.FindCustomer2("test9@gmail/", "Quy!1234");
        Customer customer3=manager.FindCustomer2("test9@gmail.com", "Quy!124");
        Assert.assertNotNull(customer1);
        Assert.assertNull(customer2);
        Assert.assertNull(customer3);
        
    }

    @Test
    public void TestStaffLogin() throws ClassNotFoundException, SQLException {
        Staff staff1=manager.FindStaff2("test4@gmail.com", "Quy!1234");
        Staff staff2=manager.FindStaff2("test4@gmail/", "Quy!1235");
        Staff staff3=manager.FindStaff2("test4@gmail.com", "Quy!135");
        Assert.assertNotNull(staff1);
        Assert.assertNull(staff2);
        Assert.assertNull(staff3);
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
