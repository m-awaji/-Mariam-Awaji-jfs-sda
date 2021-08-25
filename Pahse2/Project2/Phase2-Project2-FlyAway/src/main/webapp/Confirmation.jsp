<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="com.model.Booking" %>
      
<!DOCTYPE html>
<html>
<head>
    <title>Confirmation</title>
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
	<header class="bgimg-1 w3-display-container w3-grayscale-min" id="AllAirlines">
        <br>
        <div class="w3-display-centre w3-text-black" style="padding:48px" class="w3-container">
           <p align="center"> <span class="w3-xxlarge" >Thank you</span></p> 

        </div>
        <br/>
        <div class="w3-display-left w3-text-blue" style="padding:48px"  >
            <span class="w3-xxlarge">Thanks <%=Booking.pname%>, we have received your payment and we will send your booking details to your email:" <%=Booking.email%> "<br> Hope to see you again ...</span>            
</div>
	 <div class="w3-display-left w3-text-white" style="padding:48px ;position:relative; top:370px;">
        <p><a href="Search_Flights.jsp" class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-on"><i class="fa fa-gear"></i>   Book another flight</a></p>
        </div>
	</header>
<div class="footer">
       FlyAway.com &copy; Mariam Awaji 
       <script>document.write( new Date().getFullYear() );</script>
    </div>
</body>
</html>