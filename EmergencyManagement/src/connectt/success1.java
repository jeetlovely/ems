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



/**
 * Servlet implementation class success1
 */
@WebServlet("/success1")
public class success1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			PrintWriter out=response.getWriter();
			Connection pn=connection.getCn();
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String sql="select vid from volunteer where email=? and password=?";
			PreparedStatement ps=pn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				RequestDispatcher rd=request.getRequestDispatcher("succ1.jsp");
				rd.forward(request, response);
							
			}
			else{
				out.print("Wrong User or Password ! Please Try Again...");
				RequestDispatcher rd=request.getRequestDispatcher("Login1.html");
				rd.include(request, response);
				
			}
		}catch(Exception e){
			System.out.println(e);
		}
	}

}		