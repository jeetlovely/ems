
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="carConnection.Carconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="magenta">
<form action="Selectcar">
<table border="3" align="center">
<tr><th colspan="2"><h1>WELCOME TO QuickCab</h1></th></tr>
<tr>
<th colspan="3"><h2>Select Your Car</h2></th>
<tr><th>Cars</th><th>Select Available Cars</th></tr>
<%@page import="carConnection.*,java.sql.*" %>
<%
try{
	Connection cn=Carconnect.getCn();
	String sql="select cars,carid from carheaven where status like 'active'";
	PreparedStatement ps=cn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
			
%>
<tr>
<td><%=rs.getString(1) %></td>

<td><input type="radio" name="pup" value=<%=rs.getString(2) %>></td>
</tr>
<%} %>
<tr><td colspan="2" align="right"><input type="submit" value="OK"></td></tr>
<%}catch(Exception e){
	System.out.println(e);
}
	%>

<tr><th colspan="2"><a href=registration.html>New user ?REGISTER HERE </a></th></tr>
<tr><th colspan="2"><a href=cab.html>Back To Home Page</a></th></tr>
</table>

</body>
</html>