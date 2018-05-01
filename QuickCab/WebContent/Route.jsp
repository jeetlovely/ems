<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="carConnection.Carconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="yellow">
<form action="Payment.jsp">
<table border="3" align="center">
<tr>
<th colspan="3">Select Your Route</th>
</tr>
<tr><th>Route</th><th>Cost Of Travelling</th><th>Select</th></tr>
<%@page import="carConnection.*,java.sql.*" %>
<%
try{
	Connection cn=Carconnect.getCn();
	String sql="select place,cost,rid from route";
	PreparedStatement ps=cn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
			
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><input type="radio" name="mini" value=<%=rs.getString(3) %>></td>
</tr>
<%} %>
<tr><td colspan="3" align="right"><input type="submit" value="OK"></td></tr>
<tr><th colspan="2"><a href=Yessuccess.jsp>Back To Previous Page</a></th></tr>
<tr><th colspan="2"><a href=cab.html>Back To Home Page</a></th></tr>
<tr><th colspan="2"><a href=registration.html>New user ?REGISTER HERE </a></th></tr>
<%}catch(Exception e){
	System.out.println(e);
}
	%>

</table>

</body>
</html>