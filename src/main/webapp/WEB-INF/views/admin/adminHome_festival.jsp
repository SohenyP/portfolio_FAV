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
			<h1>축제 관리</h1>
			<div class="manageOfFestival">
			<h3>국내</h3>
				<table>
					<thead>
						<tr>
							<th>No.</th>
							<th>id</th>
							<th>city</th>
							<th>site</th>
							<th>title</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="" items="">
							<tr>
								<td>No.</td>
								<td>id</td>
								<td>city</td>
								<td>site</td>
								<td>title</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			<h3>국외</h3>
				<table>
					<thead>
						<tr>
							<th>No.</th>
							<th>id</th>
							<th>city</th>
							<th>site</th>
							<th>title</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="" items="">
							<tr>
								<td>No.</td>
								<td>id</td>
								<td>city</td>
								<td>site</td>
								<td>title</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div> 
		</main>
	</div>
</body>
</html>