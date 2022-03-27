<%@page import="student.studentdao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	
	StudentDAO dao = StudentDAO.getInstance();
	
	int su = dao.delete(name);
	
	String msg = "";
	
	if(su != 0){
		msg = name + "님의 정보가 삭제 되었습니다.";	
	}else{
		msg = "정보 삭제에 실패하였습니다.";
	}
	
	request.setAttribute("msg", msg);
	
	pageContext.forward("/delete/result.jsp");
%>