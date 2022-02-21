<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일러를 위해</title>
<link rel="icon" href="${pageContext.request.contextPath}/media/logo/favicon.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/g_couponEvent2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_paging.css">
</head>

<body>
    <div class="container">
		
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
        <main>
            <div class="eventCont">
                <div class="eventTitle">
                    <div class="eventTitletext">
                        <h1>20% 할인쿠폰 / 적립금 20,000원
                            뉴페이버님 반갑습니다!</h1>
                        <br>
                        <h3>페이브와의 첫 시작을 감사드리는 마음으로
                            작은 선물을 준비했습니다.
                            페이브와의 기분 좋은 시작을 도와드리겠습니다.
                        </h3>
                    </div>
                    <img src="${pageContext.request.contextPath}/media/event2.png" alt="">
                </div>
                <div class="eventContent">
                    <div class="eventCoupon">
                        <h1>20%할인 쿠폰 (최대 1만원)</h1><br>
                        <p>사용기간 : 가입일로부터 30일</p>
                        <p>쿠폰함에서 쿠폰을 확인하세요</p>
                    </div>
                     <form:form action="" method="get" modelAttribute="couponInform" id="couponForm">
	                    <c:choose>
	                     	<c:when test="${sessionScope.account.memberId != null}">
	                     		<form:hidden path="rowNum"/>
	                     		<form:hidden path="couponNum"/>
	                     		<form:hidden path="couponName"/>
	                     		<form:hidden path="couponDC"/>
	                     		<form:hidden path="couponMax"/>
	                     		<form:hidden path="couponExpire"/>
	                    		<button type="button" id="getCPbtn">쿠폰받기</button>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<button type="button" id="goToLogin">쿠폰받기</button>
	                    	</c:otherwise>
	                    </c:choose>
                    </form:form>
                    
                 	<input type="hidden" value="${alertMSG}" id="alertMSG"/>
                    <div class="eventNotice">
                        <p>유의사항</p>
                        <p>쿠폰은 ID당 1회 사용 가능합니다.</p>
                        <p>쿠폰 최대 할인 금액은 1만원 입니다.</p>
                        <p>사정에 따라 이벤트 내용이 변경될 수 있습니다.</p>
                    </div>
                </div>
            </div>
        </main>
		
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
		
    </div>
    
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>

	<script type="text/javascript" src="js/g_couponEvent.js"></script>
	<script type="text/javascript" src="js/z_script.js"></script>
</body>
</html>