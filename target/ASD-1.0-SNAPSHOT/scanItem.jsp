<%-- 
    Document   : scanItem
    Created on : 2021. 9. 9, 오후 7:45:18
    Author     : 61451
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Scan Item Page</title>
    </head>
    <body>
        <div class="header">
            <div class="header-content">
                <div class="logo">
                    <h3>Item Scan Page</h3>
                </div>
            </div>
        </div>
        <%
            String existItemErr = (String) session.getAttribute("existItemErr");
        %>
        <div class="container">
            <h1>Scan Item <span id="message"> <%=(existItemErr != null ? existItemErr : "")%> </span></h1>
            <form action="SearchItemListServlet" method="get">
            <table class="tablecenter">
                <tr><td>Code (ID):</td><td><input type="text" placeholder="Enter Code (id)" name="id" required></td></tr>
                <tr><td>Name:</td><td><input type="name" placeholder="Enter name (not required)" name="name"></td></tr>
                <tr><td></td>
                    <td>
                        <a href="homeScreen.jsp" class="tableButton">Cancel</a>
                        <input class="tableButton" type="submit" value="Search">
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </body>
</html>
