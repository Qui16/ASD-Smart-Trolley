<%-- 
    Document   : shoppingCart
    Created on : 10/09/2021, 4:39:18 AM
    Author     : clint
--%>
<%@page import="uts.asd.model.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/style.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
        />
        <title>Shopping cart</title>
    </head>
    <body>
        <header>
            <jsp:include page="./navBar.jsp" flush="true"/>
        </header>
        <main>
            <div class="total"><h3>Total Price: $ ${(total>0)?dcf.format(total):0} </h3></div>
		<table class="displayTable">
                    <tr>
                        <th>
                            <b>Product ID</b>
                        </th>
                        <th>
                            <b>Product Name</b>
                        </th>
                        <th>
                            <b>Price</b>
                        </th>     
                        <th>
                            <b>Quantity</b>
                        </th>
                        <th>
                            <b>Cancel</b>
                        </th>                        
                    </tr>
                    <c:forEach var="item" items="${products}">
                        <tr>
                            <td><c:out value="${item.id}" /></td>
                            <td><c:out value="${item.name}" /></td>
                            <td><c:out value="${item.description}" /></td>
                            <td><c:out value="$${item.price}" /></td>
                            <td><c:out value="${item.stock}" /></td>
                        </tr>
                    </c:forEach>
                </table>
        </main>                
        
    </body>
</html>
