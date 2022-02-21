<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<main>
			<h1>관리자 관리</h1>
			<div class="manageOfAdmin">
				<table>
					<thead>
						<tr>
							<th>No.</th>
							<th>관리자 아이디</th>
							<th>관리자 비밀번호</th>
							<th>관리자 이름</th>
							<th>관리자 이메일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="admin" items="${aministrator}">
							<tr>
								<td>${admin.rowNum}</td>
								<td>${admin.adminId}</td>
								<td>${admin.adminPw}</td>
								<td>${admin.adminName}</td>
								<td>${admin.adminEmail}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
	</div>
</body>
</html>