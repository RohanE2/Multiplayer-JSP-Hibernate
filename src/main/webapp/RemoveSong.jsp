<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<%
String id = request.getParameter("id");
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove Song</title>
</head>
<body>
	<div align="Center">
		<fieldset>
			<legend style="margin: auto">REMOVE SONG</legend>
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
		<form action="./RemoveSong.jsp">
		<input type = "text" name = "id" placeholder = "Enter the song id no Remove">
		<input type = "submit" value ="Remove Song">	
		</form>
		<form action="./AddSong.jsp">
			<input Style="margin-top: 2px" type="submit" 
				value="GO BACK">
		</form>
		<% if(id !=null){
				query = "delete from songjsp " + 
			  			"where id = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1,id);
				result = preparedStatement.executeUpdate();
			}%>
			<%
			if(result != 0){%>
				<h3>
				<%=result %>
				Song Deleted Successfully
				</h3>
		<%	}
			%>
	</div>
</body>
</html>