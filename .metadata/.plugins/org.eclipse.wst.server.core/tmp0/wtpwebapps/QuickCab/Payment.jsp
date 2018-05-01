<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="carConnection.Carconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@page import="carConnection.*,java.sql.*" %>
<body bgcolor="#C39BD3195">
<form action="Bank.jsp">
<table border="3" align="center">
<tr>
<th colspan="3">Confirm Your Booking</th>
</tr>
<tr><th>Route Selected</th><th>Cost Of Travelling</th></tr> 
<%
try{
	int price=0;
	Connection cn=Carconnect.getCn();
	String rid[]=request.getParameterValues("mini");
	String selection="select place,cost from route where rid=?";
	for(String x:rid){
		PreparedStatement ps=cn.prepareStatement(selection);
		ps.setString(1, x);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			price=price+Integer.parseInt(rs.getString(2));
			
%>
<tr><td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
</tr>

<%} %>

<%} %>
<tr>
<td><b><font color="blue">Total Cost Of Travelling</b></font></td><td><b><%=price %></b></td>
</tr>
<%}catch(Exception e){
	System.out.print(e);
}	%>
<tr><td colspan="3" align="right"><input type="submit" value="Proceed To Payment Page"></td></tr>
<tr><th colspan="2"><a href=Route.jsp>Back To Previous Page</a></th></tr>
<tr><th colspan="2"><a href=cab.html>Back To Home Page</a></th></tr>
<tr><th colspan="2"><a href=registration.html>New user ?REGISTER HERE </a></th></tr>
</table>
</body>
</html>