<%-- 
    Document   : item management
    Created on : 10/09/2021, 5:28:34 AM
    Author     : Jack Hennessy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.asd.model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/style.css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap" rel="stylesheet"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <title>Item management</title>
    </head>
    <%
      String existErr = (String) session.getAttribute("existErr");
    %>

    <header>
            <jsp:include page="./navBar.jsp" flush="true"/>
    </header>

    <body>
        <div class="title">
            <h1>Item management</h1>
        </div>

        <div class="content">
            <!-- main content div -->
            <div class="productList">
                <h2>Product</h2>
                <table class="productsTable">
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
                            <b>Received date</b>
                        </th>
                        <th>
                            <b>Region</b>
                        </th>
                        <th>
                            <b>Item description</b>
                        </th>
                    </tr>
                    <c:forEach var="item" items="${items}">
                        <tr>
                            <td><c:out value="${items.id}" /></td>
                            <td><c:out value="${items.name}" /></td>
                            <td><c:out value="${items.price}" /></td>
                            <td><c:out value="$${items.quantity}" /></td>
                            <td><c:out value="${items.date}" /></td>
                            <td><c:out value="${items.region}" /></td>
                            <td><c:out value="${items.description}" /></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <!-- add product accordian -->
            <!-- remove product accordian -->

        </div>

        
        <!-- <main>
            <span class="message"> <%= (existErr != null ? existErr : "")%></span>
            <div>
                <h1 class="main_title">All Current Products</h1>
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
                            <b>Received date</b>
                        </th>
                        <th>
                            <b>Region</b>
                        </th>
                        <th>
                            <b>Item description</b>
                        </th>
                    </tr>
                    <c:forEach var="item" items="${items}">
                        <tr>
                            <td><c:out value="${items.id}" /></td>
                            <td><c:out value="${items.name}" /></td>
                            <td><c:out value="${items.price}" /></td>
                            <td><c:out value="$${items.quantity}" /></td>
                            <td><c:out value="${items.date}" /></td>
                            <td><c:out value="${items.region}" /></td>
                            <td><c:out value="${items.description}" /></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </main> -->
    </body>
</html>
