<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD SONG</title>
</head>
<body>
	<div align = "center">
	
	<fieldset>
		<legend style = "margin:auto">ADD/REMOVE SONG</legend>
		<table>
			<tr>
				<form action="./AddSong1.jsp">
				<td><input type = "submit" value = "Add Song"></td>
				</form>
			</tr>
			<tr>
				<form action="./RemoveSong.jsp">
				<td><input type = "submit" value = "Remove Song"></td>
				</form>
			</tr>
			<tr>
			<form action="./index.jsp">
			<td><input Style="margin-top: 2px" type="submit" 
				value="GO BACK"></td>
		</form>
		</tr>
		</table>
	</fieldset>
	</div>
</body>
</html>