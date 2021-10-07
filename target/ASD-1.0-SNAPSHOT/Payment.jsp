<%-- 
    Document   : Payment
    Created on : 10 Sep 2021, 12:33:43
    Author     : casio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.asd.model.Customer"%>
<%@page import="uts.asd.model.Payment"%>
<%@page import="uts.asd.model.dao.PaymentManager"%>

<!DOCTYPE html>
<html>
    
   
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <jsp:include page="/ConnServlet" flush="true"/>
        <title>Payment Page</title>
    </head>
     <%
        Customer customer = (Customer) session.getAttribute("customer");
        PaymentManager paymentManager = (PaymentManager) session.getAttribute("paymentManager");
        Payment payment = paymentManager.searchPaymentDetail(customer.getCustomerID());
        String cardNoErr = (String) session.getAttribute("cardNoErr");
        String cvvErr = (String) session.getAttribute("cvvErr");
        String expErr = (String) session.getAttribute("expErr");
    %>   
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
        <% if (customer != null ) {%>
        <%    
            String paymentMethod = payment.getPaymentMethod();
            String cardNumber = payment.getCardNumber();
            String cvv = payment.getCvv();
            String nameOnCard = payment.getNameOnCard();
            String expiryDate = payment.getExpiryDate();
            
        %>
        <form action="PaymentServlet" method="post">
            <table class="table table-responsive" id="users">
                <tr><td>Customer Id:#</td><td>${customer.customerID}</td></tr>
                <tr><td>Payment Method:</td><td><input type="text" name="paymentMethod" value="<%=paymentMethod%>"></td></tr>
                <td>
                        <p id ="datetime"></p>
                        <body onload = "currentDate()">
                            <input id="date" type="hidden" name="datePaid">
                        <script>
                            document.getElementById("datetime").innerHTML = new Date().toLocaleDateString();
                            function currentDate(){
                            var d = new Date().toLocaleDateString();
                            document.getElementById("date").defaultValue = d;
                        }
                        </script>
                    </td>
                    <tr>
                    <td>
                        <body onload = "currentStatus()">
                            <input id="check" type="hidden" name="check">
                        <script>
                            function currentStatus(){
                            var d = "Customer";
                            document.getElementById("date").defaultValue = d;
                        }
                        </script>
                    </td>
                </tr>
                <tr><td>Card Number:</td><td><input type="text" name="cardNumber" value="<%=cardNumber%>"></td></tr>
                <tr><td>Expiry Date:</td><td><input type="text" name="expiryDate" value="<%=expiryDate%>"></td></tr>
                <tr><td>CVV:</td><td><input type="text" name="cvv" value="<%=cvv%>"></td></tr>
                <tr><td>Name On Card:</td><td><input type="text" name="nameOnCard" value="<%=nameOnCard%>"></td></tr>
                <tr><td>Agree to Terms of Service</td><td><input type="checkbox" name="tos" id="tos"/></td></tr>
                <tr><td>
                        <input type="submit" value="Pay" class="button" name = "submit" id="submit" disabled>
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
                <%}  else { %>
        <form action="PaymentServlet" method="post">
            <table class="table table-responsive">
                <tr><td>Amount :500$</td></tr>
                <tr>
                    <td>
                        <select class="select" type="text" name="paymentMethod" id="id1">
                            <option value="empty">Payment Method</option>
                            <option value="card">Credit Card</option>
                            <option value="cash">Cash</option>
                            <option value="other">Other</option>                                                                
                        </select>                                   
                    </td>
                    <td>
                        <p id ="datetime"></p>
                        <body onload = "currentDate()">
                            <input id="date" type="hidden" name="datePaid">
                        <script>
                            document.getElementById("datetime").innerHTML = new Date().toLocaleDateString();
                            function currentDate(){
                            var d = new Date().toLocaleDateString();
                            document.getElementById("date").defaultValue = d;
                        }
                        </script>
                    </td>
                </tr>
                <tr><td>Card Number</td><td><input type="text" name="cardNumber"  required=""/></td></tr>
                <tr><td>Expiry Date</td><td><input type="text" name="expiryDate"  required=""/></td></tr>
                <tr><td>CVV</td><td><input type="text" name="cvv" required=""/></td></tr>
                <tr><td>Name On Card</td><td><input type="text" name="nameOnCard" required=""/></td></tr>
                <tr><td>Agree to Terms of Service</td><td><input type="checkbox" name="tos" id="tos"/></td></tr>
                <tr><td>
                        <input type="submit" value="Pay" class="button" name = "submit" id="submit" disabled>
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
        <% } %>
        
    </body>
</html>

