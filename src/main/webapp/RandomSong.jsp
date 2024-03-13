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
<title>Random Song</title>
</head>
<body>
		<div align = "center">
		<fieldset>
		<legend style ="margin:auto">RANDOM SONG</legend>
		<%!Connection connection;
		   PreparedStatement preparedStatement;
		   ResultSet resultset;
		   String dburl = "jdbc:mysql://localhost:3306/weje3";
		   String user = "root";
		   String password = "root";
		   String query ;%>
		   <%
		   	Class.forName("com.mysql.cj.jdbc.Driver");
		    connection = DriverManager.getConnection(dburl, user, password);
		    query = "select * from songjsp "+
		    "order by rand() "+
		    "limit 1";
		    preparedStatement = connection.prepareStatement(query);
		    resultset = preparedStatement.executeQuery();
		   %>
		   <%
		   while(resultset.next()){
			%>
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
		<%		
		   }
		   %>
		</fieldset>
		<form action="./PlaySong.jsp">
			<input Style="margin-top: 2px" type="submit" 
				value="GO BACK">
		</form>
		</div>
</body>
</html>