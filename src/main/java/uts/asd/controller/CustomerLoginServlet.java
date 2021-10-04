/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.controller;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.asd.model.Customer;
import uts.asd.model.dao.DBManager;
/**
 *
 * @author quyda
 */

public class CustomerLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    HttpSession session = request.getSession();
    String customerEmail=request.getParameter("customerEmail");
    String customerPassword=request.getParameter("customerPassword");
    DBManager manager=(DBManager) session.getAttribute("manager");
    
    try{
    Customer customer=manager.FindCustomer2(customerEmail, customerPassword);
        if(customer!=null){
            session.setAttribute("customer",customer);
            session.setAttribute("added","added");
            request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
        }
        else{
            session.setAttribute("authentication","invalid");
            request.getRequestDispatcher("login.jsp").forward(request, response);   
        }
    
    }
    catch(SQLException ex){
    request.getRequestDispatcher("navBar.jsp").include(request, response);
    Logger.getLogger(AccountCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

