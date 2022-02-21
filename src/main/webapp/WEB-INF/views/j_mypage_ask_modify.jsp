<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일를 위해</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/j_mypage_ask.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_paging.css">
<link rel="icon" href="${pageContext.request.contextPath}/media/logo/favicon.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
</head>

<body>
	<div class="container">
		
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
		<main>
			<div class="askContainer">
				<h1 id="askTitle">1:1 문의</h1>
				<div id="askBox">
					<form:form modelAttribute="accountbbsVO" action="askModify" id="qnaWriter" method="get">
						<div id="qnaInform">
							<label for="qnaId">작성자 <form:input path="memberId" id="qnaId" name="qnaId" readonly="true"/></label>
							<form:select path="bullet">
									<form:option value="문의구분" disabled="true"/>
							<c:choose>
								<c:when test="${areYouFaver == 'Y'}">
									<form:option value="쿠폰문의"/>
									<form:option value="예약문의"/>
									<form:option value="기타문의"/>
								</c:when>
								<c:otherwise>
									<form:option value="프로모션"/>
									<form:option value="예약"/>
									<form:option value="기타"/>
								</c:otherwise>
							</c:choose>
							</form:select>
						</div>
						<div class="contentBox">
							<form:input path="title" type="text" id="qnaTitle"/>
							<form:textarea path="content" id="qnaContent" cols="100" rows="45"/>  
							<form:hidden path="rowNum" id="rowNum"/>
						</div>
						<div class="btnBox">
							<form:button type="button" id="backBoard3">취소</form:button>
							<form:button type="button" id="qnaPost">완료</form:button>
						</div>
					</form:form>
				</div>
			</div>
		</main>
		<div class="myQna" id="myQna1">
			<div id="qnaBox">
				<h1>${isFavee.memberName}
					<span>페이비님의 문의내역</span>
				</h1>
				<div id="btnBox">
					<button id="writeQna1">문의하기</button>
				</div>
				<!-- 게시글 리스트 -->
				<div class="qnaList" id="qnaList1">
					<table>
						<thead>
							<tr>
								<th>No.</th>
								<th>구분</th>
								<th>제목</th>
								<th>작성일</th>
								<th>답변상태</th>
							</tr>
						</thead>
						<c:forEach var="qna" items="${qnaList}">
							<c:set var="e" value="${e+1}"></c:set>
							<tbody class="list">
								<tr>
									<td id="no">${e}</td>
									<td id="bullet${e}">${qna.bullet}</td>
									<td><a href="" title="expand the area" class="info"
										id="info1">${qna.title}</a></td>
									<td scope="row" id="createdate${i}">${qna.createdate}</td>
									<!-- 자바스크립트로 아이디는 3글자 빼고 마스킹 처리 예정 -->
									<td>${qna.status}</td>
								</tr>
								<tr class="description" id="description1">
									<td colspan="5">
										<div class="answer">
											<div class="content" id="content${e}">${qna.content}</div>
										</div>
										<div id="qnaBtn" class="qnaBtn">
											<c:if test="${sessionScope.account.memberId == qna.memberId}">
												<input type="hidden" name="rowNum" value="${qna.rowNum}"
													class="rowNum" />
												<button type="button" class="modifyQna" id="modifyQna${e}">수정</button>
												<button type="button" class="deleteQna" id="deleteQna${e}">삭제</button>
											</c:if>
										</div>
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>
		
		<div id="modalCont-idpw">
			<div class="modal" id="pw">
				<div class="title">
					<h2>알림메세지</h2>
				</div>
				<p>비밀번호를 입력해주세요.</p>
				<button class="loginModalBtn" id="pwBtn">확인</button>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/j_mypage.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/z_script.js"></script>
</body>
</html>