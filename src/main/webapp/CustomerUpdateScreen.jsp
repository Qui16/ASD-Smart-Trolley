<%-- 
    Document   : CustomerUpdateScreen
    Created on : 25/09/2021, 4:31:29 PM
    Author     : quyda
--%>

<%@page import="uts.asd.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
    </head>
    
    <body>
        <h3>Update Profile</h3>
        <%
        Customer customer= (Customer) session.getAttribute("customer");
        %>
        <div>
            <form action="CustomerUpdateServlet" method="post">
            <table class="table"> 
                <tr><td>Customer ID: </td><td>${customer.customerID}</td></tr>
                <tr><td>FIRST NAME: </td><td><input type="text" name="customerFName" value="<%=customer.getCustomerFName()%>"></td></tr>
                <tr><td>LAST NAME: </td><td><input type="text" name="customerLName" value="<%=customer.getCustomerLName()%>"></td></tr>
                <tr><td>Email:</td><td><input type="text" name="customerEmail" value="${customer.customerEmail}"> </td></tr>
                <tr><td>Password:</td> <td><input type="text" name="customerPassword" value="${customer.customerPassword}"> </td> </tr>            
                <tr><td>Phone Number:</td><td><input type="text" name="customerPhoneNum"value="${customer.customerPhoneNum}"></td></tr>   
                <tr><td>Address:</td><td><input type="text" name="customerAddress"value="<%=customer.getCustomerAddress()%>"></td></tr>   
                <tr><td>DOB:</td><td><input type="date" name="customerDOB"value="${customer.customerDOB}"></td>                  
                </tr>   
                <tr><td><input name="update" type="submit" value="Save"></td></tr> 
            </table>               
        </form>
        </div>
       
    </body>
</html>
