/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.model.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author quyda
 */
public class DBConnector1 extends DB1 {
    public DBConnector1() throws ClassNotFoundException, SQLException{
    Class.forName(driver);
    conn=DriverManager.getConnection(URL+db,dbuser,dbpass);
    
    }
    public Connection openConnection(){
    return this.conn;
    }
    public void closeConnection() throws SQLException{
    this.conn.close();
    }
    
}
