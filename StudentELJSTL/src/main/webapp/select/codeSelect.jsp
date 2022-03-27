<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>
<div align="center">
	<h3>정보 입력</h3>
	<form action="/Student/select/list.jsp" method="post" name="input">
		<input type="hidden" name="mode" value="code">
		<table style="width: 250px;">
			<tr>
				<th>검색할코드</th>
				<td>
					<select name="code">
						<option value="1">학생</option>
						<option value="2">교수</option>
						<option value="3">직원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="입력">
					<input type="reset" value="다시">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="/layout/footer.jsp" %>