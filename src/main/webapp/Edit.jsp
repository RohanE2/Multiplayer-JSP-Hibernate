
<%
String id = request.getParameter("id");
%>
<%
String id2 = request.getParameter("id1");
String sname2 = request.getParameter("sname1");
String aname2 = request.getParameter("aname1");
String pname2 = request.getParameter("pname1");
String duration2 = request.getParameter("duration1");
String date2 = request.getParameter("date1");
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
<title>EDIT SONG</title>
</head>
<body>

<%--For displaying the all record we are opening the connection --%>
	<div align="Center">
		<fieldset>
			<legend style="margin: auto">EDIT SONG</legend>
			<%!Connection connection;
	PreparedStatement preparedStatement;
	ResultSet resultset;
	int result;
	String dburl = "jdbc:mysql://localhost:3306/weje3";
	String user = "root";
	String password = "root";
	String query;%>

			<%
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(dburl, user, password);
			query = "Select * from songjsp";
			preparedStatement = connection.prepareStatement(query);
			resultset = preparedStatement.executeQuery();
			%>
		<%-- We are displaying the Song here --%>
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
	<%-- taking input from user  to edit the song and this input goes to the above String id  --%>
			<form action="./Edit.jsp">
				<input type="number" name="id"
					placeholder="Enter the song id no edit"> <input
					type="submit" value="Enter">
			</form>
		<%--for taking the request to same page --%>	
			<form action="./index.jsp">
				<input Style="margin-top: 2px" type="submit" value="GO BACK">
			</form>
			<%--decalring the varibales to store the database values in java variable to display in input. --%>
			<%!String id1; %>
			<%!String sname; %>
			<%!String pname; %>
			<%!String aname; %>
			<%!String duration; %>
			<%!String date; %>
			<%
			
		if (id != null) {
			query = "select * from songjsp " + "where id = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id);
			resultset = preparedStatement.executeQuery();
			while (resultset.next()) {
			 id1 = resultset.getString(1);
			 sname = resultset.getString(2);
			 aname = resultset.getString(3);
			 pname = resultset.getString(4);
			 duration = resultset.getString(5);
			 date = resultset.getString(6);
			 }%>
			 <%--for take the request to same page --%>
			 <%-- In the value attribute we are displaying the variable in input --%>
			<form action="./Edit.jsp">
				<table>
					<tr>
						<td><input type="number" name="id1" value="<%=id1%>"></td>

					</tr>
					<tr>
						<td><input type="text" name="sname1" value="<%=sname%>"></td>

					</tr>
					<tr>
						<td><input type="text" name="aname1" value="<%=aname%>"></td>

					</tr>
					<tr>
						<td><input type="text" name="pname1" value="<%=pname%>"></td>

					</tr>
					<tr>
						<td><input type="text" name="duration1" value="<%=duration%>"></td>
					</tr>
					<tr>
						<td><input type="date" name="date1" value="<%=date%>"></td>
					</tr>
				</table>
		</fieldset>
		<input type="submit" value="Edit Song">
		</form>
		<% 	}
		%>
		<%
	if (id2 != null && sname2 != null && aname2 != null && pname2 != null && duration2 != null && date2 != null) {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection(dburl, user, password);
		query = "UPDATE songjsp "+
				"SET `id`=?, `song name`=?, `artist name`=?, `producer name`=?, `duration`=?, `release date`=? "+
				"WHERE id=?";
		preparedStatement = connection.prepareStatement(query);
		preparedStatement.setString(1, id2);
		preparedStatement.setString(2, sname2);
		preparedStatement.setString(3, aname2);
		preparedStatement.setString(4, pname2);
		preparedStatement.setString(5, duration2);
		preparedStatement.setString(6, date2);
		preparedStatement.setString(7, id1);
		result = preparedStatement.executeUpdate();
	}
	%>
	
	<%
	if (result >0) {
	%>
	<h3 align="center">
		<%=result%>
		Song Edited Successfuly
	</h3>
	<%
	}
	%>
	</div>
</body>
</html>