<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
			<div class="manageOfAsk">
				<table>
					<thead>
						<tr>
							<th>No.</th>
							<th>작성자</th>
							<th>구분</th>
							<th>제목</th>
							<th>내용</th>
							<th>답변상태</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="" items="">
							<tr>
								<td></td>
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