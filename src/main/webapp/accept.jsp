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
String id = request.getParameter("id");
int empid = Integer.parseInt(id);
String maname = (String)session.getAttribute("name");
PreparedStatement ps = con.prepareStatement("update leaves set status = ? where empid = ? and noleaves <= 3");
ps.setString(1,"accepted");
ps.setInt(2,empid);
int x = ps.executeUpdate();
if(x!=0){
	   response.sendRedirect("view_leave.jsp");
	}
	else{
		   
		   ps = con.prepareStatement("update leaves set status = ? where empid = ? and noleaves > 3");
		   ps.setString(1,"Notaccepted");
		   ps.setInt(2,empid);
		   int x2 = ps.executeUpdate();
		   if(x2!=0)
		      response.sendRedirect("view_leave.jsp");
	}
		%>
</body>
</html>