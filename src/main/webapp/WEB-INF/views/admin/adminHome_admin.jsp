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
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>

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
							<th>√</th>
							<th>No.</th>
							<th>관리자 아이디</th>
							<th>관리자 비밀번호</th>
							<th>관리자 이름</th>
							<th>관리자 이메일</th>
							<th>관리 권한</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="admin" items="${administrator}">
							<tr>
								<td><input type="checkbox" name="chkbox" id="" class="chkbox" value="${admin.rowNum}"/></td>
								<td class="rowNum">${admin.rowNum}</td>
								<td>${admin.adminId}</td>
								<td>${admin.adminPw}</td>
								<td>${admin.adminName}</td>
								<td>${admin.adminEmail}</td>
								<c:choose>
									<c:when test="${admin.assigned == 'Y'}">
										<td style="color: blue">권한있음</td>
									</c:when>
									<c:otherwise>
										<td style="color: red">권한없음</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
					
				<button type="submit" id="resetAdmin">관리자 리셋</button>
				<button type="button" id="plusAdmin">관리자 추가</button>		
				<button type="button" id="revAdmin">관리자 수정</button>		
			</div>
		</main>
	</div>
	
	<script type="text/javascript" src="./js/admin_admin.js"></script>
</body>
</html>