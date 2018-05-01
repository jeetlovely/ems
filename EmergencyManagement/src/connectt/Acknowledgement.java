package connectt;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connectt.connection;

/**
 * Servlet implementation class Acknowledgement
 */
@WebServlet("/Acknowledgement")
public class Acknowledgement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			PrintWriter out=response.getWriter();
			Connection cn=connection.getCn();
			String accidentType = request.getParameter("accidentType");
			String location = request.getParameter("ocation");
			String locat = request.getParameter("locat");
			//System.out.println(location + " - Acknowledgement.java");
			//out.println(location + " - Acknowledgement.java");
			out.println(locat + " - Acknowledgement.java");
			out.println("Thank you for raising concern.");
			
			//request.setAttribute("ocation", location);
			
			//request.getRequestDispatcher("TriggerToFireSt.jsp").forward(request, response);
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
	}
}
	
			
			
							
			