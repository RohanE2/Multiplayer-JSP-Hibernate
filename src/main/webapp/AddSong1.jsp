<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String sname = request.getParameter("sname");
String aname = request.getParameter("aname");
String pname = request.getParameter("pname");
String duration = request.getParameter("duration");
String date = request.getParameter("date");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD SONG</title>
</head>
<body>
	<div align="center">
		<form action="./AddSong1.jsp">
			<fieldset>
				<legend style="margin: auto">ADD SONG</legend>
				<table>
					<tr>
						<td><input type="number" name="id"
							placeholder="Enter The Song Id"></td>
					</tr>
					<tr>
						<td><input type="text" name="sname"
							placeholder="Enter The Name Song"></td>

					</tr>
					<tr>
						<td><input type="text" name="aname"
							placeholder="Enter The Artist Song Name"></td>

					</tr>
					<tr>
						<td><input type="text" name="pname"
							placeholder="Enter The Song Producer Name"></td>

					</tr>
					<tr>
						<td><input type="text" name="duration"
							placeholder="Enter The Song Duration"></td>
					</tr>
					<tr>
						<td><input type="date" name="date"
							placeholder="Enter The Song Release Date"></td>
					</tr>
				</table>
			</fieldset>
			<input type="submit" value="SUBMIT">
		</form>
		<form action="./AddSong.jsp">
			<input Style="margin-top: 2px" type="submit" 
				value="GO BACK">
		</form>
	</div>
	<%
	Connection connection;
	PreparedStatement preparedStatement;
	int result = 0;
	String dburl = "jdbc:mysql://localhost:3306/weje3";
	String user = "root";
	String password = "root";
	String query;
	%>
	<%
	if (id != null && sname != null && aname != null && pname != null && duration != null && date != null) {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection(dburl, user, password);
		query = "insert into songjsp values(?,?,?,?,?,?)";
		preparedStatement = connection.prepareStatement(query);
		preparedStatement.setString(1, id);
		preparedStatement.setString(2, sname);
		preparedStatement.setString(3, aname);
		preparedStatement.setString(4, pname);
		preparedStatement.setString(5, duration);
		preparedStatement.setString(6, date);
		result = preparedStatement.executeUpdate();
	}
	%>

	<%
	if (result != 0) {
	%>
	<h3 align="center">
		<%=result%>
		Song Added Successfuly
	</h3>
	<%
	}
	%>
</body>
</html>