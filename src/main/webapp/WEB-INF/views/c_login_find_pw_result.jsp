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

<body>
	<div class="container">
		
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
		<main>
			<div class="login-cont">
				<h1>비밀번호 찾기</h1>
				<div class="login-form">
					<form action="" method="post" id="findForm">
						<input type="text" name="myId" id="myId" value="${result}" size="20" readonly="readonly"> 
				
						<button type="button" id="refindBtn">다시 조회하기</button>
						<button type="button" id="toLoginBtn">로그인 하기</button>
					</form>
				</div>
			</div>
		</main>
		
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
		
	</div>
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>

	<script type="text/javascript" src="js/z_script.js"></script>
	<script type="text/javascript" src="js/c_login.js"></script>
</body>
</html>