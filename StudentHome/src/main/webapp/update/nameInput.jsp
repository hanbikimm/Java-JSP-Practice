<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	
	function check() {
		
		if(document.input.name.value == ""){
			alert("이름을 입력하십시오!");
			document.input.name.focus();
		}else{
			document.input.submit();
		}
		
	}

</script>
<%@ include file="/layout/header.jsp" %>
	<div align="center">
		<form action="/Student/update/update.jsp" name="input">
			<h3>수정 정보</h3>
			<table>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<td align="right" colspan="2">
						<input type="button" value="검색" onclick="javascript:check()">
					</td>
				</tr>
			</table>
		</form>
	</div>
<%@ include file="/layout/footer.jsp" %>