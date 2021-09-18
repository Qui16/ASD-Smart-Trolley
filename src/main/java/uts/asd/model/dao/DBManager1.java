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
public class DBManager1 {
    private Statement st;
    public DBManager1(Connection conn) throws SQLException{
    st=conn.createStatement();
    }
    
    
}
