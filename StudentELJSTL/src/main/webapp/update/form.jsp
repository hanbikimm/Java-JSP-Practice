<%@page import="student.studentdto.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	
	function check() {
		
		if(document.input.value.value == ""){
			alert("Value을 입력하십시오!");
			document.input.value.focus();
		}else{
			document.input.submit();
		}
		
	}

</script>
<%@ include file="/layout/header.jsp" %>
	<div align="center">
		<h3>정보 수정</h3>
		<c:if test="${dto == null }">
			<h3>정보가 없습니다.</h3>
		</c:if>
		<c:if test="${dto != null }">
			<form action="/Student/update/checkUpdate.jsp" method="post" name="input">
				<input type="hidden" name="name" value="${dto.name }">
				<table>
					<tr>
						<th>Name</th>
						<td>${dto.name }</td>
					</tr>
					<tr>
						<td>
							<select name="code">
								<c:choose>
									<c:when test="${dto.code == 1 }">
										<option value="1" selected="selected">학생</option>
									</c:when>
									<c:otherwise>
										<option value="1">학생</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${dto.code == 2 }">
										<option value="2" selected="selected">교수</option>
									</c:when>
									<c:otherwise>
										<option value="2">교수</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${dto.code == 3 }">
										<option value="3" selected="selected">관리자</option>
									</c:when>
									<c:otherwise>
										<option value="3">관리자</option>
									</c:otherwise>
								</c:choose>
							</select>							
						</td>
						<td>	
							<input type="text" name="value" value="${dto.value }">
						</td>
					</tr>
					<tr>
						<td align="right" colspan="2">
							<input type="button" value="수정" onclick="javascript:check()">
						</td>
					</tr>
				</table>
			</form>		
		</c:if>
	</div>
<%@ include file="/layout/footer.jsp" %>