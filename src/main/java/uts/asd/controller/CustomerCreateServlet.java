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


/**
 *
 * @author quyda
 */
public class CustomerCreateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            String customerEmail=request.getParameter("customerEmail");
            String customerFName=request.getParameter("customerFName");
            String customerLName=request.getParameter("customerLName");
            String customerPassword=request.getParameter("customerPassword");
            String customerPhoneNum=request.getParameter("customerPhoneNum");
            String customerAddress=request.getParameter("customerAddress");
            String customerDOB=request.getParameter("customerDOB");
            
            
           
                               
            DBManager manager=(DBManager) session.getAttribute("manager");
            try{
                if(!customerEmail.isEmpty() && !customerPassword.isEmpty() && (!customerFName.isEmpty() || !customerLName.isEmpty())){
                if(customerDOB.equals("")){
                    LocalDate date=LocalDate.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    customerDOB=date.format(formatter);
                }
                manager.addCustomer(customerEmail, customerPassword, customerFName, customerLName,customerPhoneNum,customerAddress,customerDOB);
                int ID=manager.FindCustomerID(customerEmail, customerPassword);
                Customer customer=new Customer(ID,customerEmail,customerPassword,
                customerFName,customerLName,customerPhoneNum,customerAddress,customerDOB);
                session.setAttribute("customer",customer);
                session.setAttribute("added","added");
                request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
                }
                else{
                session.setAttribute("notAdded","notAdded");
                request.getRequestDispatcher("RegisterScreen.jsp").forward(request, response);
                }
            }
            catch(SQLException ex){
             request.getRequestDispatcher("RegisterScreen.jsp").include(request, response);
             Logger.getLogger(CustomerCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    
    
    }
    


