<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%! 
	/* 멤버변수로 선언하는   */
	private int age = 19;
	public void addAge(){
		age++;
	}
%>
<%
	String name = "Hanbi Kim";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- html 주석 안의 스크립트는 주석처리가 불가능 -->
	<div align="center">
		이름: <%=name %> <br/>
		나이: <%=age %> <br/>
	</div>
	<!-- html과 java를 혼용할 때는 아래와 같이 영역을 잘 구분해줘야 한다 -->
	<% if(age >= 20){ %>
		<div align="center">성인입니다.</div>
	<% 	}else{ %>
		<div align="center">미성년자입니다.</div>
	<% } %>
	
	<%addAge(); %>
</body>
</html>