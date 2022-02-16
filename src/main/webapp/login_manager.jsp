<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 <body bgcolor = "wheat">
<%@page import="java.sql.*" %>

<%
Connection con = null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/company";
String user="root";
String pass="Meta@123";
con=DriverManager.getConnection(url, user, pass);
String username=request.getParameter("username");
String password=request.getParameter("password");
String query=" select * from manager where name=? and password=?";
PreparedStatement pst=con.prepareStatement(query);
pst.setString(1, username);
pst.setString(2, password);
HttpSession hs = request.getSession();
ResultSet rs=pst.executeQuery();
if(rs.next()) 
{
	hs.setAttribute("name",username);
	hs.setAttribute("id",rs.getInt(1));
	hs.setAttribute("manager", rs.getString("manager"));
  	response.sendRedirect("./manager_home.html");
}
%>
</body>
</html>