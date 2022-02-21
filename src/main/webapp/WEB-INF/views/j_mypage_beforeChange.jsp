<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일를 위해</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_paging.css">
<link rel="icon" href="${pageContext.request.contextPath}/media/logo/favicon.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

</head>

<body>
	<div class="container">
		
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
		<main>
			<div class="login-cont">
				<h1>개인정보 수정하기</h1>
				<h4>개인정보보호를 위해 비밀번호를 입력해주세요</h4>
				<br />
				<div class="login-form">
					<form:form action="changeInform" method="get" modelAttribute="memberVO">
						<input type="text" name="memberId" id="memberId" size="20" value="${sessionScope.account.memberId}" readonly="readonly"> 
						<input type="password" name="memberPw" id="memberPw" placeholder="비밀번호를 입력해주세요" size="30" autocomplete="off">
						<button type="submit" id="loginBtn">확인</button>
					</form:form>
					<input type="hidden" name="alertMSG" id=alertMSG value="${alertMSG }" />
				</div>
			</div>
		</main>
		
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
		
	</div>
	
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/j_mypage.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/z_script.js"></script>

</body>
</html>