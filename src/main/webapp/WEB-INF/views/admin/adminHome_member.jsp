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
			<h1>관리자 관리</h1>
			<div class="manageOfAdmin">
			
				<button type="submit" id="resetAdmin">회원 삭제</button>	
				
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
					
				
			</div>
		</main>
	</div>
</body>
</html>