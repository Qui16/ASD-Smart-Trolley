<%-- 
    Document   : ItemList
    Created on : 2021. 9. 9, 오후 7:44:53
    Author     : 61451
--%>
<%@page import="uts.asd.model.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
             <title>Item List Page</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String quantity = request.getParameter("quantity");
            String receiveDate = request.getParameter("receiveDate");
            String region = request.getParameter("region");
            String category = request.getParameter("category");
            String description = request.getParameter("description");
        if (id == null) {  
        %>
        <h1> Sorry, There is no items added.</h1>
        <a href="homeScreen.jsp">Click here to go back</a>
            
        <%} else {%>
        <table>
            <tr>
                <td>id</td>
                <td>name</td>
                <td>price</td>
                <td>quantity</td>
                <td>receiveDate</td>
                <td>region</td>
                <td>category</td>
                <td>description</td>
            </tr>
            <tr>
                <td><%=id%></td>
                <td><%=name%></td>
                <td><%=price%></td>
                <td><%=quantity%></td>
                <td><%=receiveDate%></td>
                <td><%=region%></td>
                <td><%=category%></td>
                <td><%=description%></td>
            </tr>
        </table>
        
        <div clas="panel_div">
            <a class="button" href="index.jsp">Back to DashBoard/ Home Screen</a>
        </div>
        <% 
            Item item = new Item (id, name, price, quantity, receiveDate, region, category, description);
            session.setAttribute("item", item);
        %>
        <%}%>
    </body>
</html>