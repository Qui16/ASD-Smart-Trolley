<%-- 
    Document   : welcome
    Created on : 09/04/2021, 8:46:02 AM
    Author     : liamtran
--%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/register.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <div class="header">
        <a href="#default" class="logo">Main Page</a>
        <div class="header-right">
            <a href="logout.jsp">Logout</a>
            <a href="profile.jsp">Profile</a>
        </div>
    </div>
    
    <%
        User user = (User)session.getAttribute("user");
    %>
    
    <div style="padding-left:20px">
        <p>You are logged in as <span class="tag">${user.name}, < ${user.email} ></span> </p> 
    </div>
       
</html>
