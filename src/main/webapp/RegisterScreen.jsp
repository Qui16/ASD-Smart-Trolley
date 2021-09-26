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
    </head>
   
    
    <div style="padding-left:20px">
        <h1>Sign Up</h1>
        <form action="CustomerCreateServlet" method="post">
            <table class="table"> 
                <tr><td>First Name:</td><td><input type="text"name="customerFName"></td></tr>
                <tr><td>Last Name:</td><td><input type="text"name="customerLName"></td></tr>
                <tr><td>Email:</td><td><input type="text" name="customerEmail"></td></tr>
                <tr><td>Password:</td><td><input type="password" name="customerPassword"></td></tr>
                <tr><td>Phone Number:</td><td><input type="text" name="customerPhoneNum"></td></tr>   
                <tr><td>Address:</td><td><input type="text" name="customerAddress"></td></tr>   
                <tr><td>DOB:</td><td><input type="date" name="customerDOB"></td>
                    <td><label>If null, current date will be assumed</label></td>
                </tr>   
                <tr><td><input class="button" name="register" type="submit" value="Sign Up"></td></tr> 
            </table>
        </form>
    </div>
    <jsp:include page="/ConnServlet" flush="true"/>
</html>
