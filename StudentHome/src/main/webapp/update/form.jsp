<%@page import="student.studentdto.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StudentDTO dto = (StudentDTO)request.getAttribute("dto");
%>
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
		<%if(dto == null) {%>
			<h3>정보가 없습니다.</h3>
		<%}else { %>
			<form action="/Student/update/checkUpdate.jsp" method="post" name="input">
				<input type="hidden" name="name" value="<%=dto.getName() %>">
				<table>
					<tr>
						<th>Name</th>
						<td><%=dto.getName() %></td>
					</tr>
					<tr>
						<td>
							<select name="code">
								<%if(dto.getCode() == 1) {%>
									<option value="1" selected="selected">
								<%}else { %>
									<option value="1">
								<%} %>
								학생</option>
								<%if(dto.getCode() == 2) {%>
									<option value="2" selected="selected">
								<%}else { %>
									<option value="2">
								<%} %>
								교수</option>
								<%if(dto.getCode() == 3) {%>
									<option value="3" selected="selected">
								<%}else { %>
									<option value="3">
								<%} %>
								관리자</option>
							</select>							
						</td>
						<td>	
							<input type="text" name="value" value="<%=dto.getValue()%>">
						</td>
					</tr>
					<tr>
						<td align="right" colspan="2">
							<input type="button" value="수정" onclick="javascript:check()">
						</td>
					</tr>
				</table>
			</form>
		<%} %>
	</div>
<%@ include file="/layout/footer.jsp" %>