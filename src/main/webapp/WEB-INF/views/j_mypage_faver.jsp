<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일를 위해</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/j_mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_paging.css">
<link rel="icon" href="${pageContext.request.contextPath}/media/logo/favicon.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<!-- 결제모듈 테스트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.6.0.min.js"></script>
</head>

<body>
	<div class="container">
		
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
		<div class="mypage">
			<nav>
				<ul>
					<li>
						<ul>
							<li>
								<figure class="userPhoto" />
							</li>
							<li><h4>${isFaver.memberName}</h4></li>
						</ul>
					</li>
					<li data-num="1" class="navBtn">내 정보</li>
					<li data-num="2" class="navBtn">내 쿠폰</li>
					<li data-num="3" class="navBtn">예약보기</li>
					<li data-num="4" class="navBtn">1:1 문의</li>
					<li><a href="toDeleteAccount">탈퇴하기</a></li>
				</ul>
			</nav>
			<div class="mypageMain">
				<div class="myInform" id="myInform">
					<h1>${isFaver.memberName}
						<span>페이버님의 개인정보</span>
					</h1>
					<table>
						<tbody>
							<tr>
								<th>아이디</th>
								<td>${isFaver.memberId}</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>${isFaver.memberName}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${isFaver.memberEmail}</td>
							</tr>
							<tr>
								<th>휴대폰</th>
								<td>${isFaver.memberContact}</td>
							</tr>
						</tbody>
					</table>
					<div class="goToChangeInform">
						<a href="changeInformBefore" class="goToChangeInform btn">내 정보 수정하기</a>
					</div>
				</div>
				<div class="myCoupon" id="myCoupon">
					<h1>${isFaver.memberName}
						<span>페이버님의 쿠폰</span>
					</h1>
					<table>
						<thead>
							<tr>
								<th>쿠폰이름</th>
								<th>할인율</th>
								<th>만료일</th>
								<th>사용여부</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="cp" items="${myCoupon}">
							<tr>
								<td>${cp.couponName}</td>
								<td><fmt:formatNumber value="${cp.couponDC}" type="percent"/></td>
								<td>${cp.couponExpire}</td>
								<c:choose>
									<c:when test="${cp.isExpire=='N'}">
										<td style="color:green;">미사용</td>
									</c:when>
									<c:when test="${cp.isExpire=='Y'}">
										<td style="color:red;">사용완료</td>
									</c:when>
									<c:otherwise>
										<td style="color:blue;">기간만료</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="myReceived" id="myReceived">
					<h1>${isFaver.memberName}
						<span>페이버님의 예약내역</span>
					</h1>
					<table>
						<thead>
							<tr>
								<th>No.</th>
								<th>예약번호</th>
								<th>예약자</th>
								<th>식당</th>
								<th>예약일</th>
								<th>인원</th>
								<th>결제</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="rsv" items="${myReservation}">
						<c:set var="i" value="${i+1}"></c:set>
							<tr>
								<td>${i}</td>
								<td class="reserveNumTd">${rsv.reservationNum}</td>
								<td>${rsv.memberName}</td>
								<td>${rsv.restauName}</td>
								<td>${rsv.reservationDate}</td>
								<td>${rsv.personnel}명</td>
								<c:choose>
									<c:when test='${rsv.status == "결제완료"}'>
										<td>${rsv.status}</td>
										<input type="hidden"  name="restauName${i}" class="restauName" value="${rsv.restauName}" />
										<input type="hidden"  name="charge${i}" class="charge" value="${rsv.charge}" />
									</c:when>
									<c:otherwise>
										<td>
											<button type="button" class="payment" onclick="payment(${i})">결제하기</button>
											<input type="hidden"  name="restauName${i}" class="restauName" value="${rsv.restauName}" />
											<input type="hidden"  name="charge${i}" class="charge" value="${rsv.charge}" />
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="myQna" id="myQna">
					<div id="qnaBox">
						<h1>${isFaver.memberName}
							<span>페이버님의 문의내역</span>
						</h1>
						<div id="btnBox">
							<button id="writeQna">문의하기</button>
						</div>
						<!-- 게시글 리스트 -->
						<div class="qnaList" id="qnaList">
							<table>
								<thead>
									<tr>
										<th>No.</th>
										<th>구분</th>
										<th>제목</th>
										<th>작성일</th>
										<th>답변상태</th>
									</tr>
								</thead>
								<c:forEach var="qna" items="${qnaList}">
									<c:set var="r" value="${r+1}"></c:set>
									<tbody class="list">
										<tr>
											<td id="no">${r}</td>
											<td id="bullet${r}">${qna.bullet}</td>
											<td><a href="" title="클릭시 확장됩니다." class="info" id="info">${qna.title}</a>
											</td>
											<td scope="row">${qna.createdate}</td>
											<!-- 자바스크립트로 아이디는 3글자 빼고 마스킹 처리 예정 -->
											<td>${qna.status}</td>
										</tr>
										<tr class="description" id="description">
											<td colspan="5">
												<div class="answer">
													<div class="content">${qna.content}</div>
												</div>
												<div id="qnaBtn" class="qnaBtn">
													<c:if
														test="${sessionScope.account.memberId == qna.memberId}">
														<input type="hidden" name="rowNum" value="${qna.rowNum}" class="rowNum" />
														<button type="button" class="modifyQna">수정</button>
														<button type="button" class="deleteQna">삭제</button>
													</c:if>
												</div>
											</td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div> 
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	</div>
	
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>
	
	<script type="text/javascript">
		
	function payment(i) {
		console.log(i);
		
		let $name = $(`.restauName`).eq(i-1).val();
		let $charge = $(`.charge`).eq(i-1).val();
		console.log($charge);

				var IMP = window.IMP; // 생략가능
				IMP.init('imp23364357');
				// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
				IMP.request_pay({
						pg : 'html5_inicis', // version 1.1.0부터 지원.
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
						pay_method : 'card',
						/*
						'samsung':삼성페이,
						'card':신용카드,
						'trans':실시간계좌이체,
						'vbank':가상계좌,
						'phone':휴대폰소액결제
						 */
						merchant_uid : 'merchant_'+ new Date().getTime(),
						/*
						merchant_uid에 경우
						https://docs.iamport.kr/implementation/payment
						위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.	
						 */
						name : $name,
						//결제창에서 보여질 이름
						amount : $charge,
						//$charge,
						//가격
						buyer_email : '${sessionScope.account.memberEmail}',
						buyer_name :  '${isFaver.memberName}',
						buyer_tel : '${sessionScope.account.memberContact}',
						buyer_addr : '',
						buyer_postcode : '',
						m_redirect_url : 'https://www.yourdomain.com/payments/complete'
						/*
						모바일 결제시,
						결제가 끝나고 랜딩되는 URL을 지정
						(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
						*/
					},
					function(rsp) {
						console.log(rsp);
						if (rsp.success) {
							var msg = '결제가 완료되었습니다!';
							//msg += '고유ID : ' + rsp.imp_uid+'<br />'; 
							//msg += '상점 거래ID : ' + rsp.merchant_uid+'<br />';
							msg += '결제 금액 : ' + rsp.paid_amount+'<br />';
							msg += '결 승인번호 : ' + rsp.apply_num+'<br />';

						location.href = "${pageContext.request.contextPath}/paymentDone?status=결제완료&reservationNum="+$reservationNum;

					} else {
						 var msg = '결제 실패 : ' + rsp.error_msg;
					}
					alert(msg);
				});

			};
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/j_mypage.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/z_script.js"></script>

</body>
</html>