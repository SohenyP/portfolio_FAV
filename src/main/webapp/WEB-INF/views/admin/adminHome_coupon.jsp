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
	
		<jsp:include page="/WEB-INF/views/admin/adminNav.jsp"></jsp:include>
		
		<main>
			<h1>쿠폰 관리</h1>
			<div class="manageOfCoupon">
				<table>
					<thead>
						<tr>
							<th>No.</th>
							<th>쿠폰 번호</th>
							<th>쿠폰 이름</th>
							<th>할인율</th>
							<th>최대 할인액</th>
							<th>유효기간</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="coupon" items="">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
	</div>
</body>
</html>