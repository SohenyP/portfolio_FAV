<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일러를 위해</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/g_couponEvent5.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_paging.css">
<link rel="icon" href="${pageContext.request.contextPath}/media/logo/favicon.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

</head>

<body>
    <div class="container">
		
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
        <main>
            <div class="eventCont">
                <div class="eventTitle">
                    <div class="eventTitletext">
                        <h1>페이브의 새로운 가족을 소개합니다.
                            2022.12 ~</h1>
                        <br>
                        <h3>하루를 웨이팅으로 보내왔던 페이버를 위한
                            페이브의 망태자루를 공개합니다.
                            11월 30일부터 만나볼 수 있습니다.
                        </h3>
                    </div>
                    <img src="${pageContext.request.contextPath}/media/event6.png" alt="">
                </div>
                <div class="eventContent">
                    <div class="eventCoupon">
                        <h1>10%할인 쿠폰 
                        (최대 5천원)</h1><br>
                        <p>사용기간 : 
                        2022.11.30 ~ 12.31</p>
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
                        <p>쿠폰 최대 할인 금액은 5천원 입니다.</p>
                        <p>사정에 따라 내용이 변동될 수 있습니다.</p>
                    </div>
                </div>
            </div>
            <div class="newFavee-cont">
                <h1>COMMING SOON</h1>
                <div id="timer">
                    <section>
                        <div id="count"></div>
                    </section>
                </div>
                <div class="newFaveeList">
                    <article>
                        <div class="restauImg">
                            <img src="${pageContext.request.contextPath}/media/newfavee1.jpg" alt="">
                        </div>
                        <div class="restauInform">
                            <h1><a href="#">더 로바이트윈스</a></h1>
                            <h2>생채식 한국식 도넛</h2>
                            <p>서울 마포구</p>
                            <p>#인절미베리 #캐슈넛슬라이스</p>
                        </div>
                    </article>
                    <article>
                        <div class="restauImg">
                            <img src="${pageContext.request.contextPath}/media/newfavee2.jpg" alt="">
                        </div>
                        <div class="restauInform">
                            <h1><a href="#">어라운드 그린</a></h1>
                            <h2>유기농, 비정제, NON-GMO</h2>
                            <p>서울 마포구</p>
                            <p>#야채카레 #두부테리야키</p>
                        </div>
                    </article>
                    <article>
                        <div class="restauImg">
                            <img src="${pageContext.request.contextPath}/media/newfavee3.jpg" alt="">
                        </div>
                        <div class="restauInform">
                            <h1><a href="#">빵어니스타</a></h1>
                            <h2>無계란, 無유제품, 無설탕</h2>
                            <p>서울시 영등포구</p>
                            <p>#두부케잌 #아보카도커피</p>
                        </div>
                    </article>
                </div>
            </div>
        </main>
        
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
		
    </div>
    
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>

	<script type="text/javascript" src="js/g_couponEvent.js"></script>
	<script type="text/javascript" src="js/z_script.js"></script>
    <script type="text/javascript" src="js/g_couponEvent5.js"></script>
</body>
</html>