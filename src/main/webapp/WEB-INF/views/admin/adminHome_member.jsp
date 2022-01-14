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
		<%-- 	<h1>회원 관리</h1>
			<div class="manageOfAdmin">
				<table>
					<thead>
						<tr>
							<th>No.</th>
							<th>회원 아이디</th>
							<th>회원 비밀번호</th>
							<th>회원 이름</th>
							<th>회원 이메일</th>
							<th>회원권한</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="mem" items="${member}">
							<tr>
								<td>${mem.rowNum}</td>
								<td>${mem.memberId}</td>
								<td>${mem.memberPw}</td>
								<td>${mem.memberName}</td>
								<td>${mem.memberEmail}</td>
								<td>
									<form action="delete">
										<form:radiobutton path="rowNum" />
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="submit">회원 제거</button>
			</div> --%>
		</main>
	</div>
</body>
</html>