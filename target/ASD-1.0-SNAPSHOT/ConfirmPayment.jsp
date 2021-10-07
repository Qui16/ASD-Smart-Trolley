<%-- 
    Document   : ConfirmPayment
    Created on : 10 Sep 2021, 11:41:41
    Author     : casio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.asd.model.Customer"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <title> Payment Confirmation</title>
</head>

<body>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <a class="navbar-brand" href="navBar.jsp">Smart Trolley</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto topnav">
                    <li class="nav-item">
                        <a class="nav-link" href="navBar.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link btn btn-primary text-white" type="button" href="AccountScreen.jsp" data-toggle="modal" data-target="#myModal">Profile<span class="sr-only">(current)</a>                  
                    </li>
                </ul>
            </div>
        </nav>
    <%
        int id = 0;
        Customer customer = (Customer) session.getAttribute("customer");
        String paymentMethod = request.getParameter("paymentMethod");
        String cardNumber = request.getParameter("cardNumber");
        String cvv = request.getParameter("cvv");
        String nameOnCard = request.getParameter("nameOnCard");
        String expiryDate = request.getParameter("expiryDate");
        String datePaid = request.getParameter("datePaid");
    %>
    <% if (customer != null ) {
        id = customer.getCustomerID();
    } %>
    <div class="container-fluid">
        <form action="Payment.jsp" method="post">
            <table class="table table-responsive" id="users">
                <tr><td>Customer Id:#</td><td><%= id%></td></tr>
                <tr><td>Order Id:#</td><td>${orderId}</td></tr>
                <tr><td>Payment Method:</td><td><%= paymentMethod%></td></tr>
                <tr><td>Amount :$</td><td><%= 500%></td></tr>
                <tr><td>Date Paid:</td><td><%= datePaid%></td></tr>
                <tr><td>Card Number:</td><td><%= cardNumber%></td></tr>
                <tr><td>Expiry Date:</td><td><%= expiryDate%></td></tr>
                <tr><td>CVV:</td><td><%= cvv%></td></tr>
                <tr><td>Name On Card:</td><td><%= nameOnCard%></td></tr>
                <tr><td>
                        <input type="submit" value="Cancel" class="button" name = "submit" id="submit">
                    </td></tr>
            </table>
        </form>
        <form action="PaymentSuccess.jsp">
            <input type="submit" value="Confirm" />
        </form>
    </div>        
</body>
</html>
