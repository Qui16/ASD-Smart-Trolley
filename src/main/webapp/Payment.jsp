<%-- 
    Document   : Payment
    Created on : 10 Sep 2021, 12:33:43
    Author     : casio
--%>

<%@page import="uts.asd.model.dao.ProductDao"%>
<%@page import="uts.asd.model.dao.DbCon"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.asd.model.Cart"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
        ProductDao pDao = new ProductDao(DbCon.getConnection());        
        double total = pDao.getTotalCartPrice(cart_list);
        request.setAttribute("cart_list", cart_list);
        request.setAttribute("total", total);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="./css/style.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <title>Payment Page</title>
    </head>
    <body>
        
        <form action="PaymentServlet" method="post">
            <table class="table table-responsive">
                
                <tr><td>Amount : $ ${(total>0)?dcf.format(total):0}</td></tr>
                
                <tr>
                    <td>
                        <select class="select" type="text" name="paymentMethod">
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
                <tr><td>Card Number</td><td><input type="text" name="cardNumber" required=""/></td></tr>
                <tr><td>Expiry Date</td><td><input type="text" name="expiryDate" required=""/></td></tr>
                <tr><td>CVV</td><td><input type="text" name="cvv"/></td></tr>
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
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>

