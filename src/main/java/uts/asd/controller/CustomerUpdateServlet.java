/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.controller;

import java.io.IOException;
import static java.lang.Integer.parseInt;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
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
public class CustomerUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer=(Customer) session.getAttribute("customer");
        int customerID = customer.getCustomerID();
        String customerEmail = request.getParameter("customerEmail");
        String customerFName = request.getParameter("customerFName");
        String customerLName = request.getParameter("customerLName");
        String customerPassword = request.getParameter("customerPassword");
        String customerPhoneNum = request.getParameter("customerPhoneNum");
        String customerAddress = request.getParameter("customerAddress");
        String customerDOB = request.getParameter("customerDOB");
        DBManager manager = (DBManager) session.getAttribute("manager");
        try {
            manager.updateCustomer(customerID, customerEmail, customerPassword, customerFName, customerLName, customerPhoneNum, customerAddress, customerDOB);
            customer = new Customer(customerID,customerEmail,customerPassword,customerFName,customerLName,customerPhoneNum,customerAddress,customerDOB);
            session.setAttribute("customer", customer);
            request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
        } catch (SQLException ex) {
            request.getRequestDispatcher("navBar.jsp").include(request, response);
            Logger.getLogger(CustomerCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
