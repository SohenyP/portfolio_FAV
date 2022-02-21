<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일러를 위해</title>
<link rel="stylesheet" href="css/z_ui.css">
<link rel="stylesheet" href="css/z_paging.css">
<link rel="icon" href="media/logo/favicon.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<!-- 결제모듈 테스트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.6.0.min.js"></script>
</head>

<body>
    <div class="container">
		
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
        <main id="reserveMain">
            <div class="received-restau">
                <div class="restauInform">
                    <h1>결제완료</h1>
                    <p>결제가 완료되었습니다.</p>
                </div>
                <br />
                <a href="home" id="payResultToHome">홈으로 돌아가기</a>
            </div>
        </main>
        
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

    </div>
    
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>
	
    <script type="text/javascript" src="js/z_script.js"></script>
</body>
</html>