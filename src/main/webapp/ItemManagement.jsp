<%-- 
    Document   : Item management scree
    Author     : Jack Hennessy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
   
    
    <div>
        <h1>Item Management</h1>

        <div>
            <h2>Add new item</h2>
            <form action="CustomerAccount.jsp" method="post">
            <table class="table"> 
                <tr><td>Name</td><td><input type="text" name="name"></td></tr>
                <tr><td>Category</td><td><input type="text" name="category"></td></tr>
                <tr><td>Price</td><td><input type="text" name="price"></td></tr>               
                <tr><td><input class="button" name="add" type="submit" value="Add"></td></tr> 
            </table>
        </form>
        </div>
        
    </div>
</html>
