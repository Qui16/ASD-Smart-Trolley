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
            <h1>Sales management</h1>
        </div>

        <div class="container">
            <!-- main content div -->
            <div class="row align-items-start">

                <div class="col-6">
                    <div class="productList">
                        <h2>Payment list</h2>
                        <table class="table">
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

                                <tr>
                                    <td>1</td>
                                    <td>Milk 1L</td>
                                    <td>$1.36</td>
                                    <td>100</td>
                                    <td>2020-04-16</td>
                                    <td>NSW</td>
                                    <td>Fresh Milk</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Milk 2L</td>
                                    <td>$2.36</td>
                                    <td>100</td>
                                    <td>2020-04-16</td>
                                    <td>NSW</td>
                                    <td>Fresh Milk</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Cookie Choc</td>
                                    <td>$7.54</td>
                                    <td>100</td>
                                    <td>2020-04-16</td>
                                    <td>QLD</td>
                                    <td>Chocolate Cookies</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>Roasted Chic</td>
                                    <td>$10</td>
                                    <td>100</td>
                                    <td>2020-04-16</td>
                                    <td>NSW</td>
                                    <td>Roasted Chicken</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>Sandwhich</td>
                                    <td>$1.36</td>
                                    <td>100</td>
                                    <td>2020-04-16</td>
                                    <td>NSW</td>
                                    <td>Sandwhich</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>

                
                <jsp:include page="/ConnServlet" flush="true"/>
            </div>

        </div>
       
    </body>
</html>