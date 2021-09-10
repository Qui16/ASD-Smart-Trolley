<%-- 
    Document   : addItem
    Created on : 2021. 9. 10, 오전 4:46:31
    Author     : 61451
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Item Page</title>
    </head>
    <body>
        <h1>Add item</h1>
        <form action="itemList.jsp" method="POST">
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
                 <tr>
                    <td><label for="quantity">Quantity:</label> </td>
                    <td><input type="text" id="quantity" name="quantity"> </td>
                </tr>
                 <tr>
                    <td><label for="receiveDate">ReceiveDate:</label> </td>
                    <td><input type="text" id="receiveDate" name="receiveDate"> </td>
                </tr>
                <tr>
                    <td><label for="region">Region:</label> </td>
                    <td><input type="text" id="region" name="region"> </td>
                </tr>
                <tr>
                    <td><label for="category">Category:</label> </td>
                    <td><input type="text" id="category" name="category"> </td>
                </tr>
                <tr>
                    <td><label for="description">Description:</label> </td>
                    <td><input type="text" id="description" name="description"> </td>
                </tr>
            </table>
            <input type="submit" value="add item">
            
        </form>
    </body>
</html>