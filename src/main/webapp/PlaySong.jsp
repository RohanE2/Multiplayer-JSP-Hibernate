<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Play Song</title>
</head>
<body>
		<div align = "center">
		<fieldset>
		<legend style = "margin : auto">Play Song</legend>
		<table>
				<form action = "./ChooseSong.jsp">
				<tr>
					<td><input type = "submit" value="choose Song"></td>
				</tr>
				</form>
				<tr>
					<form action ="./RandomSong.jsp">
					<td><input type = "submit" value = "Random Song"></td>
					</form>
				</tr>
				<tr>
					<form action ="./AllSong.jsp">
					<td><input type = "submit" value = "All Song"></td>
					</form>
				</tr>
				<tr>
					<form action ="./index.jsp">
					<td><input type = "submit" value = "Go Back"></td>
					</form>
				</tr>
		</table>
		</fieldset>
		</div>
</body>
</html>