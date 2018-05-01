<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#E57373229">
<form action="Updatecar">
<table align="center">
<tr>
<th colspan="3"><h2>Select The Car You Want To Free</h2></th>
<tr><th>Cars</th><th>Select Running Cars</th></tr>
<%@page import="carConnection.*,java.sql.*" %>
<%
try{
	Connection cn=Carconnect.getCn();
	String sql="select cars,carid from carheaven where status like 'inactive'";
	PreparedStatement ps=cn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
			
%>
<tr>
<td><%=rs.getString(1) %></td>

<td><input type="radio" name="naam" value=<%=rs.getString(2) %>></td>
</tr>
<%} %>
<tr><td colspan="2" align="right"><input type="submit" value="Proceed To Free Your Selected Car"></td></tr>


<%}catch(Exception e){
	System.out.println(e);
}
	%>


<tr><td><a href="Admin.html">Back To Admin Login Page</a></td></tr>
<tr><th colspan="2"><a href=registration.html>New user ?REGISTER HERE </a></th></tr>
<tr><th colspan="2"><a href=cab.html>Back To Home Page</a></th></tr>
</table>

</body>
</html>