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
		<jsp:include page="/WEB-INF/views/admin/adminNav.jsp"></jsp:include>
		<main>
			<h1>관리자 관리</h1>
			<div class="manageOfAdmin">

				<button type="submit" id="resetAdmin">관리자 리셋</button>
				<button type="button" id="plusAdmin">관리자 추가</button>
				<button type="button" id="revAdmin">관리자 수정</button>
				<button type="button" id="reviseAdmin" style="display: none;">관리자
					수정완료</button>

				<div class="tableCont">
					<table>
						<thead>
							<tr>
								<th>√</th>
								<th onclick="sortTable(1)">No.</th>
								<th onclick="sortTable(2)">관리자 아이디</th>
								<th onclick="sortTable(3)">관리자 비밀번호</th>
								<th onclick="sortTable(4)">관리자 이름</th>
								<th onclick="sortTable(5)">관리자 이메일</th>
								<th onclick="sortTable(6)">관리 권한</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="admin" items="${administrator}" begin="0" end="0">
								<tr>
									<td> <input type="checkbox" disabled="disabled"> </td>
									<td>01</td>
									<td>${admin.adminId}</td>
									<td>${admin.adminPw}</td>
									<td>${admin.adminName}</td>
									<td>${admin.adminEmail}</td>
									<td style="color: blue">권한있음</td>
								</tr>
							</c:forEach>
							<c:forEach var="admin" items="${administrator}" begin="1">
								<tr>
									<td><input type="checkbox" name="chkbox" id="" class="chkbox inform1" value="${admin.rowNum}" /></td>
									<td class="rowNum">${(admin.rowNum < 10)? '0'+=admin.rowNum:admin.rowNum}</td>
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
			</div>
		</main>
	</div>

	<script type="text/javascript" src="./js/admin_admin.js"></script>
</body>
</html>