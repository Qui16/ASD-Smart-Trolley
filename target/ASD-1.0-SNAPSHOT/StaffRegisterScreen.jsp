<%-- 
    Document   : StaffRegisterScreen
    Created on : 26/09/2021, 10:48:25 PM
    Author     : quyda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/ConnServlet" flush="true"/>
        <title>Welcome</title>
    </head>

    <body>
        <div style="padding-left:20px">
            <h1>Sign Up</h1>
            <form action="StaffCreateServlet" method="post">
                <table class="table"> 
                    <tr><td>First Name: </td><td><input type="text"name="staffFName"></td></tr>
                    <tr><td>Last Name: </td><td><input type="text"name="staffLName"></td></tr>
                    <tr><td>Email: </td><td><input type="text" name="staffEmail"></td></tr>
                    <tr><td>Password: </td><td><input type="password" name="staffPassword"></td></tr>
                    <tr><td>Phone Number: </td><td><input type="text" name="staffPhoneNum"></td></tr>   
                    <tr><td>Address: </td><td><input type="text" name="staffAddress"></td></tr>   
                    <tr><td>DOB: </td><td><input type="date" name="staffDOB"></td>
                        <td><label>If null, current date will be assumed</label></td>
                    </tr>
                    <tr>
                        <td>Role: </td>
                        <td>
                            <select name="staffRole">
                                <option value="System Admin">System Admin</option>
                                <option value="Customer Service">Customer Service</option>
                                <option value="Manager">Product & Content Admin</option>                              
                            </select>
                        </td>
                    </tr>  
                    <tr><td><input class="button" name="register" type="submit" value="Sign Up"></td></tr> 
                </table>
            </form>
        </div>
    </body>
</html>
