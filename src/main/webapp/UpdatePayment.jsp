<%-- 
    Document   : Update Payment
    Created on : 10 Sep 2021, 12:33:43
    Author     : casio
    Page use to update payment detail
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.asd.model.Customer"%>
<!DOCTYPE html>
<html>
    <%
        Customer customer = (Customer) session.getAttribute("customer");
        String cardNoErr = (String) session.getAttribute("cardNoErr");
        String cvvErr = (String) session.getAttribute("cvvErr");
        String expErr = (String) session.getAttribute("expErr");
    %>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <title>Update Payment Page</title>
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
        </nav><!-- update the payment detail like create but send data to update servlet -->
        <form action="PaymentUpdateServlet" method="post">
            <table class="table table-responsive">
                
                <tr><td>Customer Id:#</td><td>${customer.customerID}</td></tr>
                
                <tr>
                    <td>
                        <select class="select" type="text" name="paymentMethod">
                            <option value="empty">Payment Method</option>
                            <option value="card">Credit Card</option>
                            <option value="cash">Cash</option>
                            <option value="other">Other</option>                                                                
                        </select>                                   
                    </td>
                </tr>
                <%if (cardNoErr.equals("cardNoErr")) {%>
                <tr><td>Card Number</td><td><input class="errorField" type="text" name="cardNumber" required=""/></td><td class="error">Invalid format!</td></tr>
                <%} else {%>
                <tr><td>Card Number</td><td><input type="text" name="cardNumber" required=""/></td></tr>
                <%}%>
                <tr><td>Expiry Date</td><td><input type="text" name="expiryDate" required=""/></td></tr>
                <%if (cvvErr.equals("cvvErr")) {%>
                <tr><td>CVV</td><td><input class="errorField" type="password" name="cvv"/></td><td class="error">Invalid format!</td></tr>
                <%} else {%>
                <tr><td>CVV</td><td><input type="password" name="cvv"/></td></tr>
                <%}%>
                <tr><td>Name On Card</td><td><input type="text" name="nameOnCard" required=""/></td></tr>
                <tr><td>Agree to Terms of Service</td><td><input type="checkbox" name="tos" id="tos"/></td></tr>
                <tr><td>
                        <input type="submit" value="Save" class="button" name = "submit" id="submit" disabled>
                    </td></tr>
            </table>
        </form>
        <script>
            var checker = document.getElementById("tos");
            var send = document.getElementById("submit");
            this.onchange = function () {
                if (checker.checked) {
                    send.disabled = false;
                } else {
                    send.disabled = true;
                }
            };
        </script>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>

