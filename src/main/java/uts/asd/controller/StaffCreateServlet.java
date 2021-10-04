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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.asd.model.Staff;
import uts.asd.model.dao.DBManager;

/**
 *
 * @author quyda
 */
public class StaffCreateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     HttpSession session = request.getSession();
            String staffEmail=request.getParameter("staffEmail");
            String staffFName=request.getParameter("staffFName");
            String staffLName=request.getParameter("staffLName");
            String staffPassword=request.getParameter("staffPassword");
            String staffPhoneNum=request.getParameter("staffPhoneNum");
            String staffAddress=request.getParameter("staffAddress");
            String staffDOB=request.getParameter("staffDOB");
            String staffRole=request.getParameter("staffRole");
            
            
           
                               
            DBManager manager=(DBManager) session.getAttribute("manager");
            try{
                if(!staffEmail.isEmpty() && !staffPassword.isEmpty() && (!staffFName.isEmpty() || !staffLName.isEmpty())){
                if(staffDOB.equals("")){
                    LocalDate date=LocalDate.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    staffDOB=date.format(formatter);
                }
                manager.addStaff(staffEmail, staffPassword, staffFName, staffLName,staffPhoneNum,staffAddress,staffDOB,staffRole);
                int ID=manager.FindStaffID(staffEmail, staffPassword);
                Staff staff=new Staff(ID,staffEmail,staffPassword,
                staffFName,staffLName,staffPhoneNum,staffAddress,staffDOB,staffRole);
                session.setAttribute("staff",staff);
                session.setAttribute("added","added");
                request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
                }
                else{
                session.setAttribute("notAdded","notAdded");
                request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
                }
            }
            catch(SQLException ex){
             request.getRequestDispatcher("navBar.jsp").include(request, response);
             Logger.getLogger(StaffCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
}

