/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import uts.asd.model.Customer;
import uts.asd.model.Item;
import uts.asd.model.Staff;
//import uts.asd.model.Staff;

/**
 *
 * @author quyda
 */
public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public Customer FindCustomerViaID(int customerID) throws SQLException {//find customer via ID
        //setup the select sql query string     
        String fetch = "select * from ASD.\"CUSTOMER\" where  \"Customer ID\"=" + customerID;
        //execute this query using the statement field       
        ResultSet rs = st.executeQuery(fetch);
        //add the results to a ResultSet       
        //search the ResultSet for a user using the parameters
        while (rs.next()) {
            int ID = rs.getInt(1);
            String customerEmail = rs.getString(2);
            String customerPassword = rs.getString(3);
            String customerFName = rs.getString(4);
            String customerLName = rs.getString(5);
            String customerPhoneNum = rs.getString(6);
            String customerAddress = rs.getString(7);
            String customerDOB = rs.getString(8);
            return new Customer(ID, customerEmail,customerPassword, customerFName, customerLName, customerPhoneNum, customerAddress, customerDOB);
        }

        return null;
    }

    public String FindCustomerPassViaID(int customerID) throws SQLException {//find the customer password via their ID
        //setup the select sql query string     
        String fetch = "select \"Customer Password\" from ASD.\"CUSTOMER\" where  \"Customer ID\"=" + customerID;
        //execute this query using the statement field       
        ResultSet rs = st.executeQuery(fetch);
        //add the results to a ResultSet       
        //search the ResultSet for a user using the parameters
        while (rs.next()) {
            String customerPassword = rs.getString(1);
            return customerPassword;
        }
        return null;
    }

    public Customer FindCustomer(int customerID, String customerPassword) throws SQLException {//find all information about customer using ID and password
        //setup the select sql query string     
        String fetch = "select * from ASD.\"CUSTOMER\" where  \"Customer ID\"=" + customerID + "AND \"Customer Password\"='" + customerPassword + "'";
        //execute this query using the statement field       
        ResultSet rs = st.executeQuery(fetch);
        //add the results to a ResultSet       
        //search the ResultSet for a user using the parameters
        while (rs.next()) {
            int ID = rs.getInt(1);
            String password = rs.getString(3);
            if (customerID == ID && password.equals(customerPassword)) {
                String customerEmail = rs.getString(2);
                String customerFName = rs.getString(4);
                String customerLName = rs.getString(5);
                String customerPhoneNum = rs.getString(6);
                String customerAddress = rs.getString(7);
                String customerDOB = rs.getString(8);
                return new Customer(ID, customerEmail, password, customerFName, customerLName, customerPhoneNum, customerAddress, customerDOB);
            }
        }
        return null;
    }

    public Customer FindCustomer2(String customerEmail, String customerPassword) throws SQLException {//find all information about customer via email and password (login)
        String fetch = "select * from ASD.\"CUSTOMER\" where  \"Customer Email\"='" + customerEmail + "'AND \"Customer Password\"='" + customerPassword + "'";
        ResultSet rs = st.executeQuery(fetch);
        //add the results to a ResultSet       
        //search the ResultSet for a user using the parameters
        while (rs.next()) {
            String email = rs.getString(2);
            String password = rs.getString(3);
            if (email.equals(customerEmail) && password.equals(customerPassword)) {
                int ID = rs.getInt(1);
                String customerFName = rs.getString(4);
                String customerLName = rs.getString(5);
                String customerPhoneNum = rs.getString(6);
                String customerAddress = rs.getString(7);
                String customerDOB = rs.getString(8);
                int customerPoint = rs.getInt(9);
                return new Customer(ID, customerPoint, customerEmail, password, customerFName, customerLName, customerPhoneNum, customerAddress, customerDOB);
            }
        }
        return null;
    }

    public int FindCustomerID(String customerEmail, String customerPassword) throws SQLException {//retreive customer ID
        String fetch = "select * from ASD.\"CUSTOMER\" where  \"Customer Email\"='" + customerEmail + "'AND \"Customer Password\"='" + customerPassword + "'";
        ResultSet rs = st.executeQuery(fetch);
        //add the results to a ResultSet       
        //search the ResultSet for a user using the parameters
        while (rs.next()) {
            String email = rs.getString(2);
            String password = rs.getString(3);
            if (email.equals(customerEmail) && password.equals(customerPassword)) {
                int ID = rs.getInt(1);
                return ID;
            }
        }
        return -1;
    }

    public boolean CustomerExist(String customerEmail) throws SQLException {//check if the email is already used to register
        String fetch = "select * from ASD.\"CUSTOMER\" where  \"Customer Email\"='" + customerEmail + "'";
        ResultSet rs = st.executeQuery(fetch);
        //add the results to a ResultSet       
        //search the ResultSet for a user using the parameters
        while (rs.next()) {
            String email = rs.getString(2);
            if (email.equals(customerEmail)) {
                return true;
            }
        }
        return false;
    }

    public boolean StaffExist(String staffEmail) throws SQLException {// check if the email is already used to register
        String fetch = "select * from ASD.\"STAFF\" where  \"Staff Email\"='" + staffEmail + "'";
        ResultSet rs = st.executeQuery(fetch);
        //add the results to a ResultSet       
        //search the ResultSet for a user using the parameters
        while (rs.next()) {
            String email = rs.getString(2);
            if (email.equals(staffEmail)) {
                return true;
            }
        }
        return false;
    }

    public int FindStaffID(String staffEmail, String staffPassword) throws SQLException {//find the staff ID using email and password
        String fetch = "select * from ASD.\"STAFF\" where  \"Staff Email\"='" + staffEmail + "'AND \"Staff Password\"='" + staffPassword + "'";
        ResultSet rs = st.executeQuery(fetch);
        //add the results to a ResultSet       
        //search the ResultSet for a user using the parameters
        while (rs.next()) {
            String email = rs.getString(2);
            String password = rs.getString(3);
            if (email.equals(staffEmail) && password.equals(staffPassword)) {
                int ID = rs.getInt(1);
                return ID;
            }
        }
        return -1;
    }

    public String FindStaffPassViaID(int staffID) throws SQLException {//find staff's password via ID
        //setup the select sql query string     
        String fetch = "select \"Staff Password\" from ASD.\"STAFF\" where  \"Staff ID\"=" + staffID;
        //execute this query using the statement field       
        ResultSet rs = st.executeQuery(fetch);
        //add the results to a ResultSet       
        //search the ResultSet for a user using the parameters
        while (rs.next()) {
            String staffPassword = rs.getString(1);
            return staffPassword;
        }

        return null;
    }

    public Staff FindStaff(int staffID, String staffPassword) throws SQLException {//find staff information via ID or password
        //setup the select sql query string     
        String fetch = "select * from ASD.\"STAFF\" where  \"Staff ID\"=" + staffID + "AND \"Staff Password\"='" + staffPassword + "'";
        //execute this query using the statement field       
        ResultSet rs = st.executeQuery(fetch);
        //add the results to a ResultSet       
        //search the ResultSet for a user using the parameters
        while (rs.next()) {
            int ID = rs.getInt(1);
            String password = rs.getString(3);
            if (staffID == ID && password.equals(staffPassword)) {
                String staffEmail = rs.getString(2);
                String staffFName = rs.getString(4);
                String staffLName = rs.getString(5);
                String staffPhoneNum = rs.getString(6);
                String staffAddress = rs.getString(7);
                String staffDOB = rs.getString(8);
                String staffRole = rs.getString(9);
                return new Staff(ID, staffEmail, password, staffFName, staffLName, staffPhoneNum, staffAddress, staffDOB, staffRole);
            }
        }
        return null;
    }

    public Staff FindStaff2(String staffEmail, String staffPassword) throws SQLException {//find staff information via email or password
        String fetch = "select * from ASD.\"STAFF\" where  \"Staff Email\"='" + staffEmail + "'AND \"Staff Password\"='" + staffPassword + "'";
        ResultSet rs = st.executeQuery(fetch);
        //add the results to a ResultSet       
        //search the ResultSet for a user using the parameters
        while (rs.next()) {
            String email = rs.getString(2);
            String password = rs.getString(3);
            if (email.equals(staffEmail) && password.equals(staffPassword)) {
                int ID = rs.getInt(1);
                String staffFName = rs.getString(4);
                String staffLName = rs.getString(5);
                String staffPhoneNum = rs.getString(6);
                String staffAddress = rs.getString(7);
                String staffDOB = rs.getString(8);
                String staffRole = rs.getString(9);
                return new Staff(ID, email, password, staffFName, staffLName, staffPhoneNum, staffAddress, staffDOB, staffRole);
            }
        }
        return null;
    }

    public void addCustomer(String customerEmail, String customerPassword, String customerFName,
            String customerLName, String customerPhoneNum, String customerAddress, String customerDOB) throws SQLException {//code for add-operation       
        String columns = "insert into ASD.\"CUSTOMER\"(\"Customer Email\",\"Customer Password\",\"Customer Firstname\",\"Customer Lastname\", \"Customer PhoneNum\",\"Customer Address\",\"Customer DOB\")";
        String values = "VALUES('" + customerEmail + "','" + customerPassword + "','" + customerFName + "','" + customerLName + "','" + customerPhoneNum + "','" + customerAddress + "','" + customerDOB + "')";
        st.executeUpdate(columns + values);
    }

    public void updateCustomer(int customerID, String customerEmail, String customerFName,
            String customerLName, String customerPhoneNum, String customerAddress, String customerDOB) throws SQLException {//code for add-operation       
        //update sql command
        String update = "UPDATE ASD.CUSTOMER SET \"Customer Email\"='" + customerEmail + "', \"Customer Firstname\"='" + customerFName + "',\"Customer Lastname\"='" + customerLName + "',\"Customer PhoneNum\"='" + customerPhoneNum + "', \"Customer Address\"='" + customerAddress + "',\"Customer DOB\"='" + customerDOB + "'where \"Customer ID\"=" + customerID;
        st.executeUpdate(update);
    }

    public void updateCustomerPass(int customerID, String customerPassword) throws SQLException {//code for add-operation       
        //update sql command
        String update = "UPDATE ASD.CUSTOMER SET \"Customer Password\"='" + customerPassword + "'where \"Customer ID\"=" + customerID;
        st.executeUpdate(update);
    }

    public void updateCustomerPoint(int customerID, int point) throws SQLException {//code for add-operation       
        //update sql command
        String update = "UPDATE ASD.CUSTOMER SET \"Customer Point\"='" + point + "'where \"Staff ID\"=" + customerID;
        st.executeUpdate(update);
    }

    public void deleteCustomer(int customerID) throws SQLException {
        //code for delete-operation   
        String delete = "DELETE FROM ASD.\"CUSTOMER\" WHERE \"Customer ID\"=" + customerID;
        st.executeUpdate(delete);
    }

    public void addStaff(String staffEmail, String staffPassword, String staffFName,
            String staffLName, String staffPhoneNum, String staffAddress, String staffDOB, String staffRole) throws SQLException {//code for add-operation           
        String columns = "insert into ASD.\"STAFF\"(\"Staff Email\",\"Staff Password\",\"Staff Firstname\",\"Staff Lastname\", \"Staff PhoneNum\",\"Staff Address\",\"Staff DOB\",\"Staff Role\")";
        String values = "VALUES('" + staffEmail + "','" + staffPassword + "','" + staffFName + "','" + staffLName + "','" + staffPhoneNum + "','" + staffAddress + "','" + staffDOB + "','" + staffRole + "')";
        st.executeUpdate(columns + values);
    }

    public void updateStaff(int staffID, String staffEmail, String staffFName,
            String staffLName, String staffPhoneNum, String staffAddress, String staffDOB) throws SQLException {//code for add-operation       
        //update sql command
        String update = "UPDATE ASD.STAFF SET \"Staff Email\"='" + staffEmail + "', \"Staff Firstname\"='" + staffFName + "',\"Staff Lastname\"='" + staffLName + "',\"Staff PhoneNum\"='" + staffPhoneNum + "', \"Staff Address\"='" + staffAddress + "',\"Staff DOB\"='" + staffDOB + "'where \"Staff ID\"=" + staffID;
        st.executeUpdate(update);
    }

    public void updateStaffPass(int staffID, String staffPassword) throws SQLException {//code for add-operation       
        //update sql command
        String update = "UPDATE ASD.STAFF SET \"Staff Password\"='" + staffPassword + "'where \"Staff ID\"=" + staffID;
        st.executeUpdate(update);
    }

    public void updateStaffRole(int staffID, String role) throws SQLException {//code for add-operation       
        //update sql command
        String update = "UPDATE ASD.STAFF SET \"Staff Role\"='" + role + "'where \"Staff ID\"=" + staffID;
        st.executeUpdate(update);
    }

    public void deleteStaff(int staffID) throws SQLException {
        //code for delete-operation   
        String delete = "DELETE FROM ASD.\"STAFF\" WHERE \"Staff ID\"=" + staffID;
        st.executeUpdate(delete);
    }
    
    // add item to database
    public void addItem(int ID, String name, float price, int quantity, String date, String region, String description) throws SQLException {      
        String columns = "insert into ASD.\"Items\"(\"Item ID\",\"Item Name\",\"Item Price\",\"Item Quantity\", \"Item ReceivedDate\",\"Item Region\",\"Item Description\")";
        String values = "VALUES('" + ID + "','" + name + "','" + price + "','" + quantity + "','" + date + "','" + region + "','" + description + "')";
        st.executeUpdate(columns + values);
    }
    
}
