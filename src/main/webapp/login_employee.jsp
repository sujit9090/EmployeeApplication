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
String query=" select * from employee where name=? and password=?";
PreparedStatement pst=con.prepareStatement(query);
pst.setString(1, username);
pst.setString(2, password);
ResultSet rs=pst.executeQuery();
if(rs.next()) 
{
	session.setAttribute("empid",rs.getInt(1));
	session.setAttribute("name", rs.getString("name"));
   	response.sendRedirect("./employee_home.html");
}
%>


</body>
</html>