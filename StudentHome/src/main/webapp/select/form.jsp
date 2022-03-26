<%@page import="student.studentdto.StudentDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title = (String)request.getAttribute("title");
	List<StudentDTO> list = (List)request.getAttribute("list");
%>
<%@ include file="/layout/header.jsp" %>
	<div align="center">
		<h3><%=title %></h3>
		<%if(list == null) {%>
			<h4>정보가 없습니다.</h4>
		<%} else { %>
			<table>
				<tr>
					<th>이름</th>
					<th>값</th>
					<th>분류</th>
				</tr>
				<%for(StudentDTO dto : list) {%>
					<tr>
						<td><%=dto.getName() %></td>
						<td><%=dto.getValue() %></td>
						<td>
							<%if(dto.getCode() == 1) {%>
								학생
							<%}else if(dto.getCode() == 2) {%>
								과목
							<%}else { %>
								부서
							<%} %>
						</td>
					</tr>
				<%} %>
			</table>
		<%} %>
	</div>
<%@ include file="/layout/footer.jsp" %>
