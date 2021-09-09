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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.asd.model.Customer;
// import uts.asd.model.dao.DBManager;

/**
 *
 * @author quyda
 */
public class CustomerCreateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            String customer_email=request.getParameter("customer_email");
            String customer_name=request.getParameter("customer_name");
            String customer_password=request.getParameter("customer_password");
            
            session.setAttribute("customer_email",customer_email);
            session.setAttribute("customer_name",customer_name);
            session.setAttribute("customer_password",customer_password);
            request.getRequestDispatcher("CustomerAccount.jsp").forward(request,response);
    }
    
    
    }
    


