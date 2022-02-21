<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일러를 위해</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/g_couponEvent3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_ui.css">
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
						<h1>술과 해산물이 어울리는 
						12월 내달의 식당 
						&#12300페스코&#12301</h1>
						<br>
						<h3>날씨가 선선해지면 생각나는 해산물과 
						어울리는 반주는 추운 날씨를 잊게 만들죠. 
						페이브가 엄선한 내달의 페스코 식당에 투표하세요.</h3>
					</div>
					<img src="media/event3.png" alt="">
				</div>
				<div class="eventContent">
					<div class="eventCoupon">
						<h1>50%할인 쿠폰 
						(최대 2만원)</h1>
						<br>
						<p>사용기간 : 
						2022.12.01 ~ 12.31</p>
						<p>쿠폰함에서 쿠폰을 확인하세요</p>
					</div>
                    <form:form action="getCoupon" method="get" modelAttribute="couponInform" id="couponForm">
	                    <c:choose>
	                     	<c:when test="${sessionScope.account.memberId != null}">
	                     		<form:hidden path="rowNum"/>
	                     		<form:hidden path="couponNum"/>
	                     		<form:hidden path="couponName"/>
	                     		<form:hidden path="couponDC"/>
	                     		<form:hidden path="couponMax"/>
	                     		<form:hidden path="couponExpire"/>
	                    		<button type="button" id="getCPbtn">쿠폰받기</button>
								<input type="hidden" id="voted" value="${voted}"/>
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
                    </div>
                </div>
            </div>
            <div class="eventRestauList">
                <h1>내달의 식당</h1>
                <div class="ListContent">
	                <c:forEach var="voteResult" items="${voteList}">
	                <article>
	                	<div class="restauImg">
	                    	<img src="${pageContext.request.contextPath}/media/g.eventCoupon/${voteResult.candiImg}" alt="">
	                    </div>
	           			<div class="restauInform">
	                   		<h1><a href="">${voteResult.candidate}</a></h1>
							<h2>${voteResult.candiIntro}</h2>
							<p>${voteResult.candiAddr}</p>
							<p>${voteResult.candiMenu}</p>
	                	  	<p class="voteResult">${voteResult.candiCnt}표</p>
	               		</div>
	                </article>
	                </c:forEach>
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