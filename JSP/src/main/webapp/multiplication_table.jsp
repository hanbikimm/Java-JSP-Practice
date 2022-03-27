<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Multiplication Table</title>
</head>
<body>
	<div align="center">
		<table border="1">
			<h1> 구구단 </h1>
			
			<tr>
			<% for(int i=2; i<10; i++){ %>
				<th> <%=i %> 단 </th>
			<% } %>
			</tr>
			
			<% for(int j=1; j<10; j++){ %>
				<tr align ="left">
				<% for(int i=2; i<10; i++){ %>
					<td> <%=i %> x <%=j %> = <%=i*j %> </td>
				<% } %>
				</tr>
			<% } %>
			
			
		</table>
	</div>
</body>
</html>