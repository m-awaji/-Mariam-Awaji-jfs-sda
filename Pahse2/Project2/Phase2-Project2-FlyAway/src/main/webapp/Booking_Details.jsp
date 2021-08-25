<%@ page import="com.model.Booking" %>
<%
    Booking.Flight_ID =Integer.parseInt(request.getParameter("Flight_ID"));
    Booking.Flight_Price = Integer.parseInt(request.getParameter("Flight_Price"));
    Booking.Passengers = Integer.parseInt(request.getParameter("Passengers"));
    Booking.Airline = request.getParameter("Airline");
    Booking.Flight_Date = request.getParameter("Flight_Date");
    Booking.Flight_Source = request.getParameter("Flight_Source");
    Booking.Flight_Destination = request.getParameter("Flight_Destination");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking details</title>
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
           <p align="center"> <span class="w3-xxlarge" >Booking</span></p> 
        </div>
        <br/>
<div class="w3-display-left w3-text-black" style="padding:48px"  >
        
           <h4>You choose to book the flight with the following details:</h4>
           <table id="fly">
           <tr>
           <th>Flight_ID</th>
           <th>Airline</th>
           <th>Flight_Date</th>
           <th>Source</th>
           <th>Destination</th>
           <th>Passengers</th>
           <th>Price</th>
           </tr>
           <tr>
           <td><%=Booking.Flight_ID%></td>
           <td><%=Booking.Airline %></td>
           <td><%=Booking.Flight_Date %></td>
           <td><%=Booking.Flight_Source %></td>
           <td><%=Booking.Flight_Destination %></td>
           <td><%=Booking.Flight_Price %></td>
           <td><%=Booking.Passengers%></td>
           </tr>
           </table>
            <h4>Please enter your information to confirm your booking</h4>
<div style="border:3px solid black;width:70%;border-radius:20px;padding:20px" align="center">
  <form action="${pageContext.request.contextPath}/Payment.jsp" method="post" class="form-container">
   <div class="form-group" align="left">
   <label for="pname">Passenger Name</label>
    <input type="text" class="form-control" id="pname" name="pname" placeholder="Enter your full name"> 
   </div>
   <div class="form-group" align="left"><br>
    <label for="email">Email address</label>
    <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
  	</div>
    <div class="form-group" align="left">  <br>
    <label for="phone">Phone</label>
     <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone number">
     </div> 
		<br>
	<button type="submit" class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-on" value="confirm"> Confirm</button>
 	</form>
  	</div>
 	</div>
 			<br>
 			<br>
 	<br>
 			<br>
		 <div class="w3-display-left w3-text-white" style="padding:48px ;position:relative; top:370px;">
        <p><a href="Search_Flights.jsp" class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-on">   Back</a></p>
        </div>
	</header>
<div class="footer">
       FlyAway.com &copy; Mariam Awaji 
       <script>document.write( new Date().getFullYear() );</script>
    </div>
</body>
</html>