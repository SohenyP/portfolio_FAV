<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV 관리자 페이지</title>
<link rel="stylesheet" href="css/admin.css">
</head>
<body>

	<div class="container">
		<h1>관리자 로그인</h1>
		<div class="login">
			<form:form modelAttribute="adminVO" action="adminLogin" method="post">
				<form:input path="adminId" id="adminId" name="adminId" placeholder="관리자 아이디"/><br />
				<form:password path="adminPw" id="adminPw" name="adminPw"  placeholder="관리자 비밀번호"/><br /><br />
				<form:button type="submit" id="submit">로그인</form:button>
			</form:form>
		</div>
	</div>
	<input type="hidden" name="alertMSG" id="alertMSG" value="${alertMSG}"/>
	
	<script type="text/javascript">
		
		if(document.querySelector("#alertMSG").value != "") {
			let alertMSG = document.querySelector("#alertMSG").value;
			alert(alertMSG);
		}
	</script>
</body>
</html>