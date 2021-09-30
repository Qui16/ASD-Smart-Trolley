/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.asd.model.Customer;
import uts.asd.model.dao.DBManager;
import uts.asd.controller.Validator;

/**
 *
 * @author quyda
 */
public class CustomerCreateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String customerEmail = request.getParameter("customerEmail");
        String customerFName = request.getParameter("customerFName");
        String customerLName = request.getParameter("customerLName");
        String customerPassword = request.getParameter("customerPassword");
        String customerPassword2 = request.getParameter("customerPassword2");
        String customerPhoneNum = request.getParameter("customerPhoneNum");
        String customerAddress = request.getParameter("customerAddress");
        String customerDOB = request.getParameter("customerDOB");
        boolean checked = true;
        Validator validate = new Validator();
        DBManager manager = (DBManager) session.getAttribute("manager");
        try {
            validate.clear(session);
            if (!manager.CustomerExist(customerEmail)) {

                if ((!validate.checkEmpty(customerEmail, customerPassword)) && (!customerFName.isEmpty() || !customerLName.isEmpty())) {

                    if (customerDOB.equals("")) {
                        LocalDate date = LocalDate.now();
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                        customerDOB = date.format(formatter);
                    }
                    if (!validate.validateEmail(customerEmail)) {
                        session.setAttribute("emailErr", "emailErr");
                        checked = false;
                    }
                    if (!validate.validatePassword(customerPassword)) {
                        session.setAttribute("passErr", "passErr");
                        checked = false;
                    }
                    if (!customerPassword.equals(customerPassword2)) {
                        session.setAttribute("passErr", "noMatch");
                        checked = false;
                    }
                    if (!customerFName.isEmpty() || !customerLName.isEmpty()) {
                        if (!validate.validateName(customerFName) || !validate.validateName(customerLName)) {
                            session.setAttribute("nameErr", "nameErr");
                            checked = false;
                        }
                    }

                    if (!customerPhoneNum.isEmpty()) {
                        if (!validate.validatePhone(customerPhoneNum)) {
                            session.setAttribute("phoneErr", "phoneErr");
                            checked = false;
                        }
                    }

                    if (!customerAddress.isEmpty()) {
                        if (!validate.validateAddress(customerAddress)) {
                            session.setAttribute("addressErr", "addressErr");
                            checked = false;
                        }
                    }

                    if (!validate.validateDate(customerDOB)) {
                        session.setAttribute("dateErr", "dateErr");
                        checked = false;
                    }
                    if (checked) {
                        manager.addCustomer(customerEmail, customerPassword, customerFName, customerLName, customerPhoneNum, customerAddress, customerDOB);
                        int ID = manager.FindCustomerID(customerEmail, customerPassword);
                        Customer customer = new Customer(ID, customerEmail, customerPassword,
                                customerFName, customerLName, customerPhoneNum, customerAddress, customerDOB);
                        session.setAttribute("customer", customer);
                        //session.setAttribute("added", "added");
                        request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
                    } else {
                        //session.setAttribute("added", "notAdded");
                        request.getRequestDispatcher("RegisterScreen.jsp").forward(request, response);
                    }

                } else {
                    request.getRequestDispatcher("RegisterScreen.jsp").forward(request, response);
                }

            } else {
                session.setAttribute("existErr", "existed");
                request.getRequestDispatcher("RegisterScreen.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            request.getRequestDispatcher("RegisterScreen.jsp").include(request, response);
            Logger.getLogger(CustomerCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
