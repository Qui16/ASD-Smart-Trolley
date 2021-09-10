<%-- 
    Document   : scanItem
    Created on : 2021. 9. 9, 오후 7:45:18
    Author     : 61451
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Scan Item Page</title>
    </head>
    <body>
        <h1>Scan Item here</h1>
        
        <h2>Or Input the Item id, name, and price here</h2>
        <form action="cartSummary.jsp" method="POST">
            <table>
                <tr>
                    <td><label for="id">ID:</label> </td>
                    <td><input type="text" id="id" name="id"></td>
                </tr>
                <tr>
                <tr>
                    <td><label for="name">Name:</label> </td>
                    <td><input type="text" id="name" name="name"></td>
                </tr>
                <tr>
                    <td><label for="price">Price:</label> </td>
                    <td><input type="text" id="price" name="price"> </td>
                </tr>
            </table>
            <input type="submit" value="add item to cart">
            
        </form>
    </body>
</html>
