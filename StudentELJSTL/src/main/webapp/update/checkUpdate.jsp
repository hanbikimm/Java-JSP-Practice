<%@page import="student.studentdao.StudentDAO"%>
<%@page import="student.studentdto.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String value = request.getParameter("value");
	int code = Integer.parseInt(request.getParameter("code"));
	
	StudentDTO dto = new StudentDTO(name,value,code);
	
	StudentDAO dao = StudentDAO.getInstance();
	
	int su = dao.update(dto);
	
	String msg = null;
	
	if(su != 0) {
		msg = dto.getName() + "님의 정보가 수정되었습니다.";
	}else {
		msg = "정보 수정에 실패하였습니다.";
	}
	
	request.setAttribute("msg", msg);
	
	pageContext.forward("/update/result.jsp");
%>