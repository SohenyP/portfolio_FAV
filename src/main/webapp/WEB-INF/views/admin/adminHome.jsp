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
	<nav>
		<div class="menu">
			<div class="logo"><img src="media/logo/logo_transparent.png" alt="" id="topLogo"/></div>
			<div class="menuList">
				<ul>
					<!-- 관리권한 부여된 관리자만 보임 -->
					<c:if test="${sessionScope.adminAcc.assigned == 'Y'}">
						<a href="manageAdmin"><li>관리자 관리</li></a>
					</c:if>
					<a href="manageMember"><li>회원 관리</li></a>
					<a href="manageAsk"><li>문의 관리</li></a>
					<a href="manageCoupon"><li>쿠폰 관리</li></a>
					<a href="manageRestaurent"><li>식당 관리</li></a>
					<a href="manageFestival"><li>축제 관리</li></a>
				</ul>
			</div>
		</div>
	</nav>
	<main>
		<div id="welcome">
			<h1>${sessionScope.adminAcc.adminId}님, 반갑습니다.</h1>
		</div>
	</main>
</div>
</body>
</html>