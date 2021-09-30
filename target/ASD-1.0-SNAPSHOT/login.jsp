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
        <link rel="stylesheet" href="./css/warning.css">
    </head>
    <body>
        <%String validate = (String)session.getAttribute("authentication");%>
    <h1>Login page</h1>
    <div style="padding-left:20px">
        <form action="LoginServlet" method="post">
            <table class="table">
                <tr><td>Email:</td><td><input type="text" name="Email" required></td></tr>
                <tr><td>Password:</td><td><input type="password" name="Password" required></td></tr>
                <tr><td><input class="button" name="login" type="submit" value="Sign In"></td></tr>
            </table>    
        </form>
    </div>
    <%
        if(validate!=null){
        if (validate.equals("invalid")) {
    %>
    <div>
    <label class="error" >Illegal character(s) detected! Please recheck the input</label>
    </div>
    <%} else if (validate.equals("unknow")) {%>
    <div>
    <label class="error" >Wrong email or password!</label>
    </div>
    <%}}%>
    
    <jsp:include page="/ConnServlet" flush="true"/>
    </body>

</html>
