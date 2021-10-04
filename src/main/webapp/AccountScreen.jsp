<%-- 
    Document   : AccountScreen
    Created on : 24/09/2021, 1:07:36 PM
    Author     : quyda
--%>

<%@page import="uts.asd.controller.Validator"%>
<%@page import="uts.asd.model.Staff"%>
<%@page import="uts.asd.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/button.css">
        <title>Account</title>
        <jsp:include page="/ConnServlet" flush="true"/>
    </head>
    <body>
        <div class="header">
            <div class="header-right">
            </div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="navBar.jsp"><h3>Home</h3></a>
                        </li>
                        <li>
                            <div class="position-absolute top-0 end-0">
                                <form action="LogoutServlet">
                                    <button type="submit"  class="btn btn-danger">Log Out</button>
                                </form>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <%
            Validator validate = new Validator();
            Customer customer = (Customer) session.getAttribute("customer");
            Staff staff = (Staff) session.getAttribute("staff");
            session.setAttribute("passUpdate", "");
            validate.clear(session);
        %>
        <%if (customer != null) {%>
    </div>
    <div style="padding-left:20px">
        <h1>Customer Profile</h1>
        <p><span class="tag">Customer ID: </span> ${customer.customerID}</p>
        <p><span class="tag">NAME: </span> <%=customer.getCustomerFName() + " " + customer.getCustomerLName()%></p>
        <p><span class="tag">EMAIL: </span> ${customer.customerEmail}</p>
        <%String password = customer.getCustomerPassword();%>
        <p><span class="tag">PASSWORD: </span><%=password.substring(0, 2) + "***" + password.substring(password.length() - 2, password.length())%></p>
        <p><span class="tag">PHONE: </span> ${customer.customerPhoneNum}</p>
        <p><span class="tag">ADDRESS: </span> ${customer.customerAddress}</p>
        <p><span class="tag">DATE OF BIRTH: </span> ${customer.customerDOB}</p>
        <p><span class="tag">Award Point: </span> ${customer.customerPoint}</p>
    </div>
    <div>
        <table>
            <tr>
                <td>
                    <form action="UpdateScreen.jsp" method="post">
                        <%session.setAttribute("customer", customer);
                            session.setAttribute("staff", null);
                            session.setAttribute("existErr", "");
                        %>
                        <button type="submit" class="btn btn-success">Update Details</button>
                    </form>
                </td>
                <td>
                    <form method="post" action="PassUpdateScreen.jsp">
                        <%session.setAttribute("customer", customer);
                            session.setAttribute("staff", null);
                        %>
                        <button type="submit" class="btn btn-warning">Change Password</button>
                    </form>
                </td>
            </tr>
        </table>
    </div>
    <div class="position-fixed bottom-0 end-0">
        <form action="DeleteServlet" method="post">
            <%session.setAttribute("customer", customer);
                session.setAttribute("staff", null);
            %>
            <input class="btn btn-danger"  name="delete" type="submit" value="Delete">
        </form>
    </div>
    <%} else if (staff != null) {%>
    <div style="padding-left:20px">
        <h1>Staff Profile</h1>
        <p><span class="tag">Staff ID: </span> ${staff.staffID}</p>
        <p><span class="tag">NAME: </span> <%=staff.getStaffFName() + " " + staff.getStaffLName()%></p>
        <p><span class="tag">EMAIL: </span> ${staff.staffEmail}</p>
        <%String password = staff.getStaffPassword();%>
        <p><span class="tag">PASSWORD: </span><%=password.substring(0, 2) + "***" + password.substring(password.length() - 2, password.length())%></p>
        <p><span class="tag">PHONE: </span> ${staff.staffPhoneNum}</p>
        <p><span class="tag">ADDRESS: </span> ${staff.staffAddress}</p>
        <p><span class="tag">DATE OF BIRTH: </span> ${staff.staffDOB}</p>
        <p><span class="tag">Role: </span> ${staff.staffRole}</p>
    </div>
    <div>
        <table>
            <tr>
                <td>
                    <form action="UpdateScreen.jsp" method="post">
                        <%session.setAttribute("staff", staff);
                            session.setAttribute("customer", null);
                            session.setAttribute("existErr", "");
                        %>
                        <button class="btn btn-success" type="submit">Update Details</button>          
                    </form>
                </td>
                <td>
                    <form action="StaffRegisterScreen.jsp">
                        <input class="btn btn-success" type="submit" value="Staff Register" />
                    </form>
                </td>
            </tr>
            <tr>
                <td>
                    <form method="post" action="PassUpdateScreen.jsp">
                        <%session.setAttribute("staff", staff);
                            session.setAttribute("customer", null);
                        %>
                        <button class="btn btn-warning" type="submit">Change Password</button>
                    </form>
                </td>
            </tr>
        </table>     
    </div>
    <div class="position-fixed bottom-0 end-0">
        <form action="DeleteServlet" method="post">
            <%session.setAttribute("staff", staff);
                session.setAttribute("customer", null);
            %>
            <input class="btn btn-danger" name="delete" type="submit"  value="Delete">
        </form>
    </div>
    <%}%>
</body>

</html>
