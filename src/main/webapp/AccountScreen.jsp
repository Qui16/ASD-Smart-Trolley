<%-- 
    Document   : AccountScreen
    Created on : 24/09/2021, 1:07:36 PM
    Author     : quyda
--%>

<%@page import="uts.asd.model.Staff"%>
<%@page import="uts.asd.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
        <jsp:include page="/ConnServlet" flush="true"/>
    </head>
    <body>
        <link rel="stylesheet" href="./css/button.css">
        <div class="header">

            <div class="header-right">
                <a href="navBar.jsp">Home</a>
                <a href="LogoutServlet">Logout</a>
            </div>
            <%
                Customer customer = (Customer) session.getAttribute("customer");
                Staff staff = (Staff) session.getAttribute("staff");
            %>
            <%if (customer != null) {%>
        </div>
        <div style="padding-left:20px">
            <h1>Customer Profile</h1>
            <p><span class="tag">Customer ID: </span> ${customer.customerID}</p>
            <p><span class="tag">NAME: </span> <%=customer.getCustomerFName() + " " + customer.getCustomerLName()%></p>
            <p><span class="tag">EMAIL: </span> ${customer.customerEmail}</p>
            <%String password = customer.getCustomerPassword();%>
            <p><span class="tag">PASSWORD: </span><%=password.substring(0, 2) + "***" + password.substring(password.length() - 2, password.length())%></p>
            <p><span class="tag">PHONE: </span> ${customer.customerPhoneNum}</p>
            <p><span class="tag">ADDRESS: </span> ${customer.customerAddress}</p>
            <p><span class="tag">DATE OF BIRTH: </span> ${customer.customerDOB}</p>
        </div>
        <div>
            <form action="UpdateScreen.jsp" method="post">
                <%session.setAttribute("customer", customer);
                    session.setAttribute("staff", null);
                %>
                <input type="submit" value="Update" />
            </form>
        </div>
        <div>
            <form action="DeleteServlet" method="post">
                <%session.setAttribute("customer", customer);
                    session.setAttribute("staff", null);
                %>
                <input class="button"  name="delete" type="submit" value="Delete">
            </form>
        </div>
        <%} else if (staff != null) {%>
    </div>
    <div style="padding-left:20px">
        <h1>Staff Profile</h1>
        <p><span class="tag">Staff ID: </span> ${staff.staffID}</p>
        <p><span class="tag">NAME: </span> <%=staff.getStaffFName() + " " + staff.getStaffLName()%></p>
        <p><span class="tag">EMAIL: </span> ${staff.staffEmail}</p>
        <%String password = staff.getStaffPassword();%>
        <p><span class="tag">PASSWORD: </span><%=password.substring(0, 2) + "***" + password.substring(password.length() - 2, password.length())%></p>
        <p><span class="tag">PHONE: </span> ${staff.staffPhoneNum}</p>
        <p><span class="tag">ADDRESS: </span> ${staff.staffAddress}</p>
        <p><span class="tag">DATE OF BIRTH: </span> ${staff.staffDOB}</p>
        <p><span class="tag">Role: </span> ${staff.staffRole}</p>
    </div>
    <div>
        <form action="UpdateScreen.jsp" method="post">
            <%session.setAttribute("staff", staff);
                session.setAttribute("customer", null);
            %>
            <input type="submit" value="Update" />
        </form>
    </div>
    <div>
        <form action="StaffRegisterScreen.jsp">
            <input type="submit" value="Staff Register" />
        </form>
    </div>
    <div>
        <form action="DeleteServlet" method="post">
            <%session.setAttribute("staff", staff);
                session.setAttribute("customer", null);
            %>
            <input class="button"  name="delete" type="submit" value="Delete">
        </form>
    </div>
    <%}%>
</body>

</html>
