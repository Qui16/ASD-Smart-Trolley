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
public class AccountUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Staff staff = (Staff) session.getAttribute("staff");
        Customer customer = (Customer) session.getAttribute("customer");
        String passUpdate = (String) session.getAttribute("passUpdate");
        DBManager manager = (DBManager) session.getAttribute("manager");
        Validator validate = new Validator();
        boolean checked = true;
        boolean passChecked = true;

        try {
            validate.clear(session);
            if (passUpdate.equals("")) {
                String Email = request.getParameter("Email");
                String FName = request.getParameter("FName");
                String LName = request.getParameter("LName");
                String PhoneNum = request.getParameter("PhoneNum");
                String Address = request.getParameter("Address");
                String DOB = request.getParameter("DOB");

                    if (Email.isEmpty()) {
                        session.setAttribute("emailErr", "empty");
                        checked = false;
                    } else if (!validate.validateEmail(Email)) {
                        session.setAttribute("emailErr", "emailErr");
                        checked = false;
                    }

                    if (customer != null) {
                        if (!Email.equals(customer.getCustomerEmail())) {
                            if (manager.CustomerExist(Email) || manager.StaffExist(Email)) {
                                session.setAttribute("emailErr", "existed");
                                checked = false;
                            }
                        }
                    } else if(staff!=null) {
                        if (!Email.equals(staff.getStaffEmail())) {
                            if (manager.CustomerExist(Email) || manager.StaffExist(Email)) {
                                session.setAttribute("emailErr", "existed");
                                checked = false;
                            }
                        }
                    }

                    if (FName.isEmpty() && LName.isEmpty()) {
                        session.setAttribute("nameErr", "empty");
                        checked = false;
                    } else if (!FName.isEmpty() || !LName.isEmpty()) {
                        if (!validate.validateName(FName) || !validate.validateName(LName)) {
                            session.setAttribute("nameErr", "nameErr");
                            checked = false;
                        }
                    }

                    if (!PhoneNum.isEmpty()) {
                        if (!validate.validatePhone(PhoneNum)) {
                            session.setAttribute("phoneErr", "phoneErr");
                            checked = false;
                        }
                    }

                    if (!Address.isEmpty()) {
                        if (!validate.validateAddress(Address)) {
                            session.setAttribute("addressErr", "addressErr");
                            checked = false;
                        }
                    }

                    if (!validate.validateDate(DOB)) {
                        session.setAttribute("dateErr", "dateErr");
                        checked = false;
                    }
               

                if (checked) {
                    if (customer != null) {
                        int ID = customer.getCustomerID();
                        manager.updateCustomer(ID, Email, FName, LName, PhoneNum, Address, DOB);
                        customer = new Customer(ID, Email, customer.getCustomerPassword(), FName, LName, PhoneNum, Address, DOB);
                        session.setAttribute("customer", customer);
                        request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
                    } else if (staff != null) {
                        int ID = staff.getStaffID();
                        manager.updateStaff(ID, Email, FName, LName, PhoneNum, Address, DOB);
                        staff = new Staff(ID, Email, staff.getStaffPassword(), FName, LName, PhoneNum, Address, DOB);
                        session.setAttribute("staff", staff);
                        request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
                    }

                } else {
                    request.getRequestDispatcher("UpdateScreen.jsp").include(request, response);
                }
            } else if (passUpdate.equals("true")) {
                String Password0 = request.getParameter("Password0");//current password
                String Password = request.getParameter("Password");//new password
                String Password2 = request.getParameter("Password2");//retype new passsword
                if (!validate.checkEmpty(Password, Password2)) {
                    if (!validate.validatePassword(Password) && !validate.validatePassword(Password2)) {
                        session.setAttribute("passErr", "passErr");
                        passChecked = false;
                    }
                    if (!Password.equals(Password2)) {
                        session.setAttribute("passErr", "noMatch");
                        passChecked = false;
                    }
                    if (passChecked) {
                        if (customer != null) {
                            String truePassword = manager.FindCustomerPassViaID(customer.getCustomerID());
                            if (truePassword.equals(Password0)) {
                                manager.updateCustomerPass(customer.getCustomerID(), Password);
                                customer.setCustomerPassword(Password);
                                request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
                            } else {
                                session.setAttribute("passErr", "wrongPass");
                                request.getRequestDispatcher("PassUpdateScreen.jsp").forward(request, response);
                            }
                        } else if (staff != null) {
                            String truePassword = manager.FindStaffPassViaID(staff.getStaffID());
                            if (truePassword.equals(Password0)) {
                                manager.updateStaffPass(staff.getStaffID(), Password);
                                staff.setStaffPassword(Password);
                                request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
                            } else {
                                session.setAttribute("passErr", "wrongPass");
                                request.getRequestDispatcher("PassUpdateScreen.jsp").forward(request, response);
                            }
                        }
                    } else {
                        request.getRequestDispatcher("PassUpdateScreen.jsp").include(request, response);
                    }
                } else {
                    request.getRequestDispatcher("UpdateScreen.jsp").include(request, response);
                }
            }
        } catch (SQLException ex) {
            request.getRequestDispatcher("UpdateScreen.jsp").include(request, response);
            Logger.getLogger(AccountCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
