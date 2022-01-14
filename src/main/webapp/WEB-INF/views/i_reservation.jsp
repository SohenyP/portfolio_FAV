<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일러를 위해</title>
<link rel="stylesheet" href="css/z_ui.css">
<link rel="stylesheet" href="css/z_paging.css">
<link rel="icon" href="media/logo/favicon.ico">
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
								<input type="hidden" id="memId" name="memId" value="${memId}">
								<ul id="beforeLogin" class="userMenu">
									<li><a href="login">로그인</a></li>
									<li><a href="makeAccountBefore">회원가입</a></li>
								</ul>
								<ul id="afterLogin" class="userMenu">
									<li><a href="myPage">마이페이지</a></li>
									<li><a href="logout?path=b_home">로그아웃</a></li>
								</ul>
						</i></li>
					</ul>
				</div>
			</div>
		</header>
        <main id="reserveMain">
            <div class="received-restau">
                <div class="restauInform">
                    <h1>${param.restauName}</h1>
                    <p>${param.restauAddr}</p>
                </div>
                <div id="backimg">
                    <div id="imagebox">
                        <img src="media/f_restaurent/${param.restauImg1}.jpg" alt="" class="fade">
                        <img src="media/f_restaurent/${param.restauImg2}.jpg" alt="" class="fade">
                        <img src="media/f_restaurent/${param.restauImg3}.jpg" alt="" class="fade">
                        <div class="nav">
                            <button id="left">⟨</button>
                            <button id="right">⟩</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="makeReserve-cont">
                <div class="reserve-form">
                    <form:form modelAttribute="reservationVO" action="reservationSubmit" method="post">
                        <table>
                            <tbody>
                                <tr>
                                    <!-- 한글만 입력 -->
                                    <th>예약자 이름<span>*</span></th>
                                    <td><form:input path="memberName" type="text" name="memberName" id="memberName" required="required" spellcheck="false" value="${sessionScope.account.memberName}" onKeyup="this.value=this.value.replace(/[^가-힣]/g,'');" pattern="^([가-힣]){2,5}$"/></td>
                                </tr>
                                <tr>
                                    <!-- JS로 현재시간보다 하루 이후로 설정 -->
                                    <th>날짜 / 시간<span>*</span></th>
                                    <td><form:input path="reservationDate" type="datetime-local" name="reservationDate" id="reservationDate" required="required"/></td>
                                </tr>
                                <tr>
                                    <th>인원<span>*</span></th>
                                    <td><form:input path="personnel" type="number" name="personnel" id="personnel" required="required" min="1" max="5"/></td>
                                </tr>
                                <tr>
                                    <th>휴대폰<span>*</span></th>
                                    <td>
                                        <form:input path="memberContact" type="text" name="memberContact" id="memberContact" maxlength="11" required="required" spellcheck="false" placeholder="- 없이 숫자만 입력하세요"
                                            onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${sessionScope.account.memberContact}"/>
                                    </td>
                                </tr>
                                <tr>
                                	<th>예약금(₩/원)<span>*</span></th>
                                    <td>
                                        <form:input path="charge" type="text" name="charge" id="charge" value="" readonly="readonly"/><br /><br />
                                        <input type="hidden" name="couponName" id="couponName" value=""/>
                                        <select id="selectedCP" name="selectedCP" onchange="checkTotal()">
                                        	<optgroup label="나의 쿠폰">
                                        		<option value="0" disabled="disabled" selected="selected">쿠폰을 선택하세요</option>
                                       	 		<c:forEach var="myCp" items="${myCoupon}">
                                        		<option value="${myCp.couponDC}">${myCp.couponName}</option>
                                       			</c:forEach>
                                       			<option value="0">선택안함</option>
                                        	</optgroup>
                                       	</select>
                                    </td>
                                </tr>
                                <tr>
                                	<form:hidden path="restauName" name="restauName" value="${param.restauName}"/>
                                	<form:hidden path="restauAddr" name="restauAddr" value="${param.restauAddr}"/>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="2" id="caution-title">&#10094;유의사항&#10095;</th>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <ul style="text-align:left; margin-left:2rem;" id="cautionList">
                                            <li>* 본 예약은 예약금을 지불하는 선예약제 입니다.</li>
                                            <li>* 예약 확정 시 기재한 휴대폰 번호로 문자를 보내드립니다.</li>
                                            <li>* 예약금은 즉시 전달되므로 페이브를 통한 환불은 불가합니다.</li>
                                            <li id="caution-remark">&nbsp;&nbsp;&nbsp;(경우에 따라 예약한 식당을 통해 환불이 가능합니다.)
                                            </li>
                                            <li>*5명 이상 단체 예약은 식당에 직접 문의하시기 바랍니다.</li>
                                        </ul>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                        <button type="submit" id="reserveBtn">예약하기</button>
                    </form:form>
                </div>
              </div>  
        </main>
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
					<img src="media/logo/home-top-logo3.png" alt="">
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
        <div id="modalContApproved">
            <div class="modal">
                <div class="title">
                    <h2>알림메세지</h2>
                </div>
                <p>예약이 완료되었습니다. <br>마이페이브에서 내역을 확인하세요.</p>
                <button id="reservationModalBtn">확인</button>
            </div>
        </div>

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
				<input type="radio" name="mobile-btn" id="login" value="login">
				<label for="login">
					<a href="login">
						<i class="fas fa-user"></i><br> 
						<span>마이페이지</span>
					</a>
				</label>
			</li>
		</ul>
	</div>

    <script type="text/javascript" src="js/z_script.js"></script>
    <script type="text/javascript" src="js/i_reservation.js"></script>
</body>
</html>