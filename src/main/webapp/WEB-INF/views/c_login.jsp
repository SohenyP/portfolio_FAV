<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일를 위해</title>
<link rel="stylesheet" href="css/z_ui.css">
<link rel="stylesheet" href="css/z_paging.css">
<link rel="icon" href="media/logo/favicon.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
</head>
<script type="text/javascript" src="js/z_backward.js"></script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<div class="container">
		
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
		<main>
			<div class="login-cont">
				<h1>로그인</h1>
				<div class="login-form">
					<form action="loginSubmit" method="post">
						<input type="text" name="memberId" id="memberId" placeholder="아이디를 입력해주세요" size="20"> 
						<input type="password" name="memberPw" id="memberPw" placeholder="비밀번호를 입력해주세요" size="30" autocomplete="off">
						<div class="secure-find">
							<div class="secure">
								<input type="checkbox" name="secureLog" id="secureLog"> <label for="secureLog">보안접속</label>
							</div>
							<div class="findInfo">
								<a href="toFindId">아이디 찾기</a> <a href="toFindPw">비밀번호 찾기</a>
							</div>
						</div>
						<button type="submit" id="loginBtn">로그인</button>
					</form>
					<a href="makeAccountBefore" class="make-account"><span>회원가입</span></a>
					<input type="hidden" name="isItUser" id="isItUser" value="${isItUser}"/>
				</div>
			</div>
		</main>
		
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
		
	
		<div id="modalCont-idpw">
				<div class="modal" id="idPw">
					<div class="title">
						<h2>알림메세지</h2>
					</div>
					<p>아이디와 비밀번호를 입력해주세요.</p>
					<button class="loginModalBtn" id="idPwBtn">확인</button>
				</div>
				<div class="modal" id="id">
					<div class="title">
						<h2>알림메세지</h2>
					</div>
					<p>아이디를 입력해주세요.</p>
					<button class="loginModalBtn" id="idBtn">확인</button>
				</div>
				<div class="modal" id="pw">
					<div class="title">
						<h2>알림메세지</h2>
					</div>
					<p>비밀번호를 입력해주세요.</p>
					<button class="loginModalBtn" id="pwBtn">확인</button>
				</div>
				<div class="modal" id="loginIdChk">
					<div class="title">
						<h2>알림메세지</h2>
					</div>
					<p>아이디가 존재하지 않습니다.</p>
					<button class="loginModalBtn" id="ChkIdBtn">확인</button>
				</div>
				<div class="modal" id="loginPwChk">
					<div class="title">
						<h2>알림메세지</h2>
					</div>
					<p>아이디와 패스워드가 일치하지 않습니다.</p>
					<button class="loginModalBtn" id="ChkPwBtn">확인</button>
				</div>
		</div>
	</div>
		
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>
		
		
		<script type="text/javascript" src="js/z_script.js"></script>
		<script type="text/javascript" src="js/c_login.js"></script>
</body>
</html>