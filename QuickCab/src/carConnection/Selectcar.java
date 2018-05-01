package carConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Selectcar
 */
@WebServlet("/Selectcar")
public class Selectcar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			Connection cn=Carconnect.getCn();
			String carid[]=request.getParameterValues("pup");
			String ssql="update carheaven set status='inactive' where carid=?";
			for(String x:carid){
				PreparedStatement ps=cn.prepareStatement(ssql);
				ps.setString(1, x);
				ps.executeUpdate();
				RequestDispatcher rd=request.getRequestDispatcher("Route.jsp");
				rd.forward(request, response);
			}
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
