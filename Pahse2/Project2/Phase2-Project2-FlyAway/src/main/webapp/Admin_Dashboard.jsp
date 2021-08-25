<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <title>Success Login</title>
    <link rel = "shortcut icon" type = "image/png" href = "img/favicon.png" >
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/global.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 	<link rel="stylesheet" href="Style.css">
	   
</head>
<body>
    <div class="w3-top">
        <div class="w3-bar w3-white w3-card" id="myNavbar">
            <a href="/Phase2-Project2-FlyAway/index.jsp" class="w3-bar-item w3-button w3-wide"><img src="img/airplane.png" class="img-fluid" alt="image" width="18%">  FlyAway</a>
            <div class="w3-right w3-hide-small">
            </div>
        </div>
    </div>
   <header class="bgimg-1 w3-display-container w3-grayscale-min" id="SuccessLogin">
        <br>
        <div class="w3-display-centre w3-text-black" style="padding:48px">
            <span class="w3-xxlarge">Welcome "<%= request.getParameter("username")%>" you have successfully logged in</span><br><br><br>
            <span class="w3-xlarge"><h3>Please select one of the following options</h3></span>
        </div>
        <br><br><br>
        <div class="w3-display-left w3-text-white" style="padding:48px">
             <label> <a href="/Phase2-Project2-FlyAway/ChangePassword.html" class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-on"> Change Password </a></label>
            <br><label id="flight"><a href="/Phase2-Project2-FlyAway/Login_Success.jsp" class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-on"> View Flights Properties</a></label>
                        
           
        </div>
    </header>
    <div class="footer">
       FlyAway.com &copy; Mariam Awaji 
       <script>document.write( new Date().getFullYear() );</script>
    </div>
</body>
</html>