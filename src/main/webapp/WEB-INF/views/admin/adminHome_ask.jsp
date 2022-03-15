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
			<h1>문의글 관리</h1>
			<div class="manageOfAdmin">

				<div class="tableCont">
					<table>
						<thead>
							<tr>
								<th>No.</th>
								<th>작성자</th>
								<th>구분</th>
								<th>제목</th>
								<th>답변상태</th>
								<th>작성일</th>
								<th>삭제여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ask" items="${ask}">
								<tr>
									<td>${(ask.rowNum < 10)? '0'+=ask.rowNum:ask.rowNum}</td>
									<td>${ask.memberId}</td>
									<td>${ask.bullet}</td>
									<td>${ask.title}</td>
									<td>${ask.status}</td>
									<td>${ask.createdate}</td>
									<c:choose>
										<c:when test="${ask.isdelete == 'N'}">
											<td style="color:red;">삭제</td>
										</c:when>
										<c:otherwise>
											<td style="color:blue;">등록</td>
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
</body>
</html>