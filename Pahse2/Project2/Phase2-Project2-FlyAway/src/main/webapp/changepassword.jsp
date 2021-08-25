<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String username=request.getParameter("username");
String password=request.getParameter("password");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/FlyAway","root","Mkku@123");
	PreparedStatement ps=con.prepareStatement("update admin_users set password=? where username=?");
	ps.setString(1,password);
	ps.setString(2,username);
	int i=ps.executeUpdate();
	if(i>0)
	{
		response.sendRedirect("Login_Success.jsp");
	}
	else{
		
		response.sendRedirect("Login_Failed.jsp");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
	%>
</body>
</html>