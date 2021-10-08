<%-- 
    Document   : homeMain
    Created on : 2021. 10. 7, 오후 9:39:27
    Author     : 61451
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="uts.asd.model.dao.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="uts.asd.model.Item"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Scan Page</title>
    </head>
    <body>
        <h1>Scaned Page</h1>
        
        <div class="topcorner"><a class="tableButton" href="homeScreen.jsp">Go Home</a >
        </div> 
        
        <form method="post" action="homeMain.jsp">
    <table>
        <tr>
           <th>Scan Methods</th>
           <td>
               <input type="radio" name="method" value="id">Scan by ID
               <input type="radio" name="method" value="name">Scan by Name
           </td>
           <td><input type="submit" value="Confirm"><td>
         </tr>
     </table>
</form>

<%
    String method = request.getParameter("method");
    if(method != null){
%>

<form method="get" action="SearchItemListServlet">
     <table>
          <% if(method.equals("id")) { %>
          <tr>
              <th>Scan by ID</th>
              <td><input type="text" name="id" required></td>
              <td><input type="submit" value="Search"></td>
          </tr> <%}else{%>
          <tr>
              <th>Scan by Name</th>
              <td><input type="text" name="date" required></td>
               <td><input type="submit" value="Search"></td>
          </tr><%}%>
    </table>
</form>
<%}%>
            <div align="center">
        <table border="1" cellpadding="7">
                <caption><h2>Scaned result</h2></caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>ReceiveDate</th>
                <th>Region</th>
                <th>Description</th>
            </tr>
            <%
                ArrayList<Item> items = (ArrayList<Item>)session.getAttribute("items");
                
                for(Item s: items) {
            %>
                <tr>
                    <td><%=s.getId()%></td>
                    <td><%=s.getName()%></td>
                    <td><%=s.getPrice()%></td>
                    <td><%=s.getQuantity()%></td>
                    <td><%=s.getReceiveDate()%></td>
                    <td><%=s.getRegion()%></td>
                    <td><%=s.getDescription()%></td>
                </tr
                <%}%>
        </table>
    </div>   
    </body>
    </body>
</html>
