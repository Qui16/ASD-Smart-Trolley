<%-- 
    Document   : navBar
    Created on : 10/09/2021, 5:39:41 AM
    Author     : clint
--%>

<%@page import="uts.asd.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Navigation Bar import</title>
    </head>
    <%
       Customer user = (Customer)session.getAttribute("user");
    %>
    <body>
        <header>
            <nav>
                <ul class="menu">
                  <li><a href="./index.jsp">Home</a></li>
                  <li><a href="./listProduct.jsp">Browse</a></li>
                  <li><a href="Payment.jsp">Checkout</a></li>

                  <div class="search-container">
                    <form action="">
                      <%
                        if (user != null) {
                      %>
                      <li><a href="./account.jsp">${user.firstName}'s Account</a></li>
                        <%
                            if(user.isStaff()) {
                        %>
                        <li><a href="./staff.jsp"> Staff Menu</a></li>
                        <%
                            }
                            if(user.isAdmin()) {
                        %>
                        <li><a href="./admin.jsp"> Admin Menu</a></li>
                      <%
                            }
                        } else {
                      %>
                      <li><a href="./shoppingCart.jsp">Cart</a></li>  
                      <li><a href="./RegisterScreen.jsp">Register</a></li>
                      <li><a href="./login.jsp">Login</a></li>
                      <%
                          }
                      %>
                      <%
                        if (user != null) {
                      %>
                      <li><a href="LogoutServlet">Logout</a></li>
                      <%
                        }
                      %>
                      <button type="submit">Submit</button>
                      <input id="searchbar" type="text" placeholder="Search.." />
                    </form>
                  </div>
                </ul>
            </nav>
        </header>
    </body>
</html>