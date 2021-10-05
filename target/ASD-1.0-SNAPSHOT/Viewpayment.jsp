<%-- 
    Document   : Viewpayment
    Created on : 5 Oct 2021, 16:51:00
    Author     : casio
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.asd.model.Customer"%>
<%@page import="uts.asd.model.Payment"%>
<%@page import="uts.asd.model.dao.PaymentManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <title>Payment Details</title>
</head>

<body>
    <%
        Customer customer = (Customer) session.getAttribute("customer");
        PaymentManager paymentManager = (PaymentManager) session.getAttribute("paymentManager");
        Payment payment = paymentManager.searchPaymentDetail(customer.getCustomerID());
        String paymentMethod = payment.getCardNumber();
        String cardNumber = payment.getCardNumber();
        String cvv = payment.getCvv();
        String nameOnCard = payment.getNameOnCard();
        String expiryDate = payment.getExpiryDate();   
    %>
    <div class="container-fluid">
        <form action="CreatePayment.jsp" method="post">
            <table class="table table-responsive" id="users">
                <tr><td>Customer Id:#</td><td>${customer.customerID}</td></tr>
                <tr><td>Payment Method:</td><td><%= paymentMethod%></td></tr>
                <tr><td>Card Number:</td><td><%= cardNumber%></td></tr>
                <tr><td>Expiry Date:</td><td><%= expiryDate%></td></tr>
                <tr><td>CVV:</td><td><%= cvv%></td></tr>
                <tr><td>Name On Card:</td><td><%= nameOnCard%></td></tr>
                <tr><td>
                        <input type="submit" value="Update" class="button" name = "submit" id="submit">
                    </td></tr>
            </table>
        </form>
        <form action="DeletePaymentServlet" method="post">
            <input type="submit" value="Delete" />
        </form>
    </div>        
</body>
</html>

