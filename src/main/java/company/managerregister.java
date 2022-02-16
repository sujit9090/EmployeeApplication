package company;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class managerregister {
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
			// TODO: handle exception
			e.printStackTrace();
		}
}
	 public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
	 {
		 String username=request.getParameter("username");
		 String password=request.getParameter("password");
		 String email=request.getParameter("email");
		 String manager=request.getParameter("manager");
		 
		 PrintWriter pw=response.getWriter();
		 String sql="insert into manager(name,password,email,manager) values(?,?,?,?)";
		 try {
			ps=connection.prepareStatement(sql);
			ps.setString(1,username);
			ps.setString(2,password);
			ps.setString(3,email);
			ps.setString(4,manager);
			int x=ps.executeUpdate();
			if(x!=0)
			 response.sendRedirect("./manager_login.html");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
}