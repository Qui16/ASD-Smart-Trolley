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

        //System.out.println("I'm doing something to setup the system ready for the test");
    }

//This method will be called after each test
    @After
    public void Teardown() throws ClassNotFoundException, SQLException {
        connector.closeConnection();       
        //System.out.println("I'm doing something to tidy up after the test");
    }

    @Test
    public void TestCustomerLogin() throws ClassNotFoundException, SQLException {
        //System.out.println("I'm a test doing some stuff");
        Customer customer1=manager.FindCustomer2("test9@gmail.com", "Quy!1234");
        Assert.assertNotNull(customer1);
        
    }

    @Test
    public void TestStaffLogin() throws ClassNotFoundException, SQLException {
        //System.out.println("I'm another test doing some stuff");
        Staff staff1=manager.FindStaff2("test4@gmail.com", "Quy!1235");
        Assert.assertNotNull(staff1);
    }
}
