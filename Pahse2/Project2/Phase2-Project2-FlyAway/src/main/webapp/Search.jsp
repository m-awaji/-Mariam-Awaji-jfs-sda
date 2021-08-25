<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
    <title>Search Result</title>
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
           <p align="center"> <span class="w3-xxlarge" >Flights</span></p> 

           <span class="w3-xlarge">Available Flights</span>
        </div>
        <br/>
        <div class="w3-display-left w3-text-black" style="padding:48px"  >
	<table id="fly">
	<tr>
	<th>Flight_ID</th>
	<th>Airline</th>
	<th>Flight_Date</th>
	<th>Source</th>
	<th>Destination</th>
	<th>Ticket_Price</th>
	<th>Passengers</th>
	<th>Book?</th>
	</tr>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/FlyAway","root","Mkku@123");
	Statement st=con.createStatement();
	String date=request.getParameter("Date");
	String source=request.getParameter("Source");
	String destination=request.getParameter("Destination");
	String passengers=request.getParameter("passengers");
	String query="select * from Flights where Flight_Date='"+date+"' AND Flight_Source='"+source+"' AND Flight_Destination='"+destination+"'";
	ResultSet rs=st.executeQuery(query);
	if (!rs.isBeforeFirst() ) { 
		response.sendRedirect("Noflights.jsp");
		} 
	else 
	{ 	 
		while(rs.next()) {
		%>
		<tr>
		<td><%=rs.getInt("Flight_ID")%></td> 
		<td><%=rs.getString("Airline")%></td> 
		<td><%=rs.getString("Flight_Date")%></td> 
		<td><%=rs.getString("Flight_Source")%></td> 
		<td><%=rs.getString("Flight_Destination")%></td> 
		<td><%=rs.getInt("Flight_Price")%></td> 
		<td><%=request.getParameter("Passengers")%></td>
		<td><form action="${pageContext.request.contextPath}/Booking_Details.jsp" method="post">
		            <input type="hidden" id="Flight_ID" name="Flight_ID" value="<%=rs.getInt("Flight_ID")%>">
                    <input type="hidden" id="Airline" name="Airline" value="<%=rs.getString("Airline")%>">
                    <input type="hidden" id="Flight_Date" name="Flight_Date" value="<%=rs.getString("Flight_Date")%>">
                    <input type="hidden" id="Flight_Price" name="Flight_Price" value="<%=rs.getInt("Flight_Price")%>">
                    <input type="hidden" id="Flight_Source" name="Flight_Source" value="<%=rs.getString("Flight_Source")%>">
                    <input type="hidden" id="Flight_Destination" name="Flight_Destination" value="<%=rs.getString("Flight_Destination")%>">
                    <input type="hidden" id="Passengers" name="Passengers" value="<%=request.getParameter("Passengers")%>">
					<input type="submit" class="btn btn-success" value="Book Flight">
					
             </form>
            </td>
		</tr>
		<% 
}
}
}
catch (Exception e)
{
	e.printStackTrace();
}
%>
</table>
<br>


</div>
	 <div class="w3-display-left w3-text-white" style="padding:48px ;position:relative; top:370px;">
        <p><a href="index.jsp" class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-on"><i class="fa fa-gear"></i>   Back</a></p>
        </div>
	</header>
<div class="footer">
       FlyAway.com &copy; Mariam Awaji 
       <script>document.write( new Date().getFullYear() );</script>
    </div>
</body>
</html>