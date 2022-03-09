<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/admin.css">
<title>Insert title here</title>
</head>
<body>
	<nav>
		<div class="menu">
			<div class="logo">
				<img src="media/logo/logo_transparent.png" alt="" id="topLogo" />
			</div>
			<div class="menuList">
				<ul>
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
</body>
</html>