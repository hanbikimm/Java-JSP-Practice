<%@page import="student.studentdto.StudentDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>
	<div align="center">
		<h3>${title }</h3>
		<c:choose>
			<c:when test="${list == null }">
				<h4>정보가 없습니다.</h4>
			</c:when>
			<c:otherwise>
				<table>
					<tr>
						<th>이름</th>
						<th>값</th>
						<th>분류</th>
					</tr>
					<c:forEach var="dto" items="${list }">
						<tr>
							<td>${dto.name }</td>
							<td>${dto.value }</td>
							<td>
								<c:choose>
									<c:when test="${dto.code == 1 }">
										학생
									</c:when>
									<c:when test="${dto.code == 2 }">
										교수
									</c:when>
									<c:when test="${dto.code == 3 }">
										관리자
									</c:when>
								</c:choose>
							</td>
						</tr>					
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
<%@ include file="/layout/footer.jsp" %>
