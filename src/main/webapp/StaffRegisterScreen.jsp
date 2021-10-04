<%-- 
    Document   : StaffRegisterScreen
    Created on : 26/09/2021, 10:48:25 PM
    Author     : quyda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/warning.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <jsp:include page="/ConnServlet" flush="true"/>
        <title>Staff Register</title>
    </head>
    <%
        String emailErr = (String) session.getAttribute("emailErr");
        String passErr = (String) session.getAttribute("passErr");
        String nameErr = (String) session.getAttribute("nameErr");
        String phoneErr = (String) session.getAttribute("phoneErr");
        String addressErr = (String) session.getAttribute("addressErr");
        String dateErr = (String) session.getAttribute("dateErr");
    %>
    <body>
        <h1>Sign Up</h1>
        <div style="padding-left:10px;">
            <form action="AccountCreateServlet" method="post">
                <table class="table.table-borderless"> 
                    <%if (nameErr.equals("nameErr")) {%>                            
                    <tr><td>First Name:</td><td><input class="errorField" type="text"name="FName"></td><td class="error">Invalid format!</td></tr>
                    <tr><td>Last Name:</td><td><input class="errorField" type="text"name="LName" ></td><td class="error">Invalid format!</td></tr>
                            <%} else if (nameErr.equals("empty")) {%>
                    <tr><td>First Name:</td><td><input class="errorField" type="text"name="FName"></td><td class="error">Name can not be empty!</td></tr>
                    <tr><td>Last Name:</td><td><input class="errorField" type="text"name="LName" ></td></tr>
                            <%} else {%>
                    <tr><td>First Name:</td><td><input type="text"name="FName"></td></tr>
                    <tr><td>Last Name:</td><td><input type="text"name="LName" ></td></tr>

                    <%}%>
                    <%if (emailErr.equals("emailErr")) {%>
                    <tr><td>Email:</td><td><input class="errorField" type="text" name="Email" required></td><td class="error">Invalid format!</td></tr>
                            <%} else if (emailErr.equals("empty")) {%>
                    <tr><td>Email:</td><td><input type="text" name="Email" required></td><td class="error">Email can not be empty!</td></tr>
                            <%} else if (emailErr.equals("existed")) {%>
                    <tr><td>Email:</td><td><input type="text" name="Email" required></td><td class="error">Email existed! Please choose a different Email</td></tr>
                            <%} else {%>              
                    <tr><td>Email:</td><td><input type="text" name="Email" required></td></tr>
                            <%}%>

                    <%if (passErr.equals("passErr")) {%>
                    <tr><td>Password:</td><td><input class="errorField" type="password" name="Password" required></td><td class="error">Invalid Format!</td></tr>
                    <tr><td>Re-type Password:</td><td><input class="errorField" type="password" name="Password2" required></td></tr>
                            <%} else if (passErr.equals("noMatch")) {%>
                    <tr><td>Password:</td><td><input class="errorField" type="password" name="Password" required></td></tr>
                    <tr><td>Re-type Password:</td><td><input class="errorField" type="password" name="Password2" required></td><td class="error">Password is not matched</td></tr>    
                            <%} else {%>
                    <tr><td>Password:</td><td><input type="password" name="Password" required></td></tr>
                    <tr><td>Re-type Password:</td><td><input type="password" name="Password2" required></td></tr>
                            <%}%>

                    <%if (phoneErr.equals("phoneErr")) {%>               
                    <tr><td>Phone Number:</td><td><input class="errorField" type="text" name="PhoneNum"></td><td class="error">Invalid format!</td></tr>
                            <%} else {%>                        
                    <tr><td>Phone Number:</td><td><input type="text" name="PhoneNum"></td></tr> 
                            <%}%>

                    <%if (addressErr.equals("addressErr")) {%>               
                    <tr><td>Address:</td><td><input class="errorField" type="text" name="Address"></td><td class="error">Invalid format!</td></tr>
                            <%} else {%>  
                    <tr><td>Address:</td><td><input type="text" name="Address"></td></tr>

                    <%}%>
                    <%if (dateErr.equals("dateErr")) {%>               
                    <tr><td>DOB:</td><td><input class="errorField" type="date" name="DOB"></td><td class="error">Invalid format!</td></tr>
                            <%} else {%>  
                    <tr><td>DOB:</td><td><input type="date" name="DOB"></td><td> If null, current date will be assumed</td></tr>
                            <%}%> 
                    <tr>
                        <td>Role: </td>
                        <td>
                            <select name="staffRole">
                                <option value="System Admin">System Admin</option>
                                <option value="Customer Service">Customer Service</option>
                                <option value="Manager">Product & Content Admin</option>                              
                            </select>
                        </td>
                    </tr> 

                    <tr><td><a href="navBar.jsp" class="btn btn-secondary">Cancel</a></td><td><button type="submit" name="register" class="btn btn-success">Sign Up</button></td></tr>
                </table> 
                <%
                    session.setAttribute("customerCreate", "");
                    session.setAttribute("staffCreate", "true");
                %>
            </form>
        </div>
    </body>
</html>

