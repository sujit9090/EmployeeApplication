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
String email=request.getParameter("email");
String manager = request.getParameter("manager");
String query=" insert into manager(name,password,email,manager) values(?,?,?,?)";
PreparedStatement pst=con.prepareStatement(query);
pst.setString(1, username);
pst.setString(2, password);
pst.setString(3, email);
pst.setString(4, manager);
int count=pst.executeUpdate();
if(count!=0) 
       response.sendRedirect("./manager_login.html");	
%>


</body>
</html>