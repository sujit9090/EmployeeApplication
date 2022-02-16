<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="blue" align = "center">
		<h1 align="center">MANGER HOME PAGE</h1>
		<br><br>
		<h3><a href = "manager_profile.jsp">Manager Profile</a>|
		    <a href = "index.html">Logout</a>|
		</h3>


<%@page import="java.sql.*" %>
<table width = "400" height = "100" border = "2" align = "center">
<tr><td>id</td><td>employee name</td><td>No of Leaves</td><td>Manager</td><td>Status</td><td>newstatus</td></tr>
<%
Connection con = null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/company";
String user="root";
String pass="Meta@123";
con=DriverManager.getConnection(url, user, pass);
String manager = (String)session.getAttribute("manager");
PreparedStatement ps = con.prepareStatement("select *from leaves where manager = ?");
ps.setString(1,manager);
ResultSet rs = ps.executeQuery();
while(rs.next()){
	%>
	<tr>
	<td><%=rs.getInt(1) %></td> <td><%=rs.getString("empname") %></td><td> <%=rs.getString("noleaves") %></td> <td><%=rs.getString("manager")%></td>
	<td><%=rs.getString("status")%></td><td><a href="accept.jsp?id=<%=rs.getInt(1)%>">accept</a></td></tr>
<% }%>
</table>

</body>
</html>