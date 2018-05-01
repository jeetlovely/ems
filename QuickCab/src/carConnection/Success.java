package carConnection;
 

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

/**
 * Servlet implementation class Success
 */
@WebServlet("/Success")
public class Success extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			PrintWriter out=response.getWriter();
			Connection cn=Carconnect.getCn();
			String mail=request.getParameter("mail");
			String pass=request.getParameter("pass");
			String sql="select id from garage where mail=? and pass=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, mail);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				RequestDispatcher rd=request.getRequestDispatcher("Yessuccess.jsp");
				rd.forward(request, response);
							
			}
			else{
				out.print("Wrong User or Password ! Please Try Again...");
				RequestDispatcher rd=request.getRequestDispatcher("cab.html");
				rd.include(request, response);
				
			}
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
