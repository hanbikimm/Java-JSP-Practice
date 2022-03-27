<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function check(){
		if(document.form.name.value == ""){
			alert("이름을 입력하십시오!")
			document.form.name.focus()
		}else if(document.form.java.value == ""){
			alert("java 점수를 입력하십시오!")
			document.form.java.focus()
		}else if(document.form.jsp.value == ""){
			alert("jsp 점수를 입력하십시오!")
			document.form.jsp.focus()
		}else if(document.form.spring.value == ""){
			alert("spring 점수를 입력하십시오!")
			document.form.spring.focus()
		}else{
			document.form.submit()
		}
	}
	
</script>
<title>Student</title>
</head>
<body>
	<div align="center">
		<form action="./studentResult.jsp" method="post" name="form">
			<table border="1">
				<tr>
					<th>Name</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>Java</th>
					<td><input type="text" name="java"></td>
				</tr>
				<tr>
					<th>JSP</th>
					<td><input type="text" name="jsp"></td>
				</tr>
				<tr>
					<th>Spring</th>
					<td><input type="text" name="spring"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="button" value="전송" onclick="check()">
						<input type="reset" value="초기화">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>