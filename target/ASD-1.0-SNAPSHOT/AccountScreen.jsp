<%-- 
    Document   : AccountScreen
    Created on : 24/09/2021, 1:07:36 PM
    Author     : quyda
--%>

<%@page import="uts.asd.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
    </head>
    <body>
        <link rel="stylesheet" href="./css/button.css">
        <div class="header">
        <a href="#default" class="logo">Profile</a>
        <div class="header-right">
            <a href="account.jsp">Account</a>
            <a href="index.jsp">Logout</a>
        </div>
        <%
        Customer customer= (Customer) session.getAttribute("customer");
        %>
        </div>
        <div style="padding-left:20px">
        <h1>Customer Profile</h1>
        <p><span class="tag">Customer ID: </span> ${customer.customerID}</p>
        <p><span class="tag">NAME: </span> <%=customer.getCustomerFName()+" "+customer.getCustomerLName()%></p>
        <p><span class="tag">EMAIL: </span> ${customer.customerEmail}</p>
        <%String password=customer.getCustomerPassword();%>
        <p><span class="tag">PASSWORD: </span><%=password.substring(0, 2)+"***"+password.substring(password.length()-2,password.length()-1)  %></p>
        <p><span class="tag">PHONE: </span> ${customer.customerPhoneNum}</p>
        <p><span class="tag">ADDRESS: </span> ${customer.customerAddress}</p>
        <p><span class="tag">DATE OF BIRTH: </span> ${customer.customerDOB}</p>
    </div>
    <div>
        <form action="CustomerUpdateScreen.jsp" method="post">
            <%session.setAttribute("customer", customer);%>
        <input type="submit" value="Update" />
        </form>
   </div>
         <div>
             <form action="CustomerDeleteServlet" method="post">
                <%session.setAttribute("customer", customer);%>
                <input class="button"  name="delete" type="submit" value="Delete">
            </form>
        </div>
    </body>
    <jsp:include page="/ConnServlet" flush="true"/>
</html>
