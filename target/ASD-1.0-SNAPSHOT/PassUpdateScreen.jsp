<%-- 
    Document   : PassUpdateScreen
    Created on : 01/10/2021, 8:33:29 PM
    Author     : quyda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
        <link rel="stylesheet" href="./css/warning.css">
        <title>Update</title>
        <jsp:include page="/ConnServlet" flush="true"/>
    </head>
    <%
    String passErr = (String) session.getAttribute("passErr");
    %>
    <body>
        <%if (passErr == null) {%>              
                <tr><td>Password:</td> <td><input type="text" name="Password" value="${customer.customerPassword}"> </td> </tr>
                <tr><td>Re-type Password:</td><td><input class="errorField" type="password" name="customerPassword2" required></td><td>Leave null if no change</td></tr>
                <%} else if (passErr.equals("noMatch")) {%>
                <tr><td>Password:</td> <td><input type="password" name="Password" class="errorField" required ></td></tr> 
                <tr><td>Re-type Password:</td><td><input class="errorField" type="password" name="Password2" required></td><td class="error">Invalid password format!</td></tr>
                <%} else {%>
                <tr><td>Password:</td> <td><input type="password" name="Password" class="errorField" required ></td> <td class="error">Invalid password format!</td> </tr> 
                <tr><td>Re-type Password:</td><td><input class="errorField" type="password" name="Password2" required></td><td class="error"></tr>
                <%}%>
    </body>
</html>
