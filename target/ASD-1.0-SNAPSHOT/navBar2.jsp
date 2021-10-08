<%@page import="uts.asd.model.Customer"%>
<%@page import="uts.asd.controller.Validator"%>
<html>
</head>
<%
    Validator validate = new Validator();
    validate.clear(session);
    Customer user = (Customer) session.getAttribute("user");
%>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="./index.jsp">Smart Trolley</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                    </li>                   



                    
                        <%
                            if (user != null) {
                        %>
                        <li><a class="nav-link active" aria-current="page" href="./account.jsp">${user.firstName}'s Account</a></li>
                            <%
                                if (user.isStaff()) {
                            %>
                        <li><a class="nav-link active" aria-current="page" href="./staff.jsp"> Staff Menu</a></li>
                            <%
                                }
                                if (user.isAdmin()) {
                            %>
                        <li><a class="nav-link active" aria-current="page" href="./admin.jsp"> Admin Menu</a></li>
                            <%
                                }
                            } else {
                            %>
                        <li>
                            <a class="nav-link" href="Cart.jsp">Cart<span class="badge badge-danger px-2">${ cart_list.size() }</span></a>
                        </li> 
                        <li><a class="nav-link active" aria-current="page" href="./CustomerRegisterScreen.jsp">Customer Register</a></li>
                        <li><a class="nav-link active" aria-current="page" href="./StaffRegisterScreen.jsp">Staff Register</a></li>
                        <li><a class="nav-link active" aria-current="page" href="./ItemManagement.jsp">Item Management</a></li>
                        <li><a class="nav-link active" aria-current="page" href="./SalesManagement.jsp">Sales Management</a></li>
                        <li><a class="nav-link active" aria-current="page" href="./login.jsp">Login</a></li>
                            <%
                                }
                            %>
                            <%
                                if (user != null) {
                            %>
                        <li><a class="nav-link active" aria-current="page" href="LogoutServlet">Logout</a></li>
                            <%
                                }
                            %>                    
                    
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>