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
        <title>Update</title>
        <jsp:include page="/ConnServlet" flush="true"/>
    </head>
    
    <body>
        <div class="header-right">
            <a href="AccountScreen.jsp">My Account</a>
        </div>
        <h3>Update Profile</h3>
        <%
        Customer customer= (Customer) session.getAttribute("customer");
        Staff staff=(Staff)session.getAttribute("staff");
        %>
        <%if(customer!=null){%>
        <div>
            <form action="UpdateServlet" method="post">
            <table class="table"> 
                <tr><td>Customer ID: </td><td>${customer.customerID}</td></tr>
                <tr><td>FIRST NAME: </td><td><input type="text" name="FName" value="<%=customer.getCustomerFName()%>"></td></tr>
                <tr><td>LAST NAME: </td><td><input type="text" name="LName" value="<%=customer.getCustomerLName()%>"></td></tr>
                <tr><td>Email:</td><td><input type="text" name="Email" value="${customer.customerEmail}"> </td></tr>
                <tr><td>Password:</td> <td><input type="text" name="Password" value="${customer.customerPassword}"> </td> </tr>            
                <tr><td>Phone Number:</td><td><input type="text" name="PhoneNum"value="${customer.customerPhoneNum}"></td></tr>   
                <tr><td>Address:</td><td><input type="text" name="Address"value="<%=customer.getCustomerAddress()%>"></td></tr>   
                <tr><td>DOB:</td><td><input type="date" name="DOB"value="${customer.customerDOB}"></td>                  
                </tr>   
                <tr><td><input name="update" type="submit" value="Save"></td></tr> 
            </table>               
        </form>
        </div>
        <%}else if(staff!=null){%>
        <div>
            <form action="UpdateServlet" method="post">
            <table class="table"> 
                <tr><td>Staff ID: </td><td>${staff.staffID}</td></tr>
                <tr><td>FIRST NAME: </td><td><input type="text" name="FName" value="<%=staff.getStaffFName()%>"></td></tr>
                <tr><td>LAST NAME: </td><td><input type="text" name="LName" value="<%=staff.getStaffLName()%>"></td></tr>
                <tr><td>Email:</td><td><input type="text" name="Email" value="${staff.staffEmail}"> </td></tr>
                <tr><td>Password:</td> <td><input type="text" name="Password" value="${staff.staffPassword}"> </td> </tr>            
                <tr><td>Phone Number:</td><td><input type="text" name="PhoneNum"value="${staff.staffPhoneNum}"></td></tr>   
                <tr><td>Address:</td><td><input type="text" name="Address"value="<%=staff.getStaffAddress()%>"></td></tr>   
                <tr><td>DOB:</td><td><input type="date" name="DOB"value="${staff.staffDOB}"></td>                  
                </tr>   
                <tr><td><input name="update" type="submit" value="Save"></td></tr> 
            </table>               
        </form>
        </div>
        <%}%>
    </body>
</html>
