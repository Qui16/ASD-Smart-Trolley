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
import java.util.logging.Level;
import java.util.logging.Logger;
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

    //This method will be called before each test
    @Before
    public void SetUp() throws ClassNotFoundException, SQLException {

        connector = new DBConnector();
        conn = connector.openConnection();
        manager = new DBManager(conn);

        
    }

//This method will be called after each test
    @After
    public void Teardown() throws ClassNotFoundException, SQLException {
        connector.closeConnection();       
        
    }

    @Test
    public void TestCustomerLogin() throws ClassNotFoundException, SQLException {
        Customer customer1=manager.FindCustomer2("test9@gmail.com", "Quy!1234");
        System.out.println(customer1.getCustomerAddress());
        Customer customer2=manager.FindCustomer2("test9@gmail/", "Quy!1234");
        Customer customer3=manager.FindCustomer2("test9@gmail.com", "Quy!124");
        Assert.assertNotNull(customer1);
        Assert.assertNull(customer2);
        Assert.assertNull(customer3);
        
    }

    @Test
    public void TestStaffLogin() throws ClassNotFoundException, SQLException {
        Staff staff1=manager.FindStaff2("test4@gmail.com", "Quy!1235");
        Staff staff2=manager.FindStaff2("test4@gmail/", "Quy!1235");
        Staff staff3=manager.FindStaff2("test4@gmail.com", "Quy!135");
        Assert.assertNotNull(staff1);
        Assert.assertNull(staff2);
        Assert.assertNull(staff3);
    }
}
