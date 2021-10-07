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
 */
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Session
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String paymentMethod = request.getParameter("paymentMethod");
        String cardNumber = request.getParameter("cardNumber");
        String cvv = request.getParameter("cvv");
        String nameOnCard = request.getParameter("nameOnCard");
        String expiryDate = request.getParameter("expiryDate");
        String datePaid = request.getParameter("datePaid");
        String check = request.getParameter("check");

        PaymentManager paymentManager = (PaymentManager) session.getAttribute("paymentManager");
        Customer customer = (Customer) session.getAttribute("customer");
        validator.clear(session);

        try {

            int orderId = 119;
            double orderPrice = 500.0;
            //double orderPrice = manager.getPrice();
            System.out.println(cardNumber);
            System.out.println(paymentMethod);
            System.out.println(cvv);
            System.out.println(nameOnCard);
            System.out.println(expiryDate);
            System.out.println(datePaid);
            System.out.println(orderId);
            System.out.println(orderPrice);
            paymentManager.addPayment(orderId, paymentMethod, orderPrice, cardNumber, expiryDate, cvv, nameOnCard, datePaid);
            
            Payment payment = new Payment(paymentMethod, cardNumber, expiryDate, cvv, nameOnCard, datePaid);
            int payment_Id = paymentManager.getPaymentId(cardNumber);
            paymentManager.addHistory(customer.getCustomerID(), payment_Id, orderId, paymentMethod, orderPrice, cardNumber, nameOnCard, datePaid);
            session.setAttribute("payment", payment);

            request.getRequestDispatcher("ConfirmPayment.jsp").forward(request, response);
            //}
        } catch (SQLException | NullPointerException ex) {
            request.getRequestDispatcher("Payment.jsp").include(request, response);
            Logger.getLogger(AccountCreateServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
}