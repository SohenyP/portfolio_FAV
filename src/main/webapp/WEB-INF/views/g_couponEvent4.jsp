<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일러를 위해</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/g_couponEvent4.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/z_paging.css">
<link rel="icon" href="${pageContext.request.contextPath}/media/logo/favicon.ico">
</head>

<body>
    <div class="container">
		<header>
			<a href="home" id="headerImg"><img class="logo" src="${pageContext.request.contextPath}/media/logo/home-top-logo3.png"></a>
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
								<input type="hidden" id="memId" name="memId" value="${sessionScope.account.memberId}">
								<ul id="beforeLogin" class="userMenu">
									<li><a href="login">로그인</a></li>
									<li><a href="makeAccountBefore">회원가입</a></li>
								</ul>
								<ul id="afterLogin" class="userMenu">
									<li><a href="myPage">마이페이지</a></li>
									<li><a href="logout?path=coupon&rowNum=4">로그아웃</a></li>
								</ul>
						</i></li>
					</ul>
				</div>
			</div>
		</header>
        <main id="mainForEvent4">
            <div class="eventCont">
                <div class="eventTitle">
                    <div class="eventTitletext">
                        <h1>우리 집 식탁의 
                        싱그러움 나누고, 
                        10% 할인쿠폰 받고!</h1>
                        <br>
                        <h3>일상적이지만 알고보면 모두 채식중인 우리,
                            나만의 채식 레시피를 공유해주세요.
                            페이버님들의 레시피를 시도한 후기 좋아요!
                        </h3>
                    </div>
                    <img src="${pageContext.request.contextPath}/media/event4.png" alt="">
                </div>
                <div class="eventContent">
                    <div class="eventCoupon">
                        <h1>10%할인 쿠폰 
                        (최대 5천원)</h1><br>
                        <p>사용기간 : 
                        2022.11.17 ~ 11.30</p>
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
                    </div>
                </div>
            </div>
            <div id="boardBox">
                <div class="board_contents">
                    <div class="faq_area">
                        <h1>채식 레시피 나누기</h1>
                        <div class="writebtnBox">
                            <button id="writeRecipe">글쓰기</button>
                       </div>
                        <table id="board">
                            <colgroup>
                                <col width="5%">
                                <col width="12%">
                                <col width="48%">
                                <col width="25%">
                                <col width="auto">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">구분</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">아이디</th>
                                    <th scope="col">작성일</th>
                                </tr>
                            </thead>
                            <!-- 게시글 리스트 -->
 							<c:forEach var="bbs" items="${bbsList}">
 							<c:set var="i" value="${i+1}" ></c:set>
                            <tbody class="list">
                                <tr>
                                    <td id="num${i}">${bbs.num}</td>
                                    <td id="bullet${i}">${bbs.bulletPoint}</td>
                                    <td>
                                       	<a href="" title="expand the area" class="info">${bbs.title}</a>
                                    </td>
                                    <td scope="row" id="memberId${i}">${bbs.memberId}</td>
                                    <!-- 자바스크립트로 아이디는 3글자 빼고 마스킹 처리 예정 -->
                                    <td>${bbs.createdate}</td>
                                </tr>
                                <tr class="description">
                                    <td colspan="5">
                                        <div class="answer">
                                        	<div class="content" id="content${i}">${bbs.content}</div>
                                        </div>
                                        <div id="modifyBtn" class="modifyBtn">
                                        	<c:if test="${sessionScope.account.memberId == bbs.memberId}">
												<button type="button" class="modifyPost" id="modifyPost${i}">수정</button>
												<button type="button" class="deletePost" id="deletePost${i}">삭제</button>
											</c:if>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                            </c:forEach>
                        </table>
                        <br /><br />
                        <!-- 게시글 작성 -->
                        <div id="writerBox">
	                        <form:form modelAttribute="couponbbsVO" action="insertBbs" id="writer" method="get">
	                        	<div id="writerInform">
									<label for="writerId">작성자 <form:input path="memberId" value="${sessionScope.account.memberId}" id="writerId" name="writerId" readonly="true"/></label>
									
									<form:select path="bulletPoint" id="writerBulletPoint">
										<form:option value="레시피"/>
										<form:option value="후기"/>
									</form:select>
								</div>
								<div class="contentBox">
									<form:input path="title" type="text" placeholder="제목을 입력해주세요" id="writerTitle"/>
									<form:textarea path="content" placeholder="내용을 입력해주세요" id="writerContent" cols="100" rows="50"/>
								</div>
								<div class="btnBox">
									<form:button type="button" id="backBoard">취소</form:button>
									<form:button type="button" id="submitPost">완료</form:button>
								</div>
							</form:form>
						</div>
                        <!-- 게시글 수정 -->
                        <div id="modifyBox">
	                        <form:form modelAttribute="couponbbsVO" action="updateBbs" id="modifier" method="get">
	                        	<div id="modifierInform">
									<label for="modifierId">작성자 <form:input path="memberId" value="" id="modifierId" name="modifierId" readonly="true"/></label>
									<form:select path="bulletPoint" id="modifyBulletPoint" value="">
										<form:option value="레시피"/>
										<form:option value="후기"/>
									</form:select>
								</div>
								<div class="contentBox">
									<form:input path="title" type="text" id="modifyTitle" value=""/>
									<form:textarea path="content" value="" id="modifyContent" cols="100" rows="50"/>
								</div>
								<div class="btnBox">
									<form:hidden path="num" value="" id="modifierNum"/>
									<form:button type="button" id="backBoard2">취소</form:button>
									<form:button type="button" id="modifyPost">완료</form:button>
								</div>
							</form:form>
						</div>
						<div id="pagingBox">
	                        <!-- 왼쪽 페이지 블럭 이동 -->
	                        <c:choose>
	                        	<c:when test="${(minBlock - 1 ) < 1}"></c:when>
	                        	<c:otherwise><a href="${pageContext.request.contextPath}/coupon?rowNum=4&num=${minBlock-1}"><img alt="movePageBlockToLeft" src="${pageContext.request.contextPath}/media/arrow/leftP.png" style="width:20px; height: 20px;"></a></c:otherwise>
	                        </c:choose>
							&nbsp;&nbsp;&nbsp;
							<!-- 왼쪽 페이지 이동 -->
							<c:choose>
								<c:when test="${num == 1}"></c:when>
								<c:otherwise><a href="${pageContext.request.contextPath }/coupon?rowNum=4&num=${num-1}"><img alt="movePageToLeft" src="${pageContext.request.contextPath}/media/arrow/left.png" style="width:20px; height: 20px;"></a></c:otherwise>
							</c:choose>
							&nbsp;&nbsp;
							<!-- 페이지별 선택 이동 -->
							<c:forEach begin="${minBlock}" end="${(total < maxBlock)? total:maxBlock }" step="1" var="i">
								<c:choose>
									<c:when test="${num == i}"><span style="color: #22c7a9;">${i}</span></c:when>
									<c:otherwise><a href="${pageContext.request.contextPath}/coupon?rowNum=4&num=${i}">${i}</a></c:otherwise>
								</c:choose>
							</c:forEach>
							&nbsp;&nbsp;
							<!-- 오른쪽 페이지 이동 -->
							<c:choose>
								<c:when test="${num == total}"></c:when>
								<c:otherwise><a href="${pageContext.request.contextPath }/coupon?rowNum=4&num=${num+1}"> <img alt="movePageToRight" src="${pageContext.request.contextPath}/media/arrow/right.png" style="width:20px; height: 20px;"> </a></c:otherwise>
							</c:choose>
							&nbsp;&nbsp;&nbsp;
							<!-- 오른쪽 페이지 블럭 이동 -->
							<c:choose>
								<c:when test="${maxBlock > total }"></c:when>
								<c:otherwise><a href="${pageContext.request.contextPath}/coupon?rowNum=4&num=${maxBlock+1}"> <img alt="movePageBlockToRight" src="${pageContext.request.contextPath}/media/arrow/rightP.png" style="width:20px; height: 20px;"> </a></c:otherwise>
							</c:choose>
						</div>
						<br /><br />
						
						</div>
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
						<li class="sns"><a href="https://www.facebook.com/profile.php?id=100074555263844" target="_blank"><i class="fab fa-facebook fa-lg"></i></a></li>
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
	
	<script type="text/javascript">
		/* 게시판 페이징시 스크롤 위치 = 게시판 */
		const board = document.getElementById("boardBox").offsetTop;
		const header = document.querySelector("header").offsetTop;

		if(${num > 1}) {
			window.scrollTo(0, board - header);
		}
		
		
	</script>
	<script type="text/javascript" src="js/g_couponEvent.js"></script>
	<script type="text/javascript" src="js/z_script.js"></script>
    <script type="text/javascript" src="js/g_couponEvent4.js"></script>
</body>
</html>