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
		<header>
			<a href="home" id="headerImg"><img class="logo" src="media/logo/home-top-logo3.png"></a>
			<div class="navNsearch">
				<div class="totalmenu">
					<i class="fas fa-bars menu">
						<ul class="menu">
							<a href="welcomeFlex"><li><span><img src="media/meat.png" alt=""></span>플렉시테리언</li></a>
							<a href="welcomePollo"><li><span><img src="media/chicken-leg.png" alt=""></span>폴로 베지테리언</li></a>
							<a href="welcomePesco"><li><span><img src="media/seafood.png" alt=""></span>페스코 베지테리언</li></a>
							<a href="welcomeLtOv"><li><span><img src="media/dairy-products.png" alt=""><img src="media/egg.png" alt=""></span>락토 오보 베지테리언</li></a>
							<a href="welcomeOv"><li><span><img src="media/egg.png" alt=""></span>오보 베지테리언</li></a>
							<a href="welcomeLt"><li><span><img src="media/dairy-products.png" alt=""></span>락토 베지테리언</li></a>
							<a href="welcomeVegan"><li><span><img src="media/vegetable.png" alt=""></span>비건</li></a>
							<a href="welcomeFruit"><li><span><img src="media/fruit.png" alt=""></span>프루테리언</li></a>
						</ul>
					</i>
				</div>
				<div class="search-inner">
					<ul>
						<li><a href="aboutFAV">페이브</a></li>
						<li><a href="restaurent">식당찾기</a></li>
						<li><a href="coupon">쿠폰/이벤트</a></li>
					</ul>
				</div>
				<div class="usernav">
					<ul>
						<li>
							<form action="#" id="user-search">
								<span class="clear"><i class="fas fa-times"></i></span>
								<div class="icon">
									<i class="fas fa-search"></i>
								</div>
								<div class="inputbox">
									<input type="text" name="" id="homeIpt" placeholder="검색어를 입력하세요">
								</div>
							</form>
						</li>
						<li id="userIcon"><i class="fas fa-user">
								<input type="hidden" id="memId" name="memId" value="${account.memberId}">
								<ul id="beforeLogin" class="userMenu">
									<li><a href="login">로그인</a></li>
									<li><a href="makeAccountBefore">회원가입</a></li>
								</ul>
								<ul id="afterLogin" class="userMenu">
									<li><a href="myPage">마이페이지</a></li>
									<li><a href="logout?path=g_couponEvent">로그아웃</a></li>
								</ul>
						</i></li>
					</ul>
				</div>
			</div>
		</header>
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
		<footer>
			<div class="f-wrap" id="wrap1">
				<ul>
					<li>
						<h4>소개</h4>
						<ul>
							<li><a href="#">페이브 이용방법</a></li>
							<li><a href="#">뉴스룸</a></li>
							<li><a href="#">프롬 페이브</a></li>
						</ul>
					</li>
					<li>
						<h4>함께</h4>
						<ul>
							<li><a href="https://forms.gle/9i4jFDDnq8oAvJjZ6" target="_blank">입점하기</a></li>
							<li><a href="#">페이브와의 약속</a></li>
						</ul>
					</li>
					<li>
						<h4>지원</h4>
						<ul>
							<li><a href="#">코로나19 방안</a></li>
							<li><a href="#">페이버 중재센터</a></li>
							<li><a href="#">우.심.나.심</a></li>
							<li><a href="#">애니멀 페이버</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="f-wrap" id="wrap2">
				<div class="wrap-inner">
					<ul class="rights">
						<li>@2021 FAV. ALL RIGHTS RESERVED</li>
						<li><a href="#">개인정보처리방침</a></li>
						<li><a href="#">이용약관</a></li>
						<li><a href="#">인재채용</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
					<ul class="sns">
						<li class="sns"><a href="https://www.facebook.com/profile.php?id=100074555263844" target="_blank"><i
								class="fab fa-facebook fa-lg
                            "></i></a></li>
						<li class="sns"><a href="https://twitter.com/ForAllOfVeges" target="_blank"><i class="fab fa-twitter fa-lg"></i></a></li>
						<li class="sns"><a href="https://www.instagram.com/favcorp_fake/?hl=ko" target="_blank"><i class="fab fa-instagram fa-lg"></i></a></li>
					</ul>
				</div>
			</div>
			<div class="f-wrap" id="wrap3">
				<div class="info">
					<p>㈜페이브</p>
					<img src="${pageContext.request.contextPath}/media/logo/home-top-logo3.png" alt="">
					<p>
						대표자 : 박페이브&nbsp;&nbsp;사업자등록번호 : 010-12-34567&nbsp;&nbsp;통신판매업 신고번호 : 제2021-경기XX-1004호 <br>개인정보보호책임자 : 박페이브&nbsp;&nbsp;<i>경기도 분당시 판교로
							XXX</i>
					</p>
				</div>
				<div class="contact">
					<div class="phone">
						<h3>문의</h3>
						<h3>1633-XXXX</h3>
					</div>
					<div class="email">
						<h3>이메일 문의</h3>
						<h3>FAV@XXXX.COM</h3>
					</div>
				</div>
			</div>
		</footer>
    </div>
	<div class="mobile-bar">
		<ul>
			<li>
				<input type="radio" name="mobile-btn" id="tohome" value="tohome">
				<label for="tohome"> 
					<a href="home">
						<i class="fas fa-home"></i><br> 
						<span>홈으로</span>
					</a>
				</label>
			</li>
			<li>
				<input type="radio" name="mobile-btn" id="look" value="look">
				<label for="look">
					<a href="welcome">
						<i class="fas fa-bars"></i><br> 
						<span>둘러보기</span>
				 	</a>
				 </label>
			</li>
			<li>
				<input type="radio" name="mobile-btn" id="mypage" value="mypage">
				<label for="mypage">
				<c:choose>
					<c:when test="${sessionScope.account.memberId != null}">
						<a href="myPage">
							<i class="fas fa-user"></i><br> 
							<span>마이페이지</span>
						</a>
					</c:when>
					<c:otherwise>
						<a href="login">
							<i class="fas fa-user"></i><br> 
							<span>마이페이지</span>
						</a>
					</c:otherwise>
				</c:choose>
				</label>
			</li>
		</ul>
	</div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/z_script.js"></script>
</body>
</html>