<%-- 
    Document   : CustomerUpdateScreen
    Created on : 25/09/2021, 4:31:29 PM
    Author     : quyda
--%>

<%@page import="uts.asd.model.Staff"%>
<%@page import="uts.asd.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/warning.css">
        <link rel="stylesheet" href="./css/button.css">
        <title>Update</title>       
    </head>

    <body>
        <div class="header-right">
            <a href="AccountScreen.jsp">My Account</a>
        </div>
        <h3>Update Profile</h3>
        <%
            Customer customer = (Customer) session.getAttribute("customer");
            Staff staff = (Staff) session.getAttribute("staff");

            String emailErr = (String) session.getAttribute("emailErr");
            String nameErr = (String) session.getAttribute("nameErr");
            String phoneErr = (String) session.getAttribute("phoneErr");
            String addressErr = (String) session.getAttribute("addressErr");
            String dateErr = (String) session.getAttribute("dateErr");
            String existErr = (String) session.getAttribute("existErr");
            /*
            String nameErr = "err";
            String emailErr = "err";
            String passErr = "err";
            String phoneErr = "err";
            String addressErr = "err";
            String dateErr = "err";*/
        %>
        <%if (customer != null) {%>
        <div>
            <form action="UpdateServlet" method="post">
                <table class="table"> 
                    <tr><td>Customer ID: </td><td>${customer.customerID}</td></tr>
                    <%if (nameErr.equals("")) {%>
                    <tr><td>FIRST NAME: </td><td><input type="text" name="FName" value="<%=customer.getCustomerFName()%>"></td></tr>
                    <tr><td>LAST NAME: </td><td><input type="text" name="LName" value="<%=customer.getCustomerLName()%>"></td></tr>
                            <%} else {%>
                    <tr><td>FIRST NAME: </td><td><input type="text" class="errorField" name="FName"></td><td class="error">Invalid name format!</td></tr>
                    <tr><td>LAST NAME: </td><td><input type="text" class="errorField" name="LName"></td><td class="error">Invalid name format!</td></tr>
                            <%}%>

                    <%if (emailErr.equals("emailErr")) {%>
                    <tr><td>Email:</td><td><input type="text" name="Email" class="errorField"></td><td class="error">Invalid email format!</td></tr>
                            <%} else if (emailErr.equals("existed")) {%>
                    <tr><td>Email:</td><td><input type="text" name="Email" class ="errorField"></td><td class="error">Email existed! Please choose a different Email</td></tr>
                            <%} else {%>
                    <tr><td>Email:</td><td><input type="text" name="Email" value="${customer.customerEmail}"></td></tr>      
                            <%}%>

                    <%if (phoneErr.equals("")) {%>
                    <tr><td>Phone Number:</td><td><input type="text" name="PhoneNum"value="${customer.customerPhoneNum}"></td></tr>  
                            <%} else {%>
                    <tr><td>Phone Number:</td><td><input type="text" name="PhoneNum" class="errorField"></td><td class="error">Invalid Phone Number format!</td></tr> 
                            <%}%>

                    <%if (addressErr.equals("")) {%>
                    <tr><td>Address:</td><td><input type="text" name="Address"value="<%=customer.getCustomerAddress()%>"></td></tr>   
                            <%} else {%>
                    <tr><td>Address:</td><td><input type="text" name="Address" class="errorField"></td><td class="error">Invalid Address format!</td></tr>
                            <%}%>

                    <%if (dateErr.equals("")) {%>
                    <tr><td>DOB:</td><td><input type="date" name="DOB"value="${customer.customerDOB}"></td>             
                            <%} else {%>
                    <tr><td>DOB:</td><td><input type="date" name="DOB" class="errorField"><td class="error">Invalid DOB format!</td></td> 
                            <%}%>
                    </tr>   
                    <tr><td><input name="update" type="submit" value="Save"></td></tr> 
                </table>
            </form>          
            <form method="post" action="AccountScreen.jsp">
                <button type="submit">Cancel</button>
            </form>
        </div>

        <%} else if (staff != null) {%>
        <div>
            <form action="UpdateServlet" method="post">
                <table class="table">               
                    <tr><td>Staff ID: </td><td>${staff.staffID}</td></tr>
                    <%if (nameErr.equals("nameErr")) {%>                 
                    <tr><td>FIRST NAME: </td><td><input type="text" class="errorField" name="FName"></td><td class="error">Invalid name format!</td></tr>
                    <tr><td>LAST NAME: </td><td><input type="text" class="errorField" name="LName"></td><td class="error">Invalid name format!</td></tr>
                            <%} else if (nameErr.equals("empty")) {%> 
                    <tr><td>FIRST NAME: </td><td><input type="text" class="errorField" name="FName"></td><td class="error">Name can not leave empty!</td></tr>
                    <tr><td>LAST NAME: </td><td><input type="text" class="errorField" name="LName"></td></tr>
                            <%} else {%>
                    <tr><td>FIRST NAME: </td><td><input type="text" name="FName" value="<%=staff.getStaffFName()%>"></td></tr>
                    <tr><td>LAST NAME: </td><td><input type="text" name="LName" value="<%=staff.getStaffLName()%>"></td></tr>
                            <%}%>

                    <%if (emailErr.equals("emailErr")) {%>                  
                    <tr><td>Email:</td><td><input type="text" name="Email" class="errorField"></td><td class="error">Invalid email format!</td></tr>
                            <%} else if (emailErr.equals("existed")) {%>
                    <tr><td>Email:</td><td><input type="text" name="Email" class ="errorField"></td><td class="error">Email existed! Please choose a different Email</td></tr>
                            <%} else if (emailErr.equals("empty")) {%>
                    <tr><td>Email:</td><td><input type="text" name="Email" class ="errorField"></td><td class="error">Email can not leave empty!</td></tr>        
                            <%} else {%>
                    <tr><td>Email:</td><td><input type="text" name="Email" value="${staff.staffEmail}"></td></tr>
                            <%}%>

                    <%if (phoneErr.equals("")) {%>
                    <tr><td>Phone Number:</td><td><input type="text" name="PhoneNum"value="${staff.staffPhoneNum}"></td></tr>  
                            <%} else {%>
                    <tr><td>Phone Number:</td><td><input type="text" name="PhoneNum" class="errorField"></td><td class="error">Invalid Phone Number format!</td></tr> 
                            <%}%>

                    <%if (addressErr.equals("")) {%>
                    <tr><td>Address:</td><td><input type="text" name="Address"value="<%=staff.getStaffAddress()%>"></td></tr>   
                            <%} else {%>
                    <tr><td>Address:</td><td><input type="text" name="Address" class="errorField"></td><td class="error">Invalid Address format!</td></tr>
                            <%}%>

                    <%if (dateErr.equals("")) {%>
                    <tr><td>DOB:</td><td><input type="date" name="DOB"value="${staff.staffDOB}"></td>             
                            <%} else {%>
                    <tr><td>DOB:</td><td><input type="date" name="DOB" class="errorField"><td class="error">Invalid DOB format!</td></td> 
                            <%}%>
                    </tr>   
                    <tr><td><input name="update" type="submit" value="Save"></td></tr> 
                </table>                       
            </form>
            <div>
            </div>
            <form method="post" action="AccountScreen.jsp">
                <button type="submit">Cancel</button>
            </form>
        </div>
        <%}%>
        <%session.setAttribute("passUpdate", "");%>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
