<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 <body bgcolor="blue" align = "center">
		<h1 align="center">MANAGER HOME PAGE</h1>
		<br><br>
		<h3>
		    <a href = "apply_leave.jsp">Apply Leave</a>|
			<a href = "leave_apply.jsp">View Leave</a>|
		    <a href = "index.html">LOGOUT</a>|
		</h3>


<%@page import="java.sql.*" %>
<table width = "400" height = "100" border = "2" align = "center">
<tr><td>id</td><td>employee name</td><td>No of Leaves</td><td>Status</td><td>Manager</td></tr>
<%
Connection con = null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/company";
String user="root";
String pass="Meta@123";
con=DriverManager.getConnection(url, user, pass);
String manager = (String)session.getAttribute("manager");
PreparedStatement ps = con.prepareStatement("select * from leaves where manager = ?");
ps.setString(1,manager);
ResultSet rs = ps.executeQuery();
while(rs.next()){
	%>
	<tr>
	<td><%=rs.getInt(1) %></td> <td><%=rs.getString("empname") %></td><td> <%=rs.getString("noleaves") %></td> <td><%=rs.getString("status")%></td><td><%=rs.getString("manager")%></td>
	
<% }%>
</table>
</body>
</html>