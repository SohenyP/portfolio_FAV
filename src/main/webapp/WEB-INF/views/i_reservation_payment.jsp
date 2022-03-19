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
                    <h1>예약완료</h1>
                    <p>예약이 완료되었습니다.</p>
                </div>
            </div>
            <div class="makeReserve-cont">
                <div class="reserve-form">
                    <form:form action="myPage" modelAttribute="reservationVO" method="get" id="finishBook">
                        <table>
                            <tbody>
                                <tr>
                                    <!-- 한글만 입력 -->
                                    <th>예약자 이름</th>
                                    <td><input type="text" name="memberName" id="memberName" readonly value="${param.memberName}" readonly="readonly"></td>
                                </tr>
                                <tr>
                                    <!-- JS로 현재시간보다 하루 이후로 설정하기 -->
                                    <th>날짜 / 시간</th>
                                    <td>
                                    	<input type="text" name="reservedDate" id="reservedDate" value="${param.reservationDate}" readonly="readonly">
                                    	<input type="text" name="reservedTime" id="reservedTime" value="${(param.reservationTime < 12)? '오전 '+= param.reservationTime+=':00':'오후 '+=param.reservationTime-12+=':00'}" readonly="readonly">
                                    </td>
                                </tr>
                                <tr>
                                    <th>인원</th>
                                    <td><input type="text" name="personnel" id="personnel" value="${param.personnel}" readonly="readonly"></td>
                                </tr>
                                <tr>
                                    <th>휴대폰</th>
                                    <td>
                                        <input type="text" name="memberContact" id="memberContact" value="${param.memberContact}" readonly="readonly">
                                    </td>
                                </tr> 
                                <tr></tr>
                                <tr>
                                	<th>예약금(₩/원)</th>
                                    <td>
                                        <input type="text" name="charge" id="charge" value="${param.charge}" readonly="readonly"/><br /><br />
                                        <c:if test="${param.couponName != ''}">
                                      		<input type="text" name="selectedCP" id="selectedCP" value="${param.couponName}" readonly="readonly">
                                        </c:if>
                                    </td>
                                </tr>
                                <tr></tr>
                                <tr>
                                	<th>예약번호</th>
                                    <td>
                                        <input type="text" name="reservationNum" id="reservationNum" value="${reservationNum}" readonly="readonly"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <button type="button" id="payment" style="width: 200px; font-size: 20px;">결제하기</button>
                        <button type="button" id="myPage" onclick="actionChange()"  style="width: 200px; font-size: 20px;">마이페이지</button>
                        
                         <form:hidden path="restauName" name="restauName" value="${param.restauName}"/>
                         <form:hidden path="restauAddr" name="restauAddr" value="${param.restauAddr}"/>
                    </form:form>
                </div>
              </div>  
        </main>
        
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
		
    </div>
    
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>
	
	<script type="text/javascript">
	$("#payment").click(function () {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp23364357');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
			pg: 'html5_inicis', // version 1.1.0부터 지원.
			/*
			'kakao':카카오페이,
			html5_inicis':이니시스(웹표준결제)
			'nice':나이스페이
			'jtnet':제이티넷
			'uplus':LG유플러스
			'danal':다날
			'payco':페이코
			'syrup':시럽페이
			'paypal':페이팔
			*/
			pay_method: 'card',
			/*
			'samsung':삼성페이,
			'card':신용카드,
			'trans':실시간계좌이체,
			'vbank':가상계좌,
			'phone':휴대폰소액결제
			*/
			merchant_uid: 'merchant_' + new Date().getTime(),
			/*
			merchant_uid에 경우
			https://docs.iamport.kr/implementation/payment
			위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			참고하세요.
			나중에 포스팅 해볼게요.
			*/
			name: '${param.restauName}',
			//결제창에서 보여질 이름
			amount: ${param.charge},
			//가격
			buyer_email: '${sessionScope.account.memberEmail}',
			buyer_name: '${param.memberName}',
			buyer_tel: '${sessionScope.account.memberContact}',
			buyer_addr: '',
			buyer_postcode: '',
			m_redirect_url: 'https://www.yourdomain.com/payments/complete'
			/*
			모바일 결제시,
			결제가 끝나고 랜딩되는 URL을 지정
			(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
			*/
			}, function (rsp) {
			console.log(rsp);
			if (rsp.success) {
			var msg = '결제가 완료되었습니다!';
			//msg += '고유ID : ' + rsp.imp_uid+'<br />'; 
			//msg += '상점 거래ID : ' + rsp.merchant_uid+'<br />';
			msg += '결제 금액 : ' + rsp.paid_amount+'<br />';
			msg += '결 승인번호 : ' + rsp.apply_num+'<br />';
			
			location.href="${pageContext.request.contextPath}/paymentDone?status=결제완료&reservationNum=${reservationNum}";
				
			} else {
			 var msg = '결제 실패 : ' + rsp.error_msg;
			}
			alert(msg);
			});
		});


	</script>
    <script type="text/javascript" src="js/z_script.js"></script>
    <script type="text/javascript" src="js/i_reservation.js"></script>
</body>
</html>