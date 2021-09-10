<%-- 
    Document   : LoginScreen
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
        <form action="CustomerAccount.jsp" method="post">
            <table class="table"> 
                <tr><td>Name:</td><td><input type="text" name="customer_name"></td></tr>
                <tr><td>Email:</td><td><input type="text" name="customer_email"></td></tr>
                <tr><td>Password:</td><td><input type="password" name="customer_password"></td></tr>               
                <tr><td><input class="button" name="login" type="submit" value="Sign In"></td></tr> 
            </table>
        </form>
    </div>
</html>
