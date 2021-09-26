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
import uts.asd.model.Staff;
import uts.asd.model.dao.DBManager;

/**
 *
 * @author quyda
 */
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Staff staff=(Staff) session.getAttribute("staff");
        Customer customer=(Customer) session.getAttribute("customer");
        String Email = request.getParameter("Email");
        String FName = request.getParameter("FName");
        String LName = request.getParameter("LName");
        String Password = request.getParameter("Password");
        String PhoneNum = request.getParameter("PhoneNum");
        String Address = request.getParameter("Address");
        String DOB = request.getParameter("DOB");
        DBManager manager = (DBManager) session.getAttribute("manager");
        try {
            if(customer!=null){
            int ID=customer.getCustomerID();
            manager.updateCustomer(ID, Email, Password, FName, LName, PhoneNum, Address, DOB);
            customer = new Customer(ID, Email, Password, FName, LName, PhoneNum, Address, DOB);
            session.setAttribute("customer", customer);
            
            request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
            }
            else if(staff!=null){
            int ID=staff.getStaffID();
            manager.updateStaff(ID, Email, Password, FName, LName, PhoneNum, Address, DOB);
            staff = new Staff(ID, Email, Password, FName, LName, PhoneNum, Address, DOB);
            session.setAttribute("staff", staff);
            
            request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            request.getRequestDispatcher("navBar.jsp").include(request, response);
            Logger.getLogger(CustomerCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
}
