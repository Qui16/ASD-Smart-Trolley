<%-- 
    Document   : login
    Created on : 23/09/2021, 1:41:49 PM
    Author     : quyda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>       
        <title>Welcome</title>
    </head>
    
        <h1>Login page</h1>
        <div style="padding-left:20px">
        <form action="CustomerLoginServlet" method="post">
            <table class="table">
            <tr><td>Email:</td><td><input type="text" name="customerEmail"></td></tr>
            <tr><td>Password:</td><td><input type="password" name="customerPassword"></td></tr>
            <tr><td><input class="button" name="login" type="submit" value="Sign In"></td></tr>
            </table>    
        </form>
        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
</html>
