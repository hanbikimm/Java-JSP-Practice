<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
  /* css 정의 */
  
  /*
  	선택자 - css를 구분하는 방법...
  	
  	.css명 - class 속성
  	#css명 - id 속성
  	태그명 - 태그의 기본 속성
  */
  
/*
  th{
  	background-color: aqua;
  }
*/

/* 	#table {
		background-color: aqua;
	} */
	
	.header {
		width: 500px;
		margin: 20px auto;
		text-align: center;
	}
	
	.headline {
		border: 1px black solid;
		width: inherit;
		font-size: 30px;
		font-weight: bold;
		padding: 15px 0px;
	}
	
	.button {
		font-weight: bold;
		font-size: large;
		margin: 15px 30px;
	}
	
	.main {
		width: 500px;
		text-align: center;
		margin: 20px auto;
		min-height: 300px;
	}

	a:link {
		text-decoration: none;
		color: black;
	}
	
	a:visited {
		text-decoration: none;
		color: black;
	}
	
	a:hover {
		color: lightgreen;
	}
	
	table,tr,td,th {
		border: 1px black solid;
		border-spacing: 0px;
	}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header">
		<div class="headline">
			<a href="/Student/index.jsp">정보 관리 사이트</a>
		</div>
		<div>
			<input type="button" class="button" value="입력" onclick="document.location.href='/Student/insert/codeInput.jsp'">
			<input type="button" class="button" value="수정" onclick="document.location.href='/Student/update/nameInput.jsp'">
			<button type="button" class="button" onclick="document.location.href='/Student/delete/form.jsp'">삭제</button>
			<button class="button" onclick="document.location.href='/Student/select/select.jsp'">검색</button>
		</div>
		<div class="main">