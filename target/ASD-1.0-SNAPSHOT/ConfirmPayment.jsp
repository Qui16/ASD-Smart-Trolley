<%-- 
    Document   : ConfirmPayment
    Created on : 10 Sep 2021, 11:41:41
    Author     : casio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <title> Payment Confirmation</title>
</head>

<body>
    <%
        String paymentMethod = request.getParameter("paymentMethod");
        String cardNumber = request.getParameter("cardNumber");
        String cvv = request.getParameter("cvv");
        String nameOnCard = request.getParameter("nameOnCard");
        String expiryDate = request.getParameter("expiryDate");
        String datePaid = request.getParameter("datePaid");
    %>
    <div class="container-fluid">
        <form action="Payment.jsp" method="post">
            <table class="table table-responsive" id="users">
                <tr><td>User Id:#</td><td><%= 100%></td></tr>
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
