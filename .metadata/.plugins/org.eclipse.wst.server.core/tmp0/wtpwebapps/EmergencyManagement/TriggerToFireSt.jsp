<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@page import="connectt.*,java.sql.*" %>

<%
if (request.getAttribute("ocation") != null)
{
	String queryLoc = request.getAttribute("ocation").toString();
	//queryLoc = queryLoc.trim();
	String[] arrayStr = queryLoc.split(",");
	 
	String sQueryLat = arrayStr[0];
	String sQueryLon = arrayStr[1];
	out.println(sQueryLat + ", " + sQueryLon + " - TriggerToFireSt.jsp");
	//out.println();
	double qLat = Double.parseDouble(sQueryLat);
	double qLon = Double.parseDouble(sQueryLon);
	
	try
	{
		Connection cn=connection.getCn();
		String sql="SELECT FIRESTID, LATLON FROM FIRESTATION";
		PreparedStatement ps=cn.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		double dist, storedDist = 999999;
		String finalFireStId = "NA";
		while(rs.next())
		{
			String fireStId = rs.getString(1);
			String latLon = rs.getString(2);
			
			
			
			arrayStr = latLon.split(",");
			String sLat = arrayStr[0];
			String sLon = arrayStr[1];
			//out.println(sLat + ", " + sLon + "-----");
			double lat = Double.parseDouble(sLat);
			double lon = Double.parseDouble(sLon);		
			
			dist = Math.sqrt( (qLat - lat)*(qLat - lat) + (qLon - lon)*(qLon - lon) );
			if (storedDist > dist)
			{
				storedDist = dist;
				finalFireStId = fireStId;
			}
		}
		out.println(finalFireStId);
	}
	catch (Exception e)
	{
		System.out.println(e);
	}
}
%>

</body>
</html>