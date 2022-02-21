<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="oid" value="ownerid1" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일를 위해</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_paging.css">
<link rel="icon" href="${pageContext.request.contextPath}/media/logo/favicon.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
</head>

<body>
	<div class="container">
		
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
		<main>
			<div class="makeAccount-cont">
				<h1>개인정보수정</h1>
				<div class="account-form">
					<form action="revise" id="forFavee" method="post">
						<p><span>*</span>필수입력사항</p>
						<table>
							<tbody>
								<tr id="idPart">
									<th>아이디</th>
									<td>
										<input type="text" name="newId" id="newId" maxlength="30" readonly="readonly" value="${sessionScope.account.memberId}"> 
									</td>
								</tr>
								<tr id="currentPwPart">
									<th>현재 비밀번호</th>
									<td>
										<!-- 비밀번호 : 8~30자 사이 영대소문, 숫자, 특문 꼭 포함 --> 
										<input type="password" name="currentPw" id="currentPw" maxlength="30" required autocomplete="off"
										spellcheck="false" placeholder="현재 비밀번호를 입력해주세요" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9#?!@$ %^&*-]/g,'');">
										<input type="hidden" name="memberPw" id="memberPw" value="${sessionScope.account.memberPw}" />
										<br /><span id="incorrect">현재 비밀번호를 확인해주세요!</span>
									</td>
								</tr>
								<tr id="pwPart">
									<th>비밀번호</th>
									<td>
										<!-- 비밀번호 : 8~30자 사이 영대소문, 숫자, 특문 꼭 포함 --> 
										<input type="password" name="newPw" id="newPw" maxlength="30" autocomplete="off"
										spellcheck="false" placeholder="비밀번호를 입력해주세요" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9#?!@$ %^&*-]/g,'');"
										pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,30}$">
									</td>
								</tr>
								<tr id="pwRuleRow">
									<th></th>
									<td colspan="2">
										<ul id="pwRule">
											<li id="current" class="invalid">현재 비밀번호와 다르게 입력</li>
											<li id="length" class="invalid">8자리 이상 30자리 이하</li>
											<li id="upper" class="invalid">영어 대문자 포함</li>
											<li id="number" class="invalid">숫자 포함</li>
											<li id="special" class="invalid">특수문자 포함</li>
										</ul>
									</td>
								</tr>
								<tr id="pwPart2">
									<!-- 위와 동일 비번입력 -->
									<th>비밀번호 확인</th>
									<td>
										<input type="password" name="newPwCheck" id="newPwCheck" maxlength="30" autocomplete="off" spellcheck="false"
										placeholder="비밀번호를 한 번 더 입력해주세요" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9#?!@$ %^&*-]/g,'');"
										pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,30}$"> 
										<br /><span id="wrong">비밀번호가 다릅니다!</span>
									</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>
										<input type="text" name="newName" id="newName" maxlength="5" readonly="readonly" value="${sessionScope.account.memberName}">
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<input type="text" name="newEmail" id="newEmail" maxlength="50" required spellcheck="false"
										placeholder="ex : fav@xxxxx.com" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9@-_.]/g,'');"
										pattern="^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$" value="${sessionScope.account.memberEmail}"> 
										<button type="button" id="checkemail" class="checkInform">중복확인</button>
									</td>
								</tr>
								<tr id="emailRuleRow">
									<th></th>
									<td colspan="2">
										<ul id="emailRule">
											<li id="duplicateEmail" class="valid">이메일 중복확인</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th>휴대폰</th>
									<td>
										<!-- 휴대폰 :  숫자만 입력 11자리까지 가능 --> 
										<input type="text" name="newPhone" id="newPhone" maxlength="11" required spellcheck="false"
										placeholder="- 없이 숫자만 입력하세요" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										pattern="^^(010|011|016|019|018|017)([0-9]{3,4})([0-9]{4})$" value="${sessionScope.account.memberContact}"> 
										<button type="button" id="checkphone">인증번호 받기</button>
									</td>
								</tr>
								<tr></tr>
							</tbody>
						</table>
						<button type="submit" id="revise">수정하기</button>
					</form>
					
					<input type="hidden" name="alertMSG" id="alertMSG" value="${alertMSG}" />
				</div>
			</div>
		</main>
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
		
	</div>
	<div id="modalCont-idpw">
		<div class="modal" id="pw">
			<div class="title">
				<h2>알림메세지</h2>
			</div>
			<p>비밀번호를 입력해주세요.</p>
			<button class="loginModalBtn" id="pwBtn">확인</button>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/d_makeAccount.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/j_mypage.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/z_script.js"></script>
</body>
</html>