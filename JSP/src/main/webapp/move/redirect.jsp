<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request객체에 데이터 저장...setAttribute
	request.setAttribute("name", "김한비");
	
	//기본
	//response.sendRedirect("/JSP/move/end.jsp");
	
	// 한글 깨짐
	//response.sendRedirect("/JSP/move/end.jsp?name=김한비");
	
	// 위 방식 안되니까 url 형식으로 변환시켜 보낸다. 
	response.sendRedirect("/JSP/move/end.jsp?name=" + URLEncoder.encode("김한비","UTF-8"));
%>



<script type="text/javascript">
	document.location.href = "/JSP/move/end.jsp?name=김한비";
</script>
