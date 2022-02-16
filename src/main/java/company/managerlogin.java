package company;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
public class managerlogin extends HttpServlet {
	Connection connection=null;
	PreparedStatement ps=null;
	 public void init(ServletConfig config) {
		 try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
		 }catch(ClassNotFoundException e){
			 e.printStackTrace();
		 }
		 String url="jdbc:mysql://localhost:3306/company";
		 String username="root";
		 String password="Meta@123";
		 try {
			   connection=DriverManager.getConnection(url,username,password);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
	 
	 }
	 public void dopost(HttpServletRequest request,HttpServletResponse response) throws IOException
	 {
		 String username=request.getParameter("username");
		 String password=request.getParameter("password");
		  
		 
		 PrintWriter pw=response.getWriter();
		 String sql="select * form manager where name=? and password=?";
		 try {
			ps=connection.prepareStatement(sql);
			ps.setString(1,username);
			ps.setString(2,password);
			HttpSession hs=request.getSession();
			 ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				hs.setAttribute("name", username);
				hs.setAttribute("id",rs.getInt(1));
				hs.setAttribute("manager",rs.getString("manager"));
				 response.sendRedirect("./manager_home.html");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
}
