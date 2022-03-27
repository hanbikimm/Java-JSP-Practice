<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp"%>
<div align="center">
	<h3>코드 입력</h3>
	<button class="button" onclick="document.location.href='/Student/insert/code.jsp?code=1'">학생</button>
	<button class="button" onclick="document.location.href='/Student/insert/code.jsp?code=2'">교수</button>
	<button class="button" onclick="document.location.href='/Student/insert/code.jsp?code=3'">관리자</button>
</div>
<%@ include file="/layout/footer.jsp"%>