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
                        <li class="nav-item">
                            <a class="nav-link" href="Cart.jsp">Cart<span class="badge badge-danger px-2">${ cart_list.size() }</span></a>
                        </li> 
                        <li class="nav-item">
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./CustomerRegisterScreen.jsp">Customer Register</a>
                        </li>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./StaffRegisterScreen.jsp">Staff Register</a>
                        </li>
                        <a class="nav-link" href="./login.jsp">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>