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
            <div class="chooseWhichTypeOfMember">
               <h1>회원가입이 완료되었습니다.</h1>
               <ul>
                	<a href="login"><li>로그인</li></a>
                	<a href="home"><li>홈으로</li></a>
               </ul>
            </div>
        </main>
        
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
		
        <div id="modalCont-id">
            <div class="modal">
                <div class="title">
                    <h2>알림메세지</h2>
                </div>
                <p>아이디를 입력해주세요.</p>
                <button id="makeAccountBtn1">확인</button>
            </div>
        </div>
        <div id="modalCont-id-check">
            <div class="modal">
                <div class="title">
                    <h2>알림메세지</h2>
                </div>
                <p>사용할 수 있는 아이디입니다.</p>
                <button id="makeAccountBtn11">사용하기</button>
            </div>
        </div>

        <div id="modalCont-email">
            <div class="modal">
                <div class="title">
                    <h2>알림메세지</h2>
                </div>
                <p>이메일을 입력해주세요.</p>
                <button id="makeAccountBtn2">확인</button>
            </div>
        </div>
        <div id="modalCont-email-check">
            <div class="modal">
                <div class="title">
                    <h2>알림메세지</h2>
                </div>
                <p>사용할 수 있는 메일입니다.</p>
                <button id="makeAccountBtn22">사용하기</button>
            </div>
        </div>

        <div id="modalCont-phone">
            <div class="modal">
                <div class="title">
                    <h2>알림메세지</h2>
                </div>
                <p>휴대폰 번호를 입력해주세요.</p>
                <button id="makeAccountBtn3">확인</button>
            </div>
        </div>
    </div>
    
  <jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>



   <script src="js/z_script.js"></script>
</body>

</html>