<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.DecimalFormat"%>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	int java = Integer.parseInt(request.getParameter("java"));
	int jsp = Integer.parseInt(request.getParameter("jsp"));
	int spring = Integer.parseInt(request.getParameter("spring"));
	
	double avg = (java + jsp + spring) / 3.0;
	
	DecimalFormat df = new DecimalFormat("00.00");
	/* DecimalFormat df = new DecimalFormat("##.##"); 의 경우 소수점이 없으면 소수점을 출력하지 않음*/
	String s = df.format(avg);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Result</title>
</head>
<body>
	<div align="center">
		<table border="1">
			<tr>
				<th>Name</th>
				<td><%=name %></td>
			</tr>
			<tr>
				<th>Java</th>
				<td><%=java %></td>
			</tr>
			<tr>
				<th>JSP</th>
				<td><%=jsp %></td>
			</tr>
			<tr>
				<th>Spring</th>
				<td><%=spring %></td>
			</tr>
			<tr>
				<th>Average</th>
				<td><%=s %></td>
			</tr>
			<tr>
				<th colspan="2">
					<%if(avg >= 60) { %>
						합격!
					<%}else{ %>
						불합격!
					<%} %>
				</th>
			</tr>
		</table>
	</div>
</body>
</html>