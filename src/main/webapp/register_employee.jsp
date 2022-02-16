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
String query=" insert into employee(name,password,email) values(?,?,?)";
PreparedStatement pst=con.prepareStatement(query);
pst.setString(1, username);
pst.setString(2, password);
pst.setString(3, email);
int count=pst.executeUpdate();
if(count!=0) 
       response.sendRedirect("./employee_login.html");	
%>

</body>
</html>