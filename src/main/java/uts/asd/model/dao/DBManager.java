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
//import uts.asd.model.Staff;
/**
 *
 * @author quyda
 */
public class DBManager {
    private Statement st;
    
    public DBManager(Connection conn) throws SQLException{
    st=conn.createStatement();
    }
    
    public Customer FindCustomerViaID(int customerID) throws SQLException{
    //setup the select sql query string     
    String fetch="select * from QUY.\"CUSTOMER\" where  \"Customer ID\"="+customerID;
   //execute this query using the statement field       
    ResultSet rs= st.executeQuery(fetch);
   //add the results to a ResultSet       
   //search the ResultSet for a user using the parameters
   while(rs.next()){
        int ID=rs.getInt(1);
        String customerEmail=rs.getString(2);
        String customerFName =rs.getString(4);
        String customerLName=rs.getString(5);
        String customerPhoneNum=rs.getString(6);
        String customerAddress=rs.getString(7);
        String customerDOB=rs.getString(8);
        return new Customer(ID,customerEmail, customerFName,customerLName,customerPhoneNum,customerAddress,customerDOB);
   } 
   
   return null;
    }
    
    public Customer FindCustomer(int customerID, String customerPassword ) throws SQLException {       
   //setup the select sql query string     
    String fetch="select * from QUY.\"CUSTOMER\" where  \"Customer ID\"="+customerID+"AND \"Customer Password\"='"+customerPassword+"'" ;
   //execute this query using the statement field       
    ResultSet rs= st.executeQuery(fetch);
   //add the results to a ResultSet       
   //search the ResultSet for a user using the parameters
    while (rs.next()){
      int  ID=rs.getInt(1);
       String password=rs.getString(3);
       if(customerID==ID && password.equals(customerPassword) ){
           String customerEmail=rs.getString(2);
           String customerFName =rs.getString(4);
           String customerLName=rs.getString(5);
           String customerPhoneNum=rs.getString(6);
           String customerAddress=rs.getString(7);
           String customerDOB=rs.getString(8);
           return new Customer(ID,customerEmail,password,customerFName,customerLName,customerPhoneNum,customerAddress,customerDOB);
       }  
   }                 
   return null;   
}
    public Customer FindCustomer2(String customerEmail, String customerPassword) throws SQLException{
    String fetch="select * from QUY.\"CUSTOMER\" where  \"Customer Email\"="+customerEmail+"AND \"Customer Password\"='"+customerPassword+"'";
    ResultSet rs= st.executeQuery(fetch);
    //add the results to a ResultSet       
    //search the ResultSet for a user using the parameters
    while (rs.next()){
      String email=rs.getString(2);
      String password=rs.getString(3);
       if(email==customerEmail && password.equals(customerPassword) ){
           int  ID=rs.getInt(1);
           String customerFName =rs.getString(4);
           String customerLName=rs.getString(5);
           String customerPhoneNum=rs.getString(6);
           String customerAddress=rs.getString(7);
           String customerDOB=rs.getString(8);
           return new Customer(ID,customerEmail,password,customerFName,customerLName,customerPhoneNum,customerAddress,customerDOB);
       } 
    }   
    return null;
    }
    
    //Find user by email and password in the database   
    
    
    public void addCustomer (String customerEmail,String customerPassword,String customerFName,
            String customerLName,String customerPhoneNum,String customerAddress,String customerDOB) throws SQLException {//code for add-operation       
     
   //String columns1 = "INSERT INTO QUY.\"SHIPMENT\"(\"Order ID\",\"Shipment Method\",\"Shipment Address\",\"Delivery Date\")";
   String columns= "insert into QUY.\"CUSTOMER\"(\"Customer Email\",\"Customer Password\",\"Customer Firstname\",\"Customer Lastname\", \"Customer PhoneNum\",\"Customer Address\",\"Customer DOB\")";
   String values =  "VALUES("+customerEmail+",'"+customerPassword+"','"+customerFName+"','"+customerLName+"','"+customerPhoneNum+"','"+customerAddress+"','"+customerDOB+"')"; 
   st.executeUpdate(columns+values);
}

    public void updateCustomer (int customerID,String customerEmail,String customerPassword,String customerFName,
            String customerLName,String customerPhoneNum,String customerAddress,String customerDOB) throws SQLException {//code for add-operation       
   //update sql command
   String update="UPDATE QUY.CUSTOMER SET \"Customer Email\"=' "+customerEmail+" ',\"Customer Password\"=' "+customerPassword+" '. \"Customer Firstname\"=' "+customerFName+" ',\"Customer Lastname\"=' "+customerLName+" ',\"Customer PhoneNum\"=' "+customerPhoneNum+" '. \"Customer Address\"=' "+customerAddress+" ',\"Customer DOB\"=' "+customerDOB+" 'where \"Customer ID\"="+customerID;
   st.executeUpdate(update);
}

    public void deleteCustomer(int customerID) throws SQLException{       
   //code for delete-operation   
   String delete = "DELETE FROM QUY.\"CUSTOMER\" WHERE \"Customer ID\"="+customerID;
   st.executeUpdate(delete);
}

}
