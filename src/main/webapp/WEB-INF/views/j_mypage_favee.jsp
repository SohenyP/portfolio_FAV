<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일를 위해</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/b_home.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/j_mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_paging.css">
<link rel="icon" href="${pageContext.request.contextPath}/media/logo/favicon.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.6.0.min.js"></script>
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
									<li><a href="logout?path=home">로그아웃</a></li>
								</ul>
						</i></li>
					</ul>
				</div>
			</div>
		</header>
		<div class="mypage">
			<nav>
				<ul>
					<li>
						<ul>
							<li>
								<figure class="userPhoto" />
							</li>
							<li><h4>${isFavee.memberId}</h4></li>
						</ul>
					</li>
					<li data-num="1" class="navBtn">내 정보</li>
					<li data-num="2" class="navBtn">내 식당</li>
					<li data-num="3" class="navBtn">예약보기</li>
					<li data-num="4" class="navBtn">1:1 문의</li>
					<li><a href="toDeleteAccount">탈퇴하기</a></li>
				</ul>
			</nav>
			<div class="mypageMain">
				<div class="myInform" id="myInform">
					<h1>${isFavee.memberName}
						<span> 페이비님의 개인정보</span>
					</h1>
					<table>
						<tbody>
							<tr>
								<th>아이디</th>
								<td>${isFavee.memberId}</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>${isFavee.memberName}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${isFavee.memberEmail}</td>
							</tr>
							<tr>
								<th>휴대폰</th>
								<td>${isFavee.memberContact}</td>
							</tr>
						</tbody>
					</table>
					<div class="goToChangeInform">
						<a href="changeInformBefore" class="goToChangeInform btn">내 정보 수정하기</a>
					</div>
				</div>
				<div class="myRestaurent" id="myRestaurent">
					<h1>${isFavee.memberName}
						<span>페이비님의 식당</span>
					</h1>
					<table>
						<thead>
							<tr>
								<th>이름</th>
								<th>주소</th>
								<th>대표메뉴</th>
								<th>스타일</th>
								<th>등록된 이미지</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="store" items="${myRestaurent}">
							<tr>
								<td>${store.restauName}</td>
								<td>${store.restauAddr}</td>
								<td>${store.restauMenu}</td>
								<td>${store.restauStyle}</td>
								<td>
									<ul class="ImageList">
										<li><img src="${pageContext.request.contextPath}/media/f_restaurent/${store.restauImg1}.jpg" alt="이미지1" class="ownerIamge" style="width: 100px; height: 100px;" /></li>
										<li><img src="${pageContext.request.contextPath}/media/f_restaurent/${store.restauImg2}.jpg" alt="이미지2" class="ownerIamge" style="width: 100px; height: 100px;" /></li>
										<li><img src="${pageContext.request.contextPath}/media/f_restaurent/${store.restauImg3}.jpg" alt="이미지3" class="ownerIamge" style="width: 100px; height: 100px;" /></li>
									</ul>
									<button>수정하기</button>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="myReceived" id="myReceived">
					<h1>${isFavee.memberName}
						<span>페이비님의 예약내역</span>
					</h1>
					<table>
						<thead>
							<tr>
								<th>No.</th>
								<th>예약번호</th>
								<th>예약자</th>
								<th>식당명</th>
								<th>예약일</th>
								<th>예약인원</th>
								<th>결제상태</th>
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
									</c:when>
									<c:otherwise>
										<td>
											<input type="hidden" name="memberName${i}" id="memberName${i}" value="${rsv.memberName}" />
											<input type="hidden"  name="restauName${i}" id="restauName${i}" value="${rsv.restauName}" />
											<input type="hidden"  name="reservationDate${i}" id="reservationDate${i}" value="${rsv.reservationDate}" />
											<input type="hidden"  name="personnel${i}" id="personnel${i}" value="${rsv.personnel}" />
											<input type="hidden"  name="charge${i}" id="charge${i}" value="${rsv.charge}" />
											<input type="hidden"  name="reservationNum${i}" id="reservationNum${i}" value="${rsv.reservationNum}" />
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="myQna" id="myQna1">
					<div id="qnaBox">
						<h1>${isFavee.memberName}
							<span>페이비님의 문의내역</span>
						</h1>
						<div id="btnBox">
							<button id="writeQna1" >문의하기</button>
						</div>
						<!-- 게시글 리스트 -->
						<div class="qnaList" id="qnaList1">
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
									<c:set var="e" value="${e+1}"></c:set>
									<tbody class="list">
										<tr>
											<td id="no">${e}</td>
											<td id="bullet${e}">${qna.bullet}</td>
											<td><a href="" title="expand the area" class="info" id="info1">${qna.title}</a>
											</td>
											<td scope="row">${qna.createdate}</td>
											<!-- 자바스크립트로 아이디는 3글자 빼고 마스킹 처리 예정 -->
											<td>${qna.status}</td>
										</tr>
										<tr class="description">
											<td colspan="5">
												<div class="answer">
													<div class="content">${qna.content}</div>
												</div>
												<div id="qnaBtn" class="qnaBtn">
													<c:if test="${sessionScope.account.memberId == qna.memberId}">
														<input type="hidden" name="rowNum" value="${qna.rowNum}" class="rowNum" />
														<button type="button" class="modifyQna" >수정</button>
														<button type="button" class="deleteQna" >삭제</button>
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
	<div id="ownerImageModal">
		<div class="ownerImageModalBox">
			<img src="" alt="" />
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
				<input type="radio" name="mobile-btn" id="mypage" value="mypage">
				<label for="mypage">
				<c:choose>
					<c:when test="${account.memberId != null}">
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

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/j_mypage.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/z_script.js"></script>

</body>
</html>