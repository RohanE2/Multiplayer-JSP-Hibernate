<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Music Player</title>
</head>
<body>
		<div align = "center">
		<fieldset>
		<legend style = "margin : auto">Music Player</legend>
		<table>
				<form action = "./PlaySong.jsp">
				<tr>
					<td><input type = "submit" value="Play Song"></td>
				</tr>
				</form>
				<tr>
					<form action ="./AddSong.jsp">
					<td><input type = "submit" value = "Add Song"></td>
					</form>
				</tr>
				<tr>
					<form action ="./Edit.jsp">
					<td><input type = "submit" value = "Edit"></td>
					</form>
				</tr>
				<tr>
					<form action ="./Exit.jsp">
					<td><input type = "submit" value = "Exit"></td>
					</form>
				</tr>
		</table>
		</fieldset>
		</div>
</body>
</html>