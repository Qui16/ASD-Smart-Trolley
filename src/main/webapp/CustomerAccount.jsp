<%-- 
    Document   : CustomerAccount
    Created on : 09/09/2021, 12:14:15 PM
    Author     : quyda
--%>

<%@page import="uts.asd.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hello</title>
    </head>
    <body>
        <h1>Display customer details</h1>
        <%
        String customerEmail=request.getParameter("customer_email");
        String customerName=request.getParameter("customer_name");
        
        
        %>
        <table id="customer">
           <tr><td>Customer Email: <td><td><%=customerName%></td></tr>
            <tr><td>Customer Name: <td> <td><%=customerEmail%></td></tr>                 
        </table>
    </body>
</html>
