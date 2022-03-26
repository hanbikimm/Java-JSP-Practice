<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>
<div align="center">
	<h3>검색 입력</h3>
	<button class="button" onclick="document.location.href='/Student/select/nameSelect.jsp'">이름</button>
	<button class="button" onclick="document.location.href='/Student/select/codeSelect.jsp'">코드</button>
	<button class="button" onclick="document.location.href='/Student/select/list.jsp?mode=all'">전체</button>
</div>
<%@ include file="/layout/footer.jsp" %>