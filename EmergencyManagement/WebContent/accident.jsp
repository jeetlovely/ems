<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="accident2">
<%@page import="connectt.*,java.sql.*" %>
<%
try{
	Connection cn=connection.getCn();
	String sql="select * from place";
	PreparedStatement ps=cn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	
	while(rs.next()){
			
%>
<tr>
<td><%=rs.getString(1) %></td>

<td><%=rs.getString(2) %></td></br>
</tr>
<%} %>


<%}catch(Exception e){
	System.out.println(e);
}
	%>
<%
try{
	Connection cn=connection.getCn();
	String ssql="select * from hospital_info";
	PreparedStatement ps=cn.prepareStatement(ssql);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
			
%>

<tr><td><%=rs.getString(1) %></td></tr>

<tr><td><%=rs.getString(2) %></td></tr>

<%} %>


<%}catch(Exception e){
	System.out.println(e);
}
	%>


</table></br>
</br>
<table>
<tr>LID:<input type="text" name="lid"/></tr>
<tr>HID:<input type="text" name="hid"/></tr>
<input type="submit" value="SUBMIT">
</table>
</form>
</body>
</html>