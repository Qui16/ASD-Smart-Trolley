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
public class CreatePaymentServlet extends HttpServlet {

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
        boolean checked = true;
        PaymentManager paymentManager = (PaymentManager) session.getAttribute("paymentManager");
        Customer customer = (Customer) session.getAttribute("customer");
        
        //ScanCart orders = (ScanCart) session.getAttribute("order");
        validator.clear(session);

        try {
            if (!validator.validateCardNo(cardNumber)) {//validate card number format
                    session.setAttribute("cardNoErr", "cardNoErr");
                    checked = false;
                }
            //if (!validator.validateExp(expiryDate)) {//validate expiry date format
                    //session.setAttribute("expErr", "expErr");
                    //checked = false;
                //}
            if (!validator.validateCVV(cvv)) {//validate cvv format
                    session.setAttribute("cvvErr", "cvvErr");
                    checked = false;
                }
            if(checked){
   
            //double orderPrice = orders.getTotalPrice();
            //int order_Id = (int)session.getAttribute("orderId");
            int UserId = customer.getCustomerID();
            //double orderPrice = manager.getPrice();
            //session.setAttribute("INVOICE_ID", invoice_Id);
            //session.setAttribute("PAY_ID", payment_Id);
            paymentManager.addPaymentDetail(UserId, paymentMethod, cardNumber, expiryDate, cvv, nameOnCard);
            //int payment_Id = paymentManager.getPaymentId(cardNumber);
            //payment = paymentManager.searchPayment(payment_Id, datePaid);
            //paymentManager.addHistory(user.getCustomerID(), payment_Id, orderId, paymentMethod, orderPrice, cardNumber, nameOnCard, datePaid);
            request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
            }
            else{
                request.getRequestDispatcher("CreatePayment.jsp").include(request, response);
            }
        } catch (SQLException | NullPointerException ex) {
            request.getRequestDispatcher("Payment.jsp").include(request, response);
            Logger.getLogger(AccountCreateServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
}