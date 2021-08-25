<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>All Flights</title>
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
	<header class="bgimg-1 w3-display-container w3-grayscale-min" id="AllFlights">
        <br>
        <div class="w3-display-centre w3-text-black" style="padding:48px" class="w3-container">
           <p align="center"> <span class="w3-xxlarge" >Admin Dashboard</span></p> 

           <span class="w3-xlarge">List of Flights</span>
        </div>
        <br/>
        <div class="w3-display-left w3-text-black" style="padding:48px" class="w3-container"  >
	  <%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
	  <br><br>
	<table id ="fly">
		<tr>
			<th>Flight_ID</th>
			<th>Airline </th>
			<th>Flight_Date</th>
			<th>Flight_Source</th>
			<th> Flight_Destination</th>
			<th>Flight_Price</th> 
		</tr>
		<c:forEach var = "obj" items = "${requestScope.flights}">
			<tr>
				<td>${obj.flightId}</td>
				<td>${obj.airline}</td>
				<td>${obj.flightDate}</td>
				<td>${obj.flightSource }</td>
				<td>${obj.flightDestination }</td>
				<td>${obj.flightPrice }</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	 <div class="w3-display-left w3-text-white" style="padding:48px ;position:relative; top:370px;">
        <p><a href="/Phase2-Project2-FlyAway/Login_Success.jsp" class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-on">   Back</a></p>
        </div>
	</header>
<div class="footer">
       FlyAway.com &copy; Mariam Awaji 
       <script>document.write( new Date().getFullYear() );</script>
    </div>
</body>
</html>