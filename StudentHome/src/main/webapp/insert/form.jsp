<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String strValue = (String)request.getAttribute("strValue");
	int code = (int)request.getAttribute("code");
%>   
<script type="text/javascript">
	function check() {
		//alert(document.input.value);
		if(document.input.name.value == ""){
			alert("이름을 입력하십시오!");
			document.input.name.focus();
		}else if(document.input.value.value == ""){
			alert("<%=strValue %>을(를) 입력하십시오!");
			document.input.value.focus();
		}else{
			document.input.submit();
		}
	}
</script>
<%@ include file="/layout/header.jsp" %>
	<div align="center">
		<h3>정보 입력</h3>
		<form action="/Student/insert/insert.jsp" method="post" name="input">
			<input type="hidden" name="code" value="<%=code %>">
			<table>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th><%=strValue %></th>
					<td><input type="text" name="value"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="button" value="입력" onclick="javascript:check()">
						<input type="reset" value="다시">	
					</td>
						
				</tr>
			</table>
		</form>
	</div>
<%@ include file="/layout/footer.jsp" %>