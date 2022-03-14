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
			<h1>회원 관리</h1>
			<div class="manageOfAdmin">

				<button type="submit" id="resetMem">회원 리셋</button>
				<button type="button" id="revMem">회원 수정</button>
				<button type="button" id="reviseMem" style="display: none;">회원 수정완료</button>
				<input type="text" id="searchMem" placeholder="회원 정보를 입력해주세요">

				<div class="tableCont">
					<table>
						<thead>
							<tr>
								<th>√</th>
								<th>No.</th>
								<th>회원 타입</th>
								<th>회원 아이디</th>
								<th>회원 비밀번호</th>
								<th>회원 이름</th>
								<th>회원 이메일</th>
								<th>정보이용동의</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="mem" items="${member}">
								<tr>
									<td><input type="checkbox" name="chkbox" id="" class="chkbox" value="${mem.rowNum}" /></td>
									<td class="rowNum">${mem.rowNum}</td>
									<td>${mem.memberType}</td>
									<td>${mem.memberId}</td>
									<td>${mem.memberPw}</td>
									<td>${mem.memberName}</td>
									<td>${mem.memberEmail}</td>
									<c:choose>
										<c:when test="${mem.memberAgree == 'Y'}">
											<td style="color: blue">동의</td>
										</c:when>
										<c:otherwise>
											<td style="color: red">비동의</td>
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