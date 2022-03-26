<%@page import="student.studentdto.StudentDTO"%>
<%@page import="student.studentdao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	
	//StudentDAO dao = new StudentDAO();
	StudentDAO dao = StudentDAO.getInstance();
	
	StudentDTO dto = dao.selectOne(name);
	
	request.setAttribute("dto", dto);
	
	pageContext.forward("/update/form.jsp");
%>