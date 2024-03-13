1
<%
String id = request.getParameter("id");
%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Choose Song</title>
</head>
<body>
	
	<div align="center">
		<fieldset>
		<%
	if (id != null) {
		query = "select * from songjsp " + "where id = ?";
		preparedStatement = connection.prepareStatement(query);
		preparedStatement.setString(1, id);
		resultset = preparedStatement.executeQuery();
		while (resultset.next()) {
	%>
	<div align="center">
		<fieldset>
		<legend style="margin: auto">MUSIC PLAYER</legend>
			<table>
				<tr>
					<td><%=resultset.getString(2)%></td>
				</tr>
				<tr>
					<td><%=resultset.getString(3)%></td>
				</tr>
				<tr>
					<td><< || >></td>
				</tr>
			</table>
		</fieldset>
	</div>
	<%
	  }
	}
	%>
			<legend style="margin: auto">SONGS LIST</legend>
			<%!Connection connection;
	PreparedStatement preparedStatement;
	ResultSet resultset;
	String dburl = "jdbc:mysql://localhost:3306/weje3";
	String user = "root";
	String password = "root";
	String query;%>
			<%
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(dburl, user, password);
			query = "select * from songjsp";
			preparedStatement = connection.prepareStatement(query);
			resultset = preparedStatement.executeQuery();
			%>
			<%
			while (resultset.next()) {
			%>
			<table>
				<tr>
					<td><%=resultset.getInt(1)%> <%=resultset.getString(2)%> <%=resultset.getString(3)%></td>
				</tr>
			</table>
			<%
			}
			%>
		</fieldset>
		<form action="./ChooseSong.jsp">
			<input Style="margin-top: 2px" type="number" name="id"
				placeholder="Enter the song ID">
			<input type = "submit" value ="Play Song">	
		</form>
		<form action="./PlaySong.jsp">
			<input Style="margin-top: 2px" type="submit" 
				value="GO BACK">
		</form>
	</div>
</body>
</html>