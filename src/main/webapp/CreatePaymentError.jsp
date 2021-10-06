<%-- 
    Document   : CreatePaymentError
    Created on : 6 Oct 2021, 11:37:17
    Author     : casio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.asd.model.Customer"%>

<!DOCTYPE html>
<html>
    <%
        Customer customer = (Customer) session.getAttribute("customer");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Success Page</title>
    </head>
    <body>
        <h3>You already have a payment detail!</h3>
        <h3>Each customer only have one payment detail</h3>
        <form action="AccountScreen.jsp">
                                <%session.setAttribute("customer", customer);%>
                                <body onload = "check()">
                                    <button class="btn btn-primary" type="submit" id="submit" >Go back to account page</button>
                            </form>
    </body>
</html>
