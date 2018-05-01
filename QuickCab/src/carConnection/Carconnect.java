package carConnection;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Carconnect
{
	static Connection cn=null;
	static String driver="com.ibm.db2.jcc.DB2Driver";
	static String url="jdbc:db2://localhost:50000/cloud";
	static String user="SOUMYAJIT";
	static String pass="appyjeet1";
	
	public static Connection getCn(){
		try{
			Class.forName(driver);
			cn=DriverManager.getConnection(url,user,pass);
			
		}catch(Exception e){
			System.out.println(e);
		}
		return cn;
	}
}
