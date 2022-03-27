<%@page import="student.studentdao.StudentDAO"%>
<%@page import="student.studentdto.StudentDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String mode = request.getParameter("mode");
	
	StudentDAO dao = StudentDAO.getInstance();
	
	String title = null;
	List<StudentDTO> list = null;
	
	switch(mode){
	case "all":
		title = "전체 검색";
		list = dao.select();
		break;
	case "name":
		title = "이름 검색";
		String name = request.getParameter("name");
		list = dao.select(name);
		break;
	case "code":
		title = "코드 검색";
		int code = Integer.parseInt(request.getParameter("code"));
		list = dao.select(code);
	}
	
	request.setAttribute("title", title);
	request.setAttribute("list", list);
	
	pageContext.forward("/select/form.jsp");
%>




















