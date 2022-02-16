 <!DOCTYPE html>
<html>
<body bgcolor = "cyan">
<%@page import="java.sql.*" %>

<%
Connection con = null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/company";
String user="root";
String pass="Meta@123";
con=DriverManager.getConnection(url, user, pass);
String empname=request.getParameter("empname");
String noleave = request.getParameter("noleaves");
String manager = request.getParameter("manager");
String sql = "insert into leaves(empid,empname,noleaves,status,manager) values(?,?,?,?,?)";
int empid = (Integer)session.getAttribute("empid");
System.out.println(empid);
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, empid);
ps.setString(2, empname);
ps.setString(3, noleave);
ps.setString(4, "checking");
ps.setString(5,manager);
int x = ps.executeUpdate();
if(x!=0){
	response.sendRedirect("leave_apply.jsp");
}
%>