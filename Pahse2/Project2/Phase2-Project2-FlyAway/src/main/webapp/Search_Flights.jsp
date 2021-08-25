<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html>
<html>
<head>
    <title>Search Flights</title>
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
           <p align="center"> <span class="w3-xxlarge" >Flights Portal</span></p> 

           <span class="w3-xlarge">Search Available Flights</span>
        </div>
        <br/>
        <div class="w3-display-left w3-text-black" style="padding:48px"  >
        <form action="Search.jsp" class="form-container">
        <table id="fly">
         <tr>
        <th align="right">Travel Date</th>
        <td>
        <select class="form-control" style="height:30px; width:150px;" id="Date" name="Date" required>
        <option value="">Select Date</option>
        <%
        try
        {
        	String Query="select distinct Flight_Date from flights";
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/FlyAway","root","Mkku@123");
        	Statement st=con.createStatement();
        	ResultSet rs=st.executeQuery(Query);
        	while(rs.next())
        	{
        		%>
        		<option ><%=rs.getString("Flight_Date")%></option>
        		<%
        	}
        }
        catch (Exception e)
        {
        	e.printStackTrace();
        }
        %>
        </select>
        </td>
        </tr>
        <tr>
        <th align="right">Source</th>
        <td>
        <select class="form-control" style="height:30px; width:150px;" id="Source" name="Source" required>
        <option value="">Select Source</option>
        <%
        try
        {
        	String Query="select distinct Flight_source from flights";
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/FlyAway","root","Mkku@123");
        	Statement st=con.createStatement();
        	ResultSet rs=st.executeQuery(Query);
        	while(rs.next())
        	{
        		%>
        		<option><%=rs.getString("Flight_Source")%></option>
        		<%
        	}
        }
        catch (Exception e)
        {
        	e.printStackTrace();
        }
        %>
        </select>
        </td>
        </tr>
        <tr>
       <th align="right">Destination</th>
        <td>
        <select style="height:30px; width:150px;" id="Destination" name="Destination" required>
        <option value="">Select Destination</option>
        <%
        try
        {
        	String Query="select distinct Flight_Destination from flights";
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/FlyAway","root","Mkku@123");
        	Statement st=con.createStatement();
        	ResultSet rs=st.executeQuery(Query);
        	while(rs.next())
        	{
        		%>
        		<option><%=rs.getString("Flight_Destination")%></option>
        		<%
        	}
        }
        catch (Exception e)
        {
        	e.printStackTrace();
        }
        %>
        </select>
        </td>
        </tr>
        <tr>
       <th align="right" >No. of Passengers</th>
        <td>
        <select style="height:30px; width:150px;" id="Passengers" name="Passengers" required>
        <option value="">Select no. of travelers</option>
        <option value="1">1</option>
 		<option value="2">2</option>
  		<option value="3">3</option>
  		<option value="4">4</option>
  		<option value="5">5</option>
  		<option value="6">6</option>
        </select>
        </td>
        </tr>
        </table>
        <br>
        <button type="submit" class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-on" value="Submit">Search Flights</button>
		</form>
	</div>
	 <div class="w3-display-left w3-text-white" style="padding:48px ;position:relative; top:370px;">
        <p><a href="index.jsp" class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-on">   Back</a></p>
        </div>
	</header>
<div class="footer">
       FlyAway.com &copy; Mariam Awaji 
       <script>document.write( new Date().getFullYear() );</script>
    </div>
</body>
</html>