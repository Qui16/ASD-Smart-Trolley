


<html>
    <head>
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/register.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <div class="header">
        <a href="#default" class="logo">Main Page</a>
        <div class="header-right">
            <a href="logout.jsp">Logout</a>
            <a href="profile.jsp">Profile</a>
        </div>
    </div>
    
   
    
    <div style="padding-left:20px">
        <p>You are logged in as <span class="tag">${user.name}, < ${user.email} ></span> </p> 
    </div>
       
</html>
