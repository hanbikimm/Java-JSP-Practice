<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int code = Integer.parseInt(request.getParameter("code"));

	String strValue = null;
	
	switch(code){
	case 1:
		strValue = "학번";
		break;
	case 2:
		strValue = "과목";
		break;
	case 3:
		strValue = "부서";
		break;
	}
	
	
	request.setAttribute("code", code);
	request.setAttribute("strValue", strValue);
	
	pageContext.forward("/insert/form.jsp");
%>