package showrrom;
import carConnection.*;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Addd
 */
@WebServlet("/Addd")
public class Addd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String eid=request.getParameter("id");
		String eaddr=request.getParameter("address");
		String email=request.getParameter("mail");
		String econtact=request.getParameter("contact");
		String epass=request.getParameter("pass");
		try{
			String sql="insert into garage values(?,?,?,?,?)";
			Connection cn=Carconnect.getCn();
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, eid);
			ps.setString(2, eaddr);
			ps.setString(3, email);
			ps.setString(4, econtact);
			ps.setString(5, epass);
			
			ps.execute();
			System.out.println("saved.....");
			
			
			RequestDispatcher rd=request.getRequestDispatcher("cab.html");
			rd.include(request, response);
			
			
			
		}catch(Exception e){
			System.out.println(e);
						
		}
		}
	}


