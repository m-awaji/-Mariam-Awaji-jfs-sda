<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="com.model.Booking" %>
  <%
    Booking.pname =request.getParameter("pname");
  	Booking.email =request.getParameter("email");
%>
        
<!DOCTYPE html>
<html>
<head>
    <title>Payment</title>
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
	 <style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}


.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}


.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
  width: 400px
}
input[type=text] {
  width: 350px;
  margin-bottom: 20px;
  padding: 3px;
  border: 1px solid #ccc;
  border-radius: 3px;
}




</style>  
</head>
<body>
    <div class="w3-top">
        <div class="w3-bar w3-white w3-card" id="myNavbar">
            <a href="/Phase2-Project2-FlyAway/index.jsp" class="w3-bar-item w3-button w3-wide"><img src="img/airplane.png" class="img-fluid" alt="image" width="18%">  FlyAway</a>
            <div class="w3-right w3-hide-small">
            </div>
        </div>
    </div>
	<header class="bgimg-1 w3-display-container w3-grayscale-min" id="payment">
        <br>
        <div class="w3-display-centre w3-text-black" style="padding:48px" class="w3-container">
           <p align="center"> <span class="w3-xxlarge" >Payment</span></p> 
               <div class="row">
  <div class="col-75">
  <h3>Thank you Mr/Mrs  <span style="color:blue"><strong> <%=Booking.pname %></span></strong></h3>
    <p><span><strong>(Ticket price <%=Booking.Flight_Price%> for <%=Booking.Passengers%> passengers) is :</strong></span>
  <span style="color:blue"><strong><%=(Booking.Flight_Price*Booking.Passengers)%> Saudi Riyals</strong></span></p>
    <div class="container" align="center">
      <form action="/Phase2-Project2-FlyAway/Confirmation.jsp" method="POST">
               <div class="col-50">
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe" required>
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444" required>
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September" required>
            <label for="expyear">Exp Year</label>
            <input type="text" id="expyear" name="expyear" placeholder="2018" required>
            <label for="cvv">CVV</label>
            <input type="text" id="cvv" name="cvv" placeholder="352" required>
          </div>
        </div>
        <br>
        <input class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-on" type="submit" value="Pay" class="btn">
      </form>
    </div>
  </div>
</div>
</header>
	
<div class="footer">
       FlyAway.com &copy; Mariam Awaji 
       <script>document.write( new Date().getFullYear() );</script>
    </div>
</body>
</html>