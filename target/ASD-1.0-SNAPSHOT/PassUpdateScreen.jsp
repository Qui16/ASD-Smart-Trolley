<%-- 
    Document   : PassUpdateScreen
    Created on : 01/10/2021, 8:33:29 PM
    Author     : quyda
--%>


<%@page import="uts.asd.model.Customer"%>
<%@page import="uts.asd.model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
        <link rel="stylesheet" href="./css/warning.css">
        <title>Update</title>
        <jsp:include page="/ConnServlet" flush="true"/>
    </head>
    <%
        Staff staff = (Staff) session.getAttribute("staff");
        Customer customer = (Customer) session.getAttribute("customer");
        String passErr = (String) session.getAttribute("passErr");
    %>
    <body>
        <form action="UpdateServlet" method="post">
            <%if (passErr.equals("passErr")) {%>              
            <table>
                <tr><td>Current Password:</td> <td><input type="password" name="Password0" required> </td> </tr>
                <tr><td>Password:</td> <td><input type="password" name="Password" class="errorField" required ></td> <td class="error">Invalid password format!</td> </tr>             
                <tr><td>Re-type Password:</td><td><input class="errorField" type="password" name="Password2" required></td><td class="error"></tr>
                <tr><td colspan="3" class="error">Minimum six characters, at least one uppercase letter, one lowercase letter, one number and one special character(@$!%*?&)</td></tr>
            </table>  
            <%} else if (passErr.equals("wrongPass")) {%>
            <table>
                <tr><td>Current Password:</td> <td><input class="errorField" type="password" name="Password0" required> </td> <td class="error">Current password is not corrected!</td> </tr>
                <tr><td>Password:</td> <td><input type="password" name="Password" required ></td></tr> 
                <tr><td>Re-type Password:</td><td><input type="password" name="Password2" required></td></tr>
            </table>
            <%} else if (passErr.equals("noMatch")) {%>
            <table>
                <tr><td>Current Password:</td> <td><input type="password" name="Password0" required> </td> </tr>
                <tr><td>Password:</td> <td><input type="password" name="Password" class="errorField" required ></td></tr> 
                <tr><td>Re-type Password:</td><td><input class="errorField" type="password" name="Password2" required></td><td class="error">Not matched!</td></tr>
            </table>
            <%} else {%>
            <table>

                <tr><td>Current Password:</td> <td><input type="password" name="Password0" required> </td> </tr>
                <tr><td>New Password:</td> <td><input type="password" name="Password" required> </td> </tr>
                <tr><td>Re-type Password:</td><td><input type="password" name="Password2" required></td></tr>        
            </table>
            <%}%>
            <%session.setAttribute("passUpdate", "true");
                session.setAttribute("customer", customer);
                session.setAttribute("staff", staff);
            %>
            <button type="submit">Save</button>
        </form>
        <form method="post" action="AccountScreen.jsp">       
            <button type="submit">Cancel</button>
        </form>
    </body>
</html>
