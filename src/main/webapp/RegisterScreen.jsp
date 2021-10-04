<%-- 
    Document   : RegisterScreen
    Created on : 09/09/2021, 12:08:11 PM
    Author     : quyda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer Register </title>
        <link rel="stylesheet" href="./css/warning.css">

    </head>

    <%
        String emailErr = (String) session.getAttribute("emailErr");
        String passErr = (String) session.getAttribute("passErr");
        String nameErr = (String) session.getAttribute("nameErr");
        String phoneErr = (String) session.getAttribute("phoneErr");
        String addressErr = (String) session.getAttribute("addressErr");
        String dateErr = (String) session.getAttribute("dateErr");
        String existErr = (String) session.getAttribute("existErr");
        //String added = (String) session.getAttribute("added");

    %>
    <div style="padding-left:20px">
        <h1>Sign Up</h1>
        <form action="CustomerCreateServlet" method="post">
            <table class="table"> 
                <%if (nameErr == null) {%>              
                <tr><td>First Name:</td><td><input type="text"name="customerFName"></td></tr>
                <tr><td>Last Name:</td><td><input type="text"name="customerLName" ></td></tr>
                        <%} else {%>
                <tr><td>First Name:</td><td><input class="errorField" type="text"name="customerFName"></td><td class="error"><%=nameErr%></td></tr>
                <tr><td>Last Name:</td><td><input class="errorField" type="text"name="customerLName" ></td><td class="error"><%=nameErr%></td></tr>

                <%}%>
                <%if (emailErr == null) {%>
                <tr><td>Email:</td><td><input type="text" name="customerEmail" required></td></tr>
                        <%} else {%>
                <tr><td>Email:</td><td><input class="errorField" type="text" name="customerEmail" required></td><td class="error"><%=emailErr%></td></tr>

                <%}%>
                <%if (passErr == null) {%>
                <tr><td>Password:</td><td><input type="password" name="customerPassword" required></td></tr>
                <tr><td>Re-type Password:</td><td><input type="password" name="customerPassword2" required></td></tr>
                        <%} else if (passErr.equals("noMatch")) {%>
                <tr><td>Password:</td><td><input class="errorField" type="password" name="customerPassword" required></td></tr>
                <tr><td>Re-type Password:</td><td><input class="errorField" type="password" name="customerPassword2" required></td><td class="error">Password is not matched</td></tr>    
                        <%} else {%>
                <tr><td>Password:</td><td><input class="errorField" type="password" name="customerPassword" required></td><td class="error"><%=passErr%></td></tr>
                <tr><td>Re-type Password:</td><td><input class="errorField" type="password" name="customerPassword2" required></td><td class="error"><%=passErr%></td></tr>
                        <%}%>
                        <%if (phoneErr == null) {%>
                
                <tr><td>Phone Number:</td><td><input type="text" name="customerPhoneNum"></td></tr>   
                        <%} else {%>             
                <tr><td>Phone Number:</td><td><input class="errorField" type="text" name="customerPhoneNum"></td><td class="error"><%=phoneErr%></td></tr>

                <%}%>
                <%if (addressErr == null) {%>
                <tr><td>Address:</td><td><input type="text" name="customerAddress"></td></tr>   
                        <%} else {%>  
                <tr><td>Address:</td><td><input class="errorField" type="text" name="customerAddress"></td><td class="error"><%=addressErr%></td></tr>

                <%}%>
                <%if (dateErr == null) {%>
                <tr><td>DOB:</td><td><input type="date" name="customerDOB"></td><td> If null, current date will be assumed</td></tr>
                        <%} else {%>  
                <tr><td>DOB:</td><td><input class="errorField" type="date" name="customerDOB"></td><td class="error"><%=dateErr%></td></tr>
                        <%}%>
                <tr><td><input class="button" name="register" type="submit" value="Sign Up"></td></tr> 
            </table>      
        </form>
        <jsp:include page="/ConnServlet" flush="true"/> 
        <div>
            <%if (existErr.equals("existed")) {%>
            <p class="error" style="size: 30">Email existed! Please choose a different Email</p>
            <%}%>
        </div>
    </div>        
</html>
