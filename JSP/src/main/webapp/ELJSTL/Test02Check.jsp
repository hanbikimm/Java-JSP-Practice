<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
 	int x = Integer.parseInt(request.getParameter("x"));
	int y = Integer.parseInt(request.getParameter("y"));

	request.setAttribute("x", x);
	session.setAttribute("y", y); 
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body>
		<!-- 받아올 데이터가 없으면 건너뛰고 실행된다. -->
		${param['x'] } + ${param['y'] } = ${param['x'] + param['y'] }<br>
		${param['x'] } - ${param['y'] } = ${param['x'] - param['y'] }<br>
		<!-- 위처럼 사용해도 되지만 아래가 더 편하겠지? -->
		${param.x } * ${param.y } = ${param.x * param.y }<br> 
		${requestScope.x } / ${sessionScope.y } = ${x / y }<br> 
	</body>
</html>
