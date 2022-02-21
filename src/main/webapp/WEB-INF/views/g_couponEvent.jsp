<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일러를 위해</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_paging.css">
<link rel="icon" href="${pageContext.request.contextPath}/media/logo/favicon.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

</head>

<body>
    <div class="container">
		
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
        <div class="couponCont">
			<a href="coupon?rowNum=1">
                <div class="event" id="event1">
                    <h1>다가오는 연말시즌 페이브와</h1>
                    <h2>12월 예약 10% 할인</h2>
                </div>
            </a>
            <a href="coupon?rowNum=2">
                <div class="event" id="event2">
                    <h1>신규고객 20%할인 / 적립금 증정</h1>
                    <h2>2021 뉴페이버 쿠폰</h2>
                </div>
            </a>    
            <a href="coupon?rowNum=3">
                <div class="event" id="event3">
                    <h1>내달의 식당 &#12300페스코&#12301</h1>
                    <h2>12월 식당 투표하기</h2>
                </div>
            </a>

            <a href="coupon?rowNum=4">
                <div class="event" id="event4">
                    <h1>우리 집 식탁 위 싱그러움</h1>
                    <h2>채시피 나누기</h2>
                </div>
            </a>
            
            <a href="coupon?rowNum=5">
                <div class="event" id="event5">
                    <h1>페이브의 새 가족을 소개합니다.</h1>
                    <h2>뉴페이비 만나기</h2>
                </div>
            </a>
        </div>
        
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
		
    </div>
    
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>
	
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/z_script.js"></script>
</body>
</html>