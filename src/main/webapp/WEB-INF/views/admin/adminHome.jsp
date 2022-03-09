<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV 관리자 메인페이지</title>
<link rel="stylesheet" href="css/admin.css">
</head>
<body>

<div class="homeContainer">
	
	<jsp:include page="/WEB-INF/views/admin/adminNav.jsp"></jsp:include>
		
	<main>
		<div id="welcome">
			<h1>${sessionScope.adminAcc.adminId}님, 반갑습니다.</h1>
		</div>
	</main>
</div>
</body>
</html>