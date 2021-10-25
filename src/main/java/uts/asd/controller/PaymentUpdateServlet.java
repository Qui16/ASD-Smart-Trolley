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
import uts.asd.model.*;
import uts.asd.model.dao.PaymentManager;

/**
 *
 * @author casio
 * This servlet use to update payment detail to the database
 */
public class PaymentUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String paymentMethod = request.getParameter("paymentMethod");
        String cardNumber = request.getParameter("cardNumber");
        String expiryDate = request.getParameter("expiryDate");
        String cvv = request.getParameter("cvv");
        String nameOnCard = request.getParameter("nameOnCard");
        PaymentManager paymentManager = (PaymentManager) session.getAttribute("paymentManager");
        Customer customer = (Customer) session.getAttribute("customer");

        try {//update payment detail to database
            int UserId = customer.getCustomerID();
            //int orderId = manager.getOrderId();
            //double orderPrice = manager.getPrice();
            System.out.println(UserId);
            paymentManager.updatePaymentDetail(UserId,paymentMethod, cardNumber, expiryDate, cvv, nameOnCard);
            System.out.print("updated Payment");
            request.getRequestDispatcher("Viewpayment.jsp").include(request, response);

        } catch (SQLException ex) {
            System.out.println("Error in PaymentUpdateServlet");
            Logger.getLogger(AccountCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
