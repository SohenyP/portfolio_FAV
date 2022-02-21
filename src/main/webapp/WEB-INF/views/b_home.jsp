<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일를 위해</title>
<link rel="stylesheet" href="css/b_home.css">
<link rel="stylesheet" href="css/z_paging.css">
<link rel="icon" href="media/logo/favicon.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
</head>	

<body>
	<div class="container">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
		<aside>
			<div class="noti-back">
				<div class="noti-inner">
					<div class="noti-wrap">
						<button id="prev">
							<span>⟨</span>
						</button>
						<div class="notice fadeInOut" id="note1">
							<a href="coupon?rowNum=1">
								<h1>다가오는 
								연말시즌</h1>
								<p>12월 예약 할인</p>
								<p>11.17 ~ 30</p>
							</a>
						</div>
						<div class="notice fadeInOut" id="note2">
							<a href="coupon?rowNum=2">
								<h1>첫 예약 
								20% 할인</h1>
								<p>20,000₩ 
								적립금 챙기세요</p>
								<p>~ 2021.12.31</p>
							</a>
						</div>
						<div class="notice fadeInOut" id="note3">
							<a href="coupon?rowNum=3">
								<h1>맛있는 
								12월의 시작</h1>
								<p>페스코 식당과 함께!</p>
								<p>미리 만나보기</p>
							</a>
						</div>
						<div class="notice fadeInOut" id="note4">
							<a href="coupon?rowNum=4">
								<h1>우리 집 
								식탁의 비밀</h1>
								<p>채식 레시피로 
								지구 살리기</p>
								<p>11.17 ~ 12.31</p>
							</a>
						</div>
						<div class="notice fadeInOut" id="note5">
							<a href="coupon?rowNum=5">
								<h1>페이브의 
								새로운 가족</h1>
								<p>#더 로바이 트윈스&nbsp;&nbsp; 
								#어라운드 그린&nbsp;&nbsp; 
								#빵어니스타</p>
								<p>신규 식당 예약 
								1,000₩ 쿠폰</p>
							</a>
						</div>
						<button id="next">
							<span>⟩</span>
						</button>
					</div>
				</div>
			</div>
		</aside>
		<main>
			<section>
				<h1>지역별 식당 찾기</h1>
				<div class="articleWrap">
					<article id="cityRestSlidebox">
						<form action="restaurent" method="get">
							<input type="hidden" name="location" id="location" value="서울" />
							<button type="submit" style="border: none; outline: none; background-color:#fff;">
								<div class="city">
									<h2 class="cityName">서울</h2>
									<div class="cityImg">
										<img src="media/nation/seoul.jpg" alt="">
									</div>
								</div>
							</button>
						</form>
						<form action="restaurent" method="get">
							<input type="hidden" name="location" id="location" value="전주" />
							<button type="submit" style="border: none; outline: none; background-color:#fff;">
								<div class="city">
									<h2>전주</h2>
									<div class="cityImg">
										<img src="media/nation/jeonju.jpg" alt="">
									</div>
								</div>
							</button>
						</form>
						<form action="restaurent" method="get">
							<input type="hidden" name="location" id="location" value="여수" />
							<button type="submit" style="border: none; outline: none; background-color:#fff;">
								<div class="city">
									<h2>여수</h2>
									<div class="cityImg">
										<img src="media/nation/yeosu.jpg" alt="">
									</div>
								</div>
							</button>
						</form>
						<form action="restaurent" method="get">
							<input type="hidden" name="location" id="location" value="대전" />
							<button type="submit" style="border: none; outline: none; background-color:#fff;">
								<div class="city">
									<h2>대전</h2>
									<div class="cityImg">
										<img src="media/nation/daejeon.jpg" alt="">
									</div>
								</div>
							</button>
						</form>
						<form action="restaurent" method="get">
							<input type="hidden" name="location" id="location" value="청주" />
							<button type="submit" style="border: none; outline: none; background-color:#fff;">
								<div class="city">
									<h2>청주</h2>
									
									<div class="cityImg">
										<img src="media/nation/cheongju.jpg" alt="">
									</div>
								</div>
							 </button>
						</form>
						<form action="restaurent" method="get">
							<input type="hidden" name="location" id="location" value="경기" />
							<button type="submit" style="border: none; outline: none; background-color:#fff;">
								<div class="city">
									<h2>경기</h2>
									
									<div class="cityImg">
										<img src="media/nation/kyeongki.jpg" alt="">
									</div>
								</div>
							</button>
						</form>
						<form action="restaurent" method="get">
							<input type="hidden" name="location" id="location" value="부산" />
							<button type="submit" style="border: none; outline: none; background-color:#fff;">
								<div class="city">
									<h2>부산</h2>
									<div class="cityImg">
										<img src="media/nation/busan.jpg" alt="">
									</div>
								</div>
							</button>
						</form>
						<form action="restaurent" method="get">
							<input type="hidden" name="location" id="location" value="포항" />
							<button type="submit" style="border: none; outline: none; background-color:#fff;">
								<div class="city">
									<h2>포항</h2>
									<div class="cityImg">
										<img src="media/nation/pohang.jpg" alt="">
									</div>
								</div>
							</button>
						</form>
						<form action="restaurent" method="get">
							<input type="hidden" name="location" id="location" value="강원" />
							<button type="submit" style="border: none; outline: none; background-color:#fff;">
								<div class="city">
									<h2>강원</h2>
									<div class="cityImg">
										<img src="media/nation/kangwon.jpg" alt="">
									</div>
								</div>
							</button>
						</form>
						<form action="restaurent" method="get">
							<input type="hidden" name="location" id="location" value="제주" />
							<button type="submit" style="border: none; outline: none; background-color:#fff;">
								<div class="city">
									<h2>제주</h2>
									<div class="cityImg">
										<img src="media/nation/jeju.jpg" alt="" id="img1">
									</div>
								</div>
							</button>
						</form>
					</article>
				</div>
			</section>
			<section id="sec2">
				<h1>이달의 페이브</h1>
				<div class="sec-wrap">
					<article id="art1">
						<div class="res-photo">
							<img src="media/res-photo1.png" alt=""> <img src="media/res-photo11.png" alt="">
						</div>
						<div class="res-text">
							<h2>발우공양</h2>
							<p>사찰음식으로 경험하는 미식의 세계!</p>
							<br>
							<p>
								세계 최초 미쉐린 가이드 선정 사찰 음식점으로<br>매해 사계절 새로운 구성의 식단을 제공합니다.
							</p>
							<p>시그니쳐 메뉴 : 모듬 버섯 강정</p>
							<form action="reservation" method="post">
								<input type="submit" value="예약하기">
								<input type="hidden" name="restauName" value="발우공양" />
								<input type="hidden" name="restauAddr" value="서울시 종로구 견지동" />
								<input type="hidden" name="restauImg1" value="su1-1" />
								<input type="hidden" name="restauImg2" value="su1-2" />
								<input type="hidden" name="restauImg3" value="su1-3" />
							</form>
						</div>
					</article>
					<article>
						<div class="res-text">
							<h2>망넛이네</h2>
							<p>글루텐 프리 비건 베이커리</p>
							<p>
								찹쌀가루로 만들어 쫀득한 식감을 가진 빵으로<br>다이어트에 좋을 것 같지만 글쎄요?
							</p>
							<p>시그니쳐 메뉴 : 찹싸루니</p>
							<form action="reservation" method="post">
								<input type="submit" value="예약하기">
								<input type="hidden" name="restauName" value="망넛이네" />
								<input type="hidden" name="restauAddr" value="서울시 서대문구 연희동" />
								<input type="hidden" name="restauImg1" value="su2-1" />
								<input type="hidden" name="restauImg2" value="su2-2" />
								<input type="hidden" name="restauImg3" value="su2-3" />
							</form>
						</div>
						<div class="res-photo">
							<img src="media/res-photo2.png" alt=""> <img src="media/res-photo22.png" alt="">
						</div>
					</article>
					<article>
						<div class="res-photo">
							<img src="media/res-photo3.png" alt=""> <img src="media/res-photo33.png" alt="">
						</div>
						<div class="res-text">
							<h2>제로비건</h2>
							<p>채수를 활용한 한식당</p>
							<p>
								제로비건 사장님은 말씀하십니다.<br>비건 감자탕이 지구를 구할 것이라고.
							</p>
							<p>시그니쳐 메뉴 : 채식감자탕</p>
							<form action="reservation" method="post">
								<input type="submit" value="예약하기">
								<input type="hidden" name="restauName" value="제로비건" />
								<input type="hidden" name="restauAddr" value="서울시 송파구 잠실3동" />
								<input type="hidden" name="restauImg1" value="su3-1" />
								<input type="hidden" name="restauImg2" value="su3-2" />
								<input type="hidden" name="restauImg3" value="su3-3" />
							</form>
						</div>
					</article>
				</div>
			</section>
			<section>
				<article>
					<h1>페이브 입점하기</h1>
					<div class="together">
						<img src="media/bg/headerbg3-2.png" alt="">
						<form action="https://forms.gle/9i4jFDDnq8oAvJjZ6" target="_blank">
							<input type="submit" value="페이브와 함께하기">
						</form>
					</div>
				</article>
			</section>
			<section>
				<h1>이달의 채식 축제</h1>
				<div class="festival">
					<div class="festival-img1">
						<img src="media/bg/dome1back.png" alt="">
						<div class="domestic">
							<c:forEach var="domeList" items="${festivalDList}">
								<div class="dome" id="dome${domeList.id}">
									<h2>${domeList.city}</h2>
									<p>
										<a href="${domeList.site}" target="_blank">${domeList.title}</a>
									</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="festival-img2">
						<img src="media/bg/fore1back.png" alt="">
						<div class="foreign">
							<c:forEach var="foreList" items="${festivalFList}">
							<div class="fore" id="fore${foreList.id}">
								<h2>${foreList.city}</h2>
								<p>
									<a href="${foreList.site}" target="_blank">${foreList.title}</a>
								</p>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
		</main>
		
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	</div>
	
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>
	
	<script type="text/javascript" src="js/z_script.js"></script>
	<script type="text/javascript" src="js/b_home.js"></script>

</body>
</html>