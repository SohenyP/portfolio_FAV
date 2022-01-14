<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일를 위해</title>
<link rel="stylesheet" href="css/z_ui.css">
<link rel="stylesheet" href="css/z_paging.css">
<link rel="icon" href="media/logo/favicon.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
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
									<li><a href="logout?path=d_makeAccount_favee">로그아웃</a></li>
								</ul>
						</i></li>
					</ul>
				</div>
			</div>
		</header>
		<main>
			<div class="makeAccount-cont">
				<h1>점주회원가입</h1>
				<div class="account-form">
					<form action="makeAccount" id="forFavee" method="post">
						<p><span>*</span>필수입력사항</p>
						<table>
							<tbody>
								<tr id="idPart">
									<th>아이디<span>*</span></th>
									<td>
										<!-- 아이디 : 6~30자 사이 영대소문자 숫자 --> 
										<input type="text" name="newId" id="newId" maxlength="30" required spellcheck="false"
										placeholder="6자리 이상의 영문 또는 영문+숫자" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9]/g,'');" pattern="^([A-Za-z0-9]).{5,30}$"> 
										<input type="hidden" name="checkDuplicatedId" required value=""/>
										<button type="button" id="checkid" class="checkInform">중복확인</button>
									</td>
								</tr>
								<tr id="idRuleRow">
									<th></th>
									<td colspan="2">
										<ul id="idRule">
											<li id="lengthId" class="invalid">6자리 이상 30자리 이하 영문 또는 영문+숫자</li>
											<li id="duplicateId" class="invalid">아이디 중복확인</li>
										</ul>
									</td>
								</tr>
								<tr id="pwPart">
									<th>비밀번호<span>*</span></th>
									<td>
										<!-- 비밀번호 : 8~30자 사이 영대소문, 숫자, 특문 꼭 포함 --> 
										<input type="password" name="newPw" id="newPw" maxlength="30" required autocomplete="off"
										spellcheck="false" placeholder="비밀번호를 입력해주세요" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9#?!@$ %^&*-]/g,'');"
										pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,30}$">
									</td>
								</tr>
								<tr id="pwRuleRow">
									<th></th>
									<td colspan="2">
										<ul id="pwRule">
											<li id="length" class="invalid">8자리 이상 30자리 이하</li>
											<li id="upper" class="invalid">영어 대문자 포함</li>
											<li id="number" class="invalid">숫자 포함</li>
											<li id="special" class="invalid">특수문자 포함</li>
										</ul>
									</td>
								</tr>
								<tr id="pwPart2">
									<!-- 위와 동일 비번입력 -->
									<th>비밀번호 확인<span>*</span></th>
									<td>
										<input type="password" name="newPwCheck" id="newPwCheck" maxlength="30" autocomplete="off" required spellcheck="false"
										placeholder="비밀번호를 한 번 더 입력해주세요" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9#?!@$ %^&*-]/g,'');"
										pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,30}$"> 
										<span id="wrong">비밀번호가 
										다릅니다!</span>
									</td>
								</tr>
								<tr>
									<!-- 한글만 입력 -->
									<th>이름<span>*</span></th>
									<td>
										<input type="text" name="newName" id="newName" maxlength="5" required spellcheck="false" placeholder="이름을 입력하세요"
										onKeyup="this.value=this.value.replace(/[^가-힣]/g,'');" pattern="^([가-힣]).{2,5}$">
									</td>
								</tr>
								<tr>
									<th>이메일<span>*</span></th>
									<td>
										<!-- 이메일 : 아이디 위와 상동, @ + 나머지 --> <input type="text" name="newEmail" id="newEmail" maxlength="50" required spellcheck="false"
										placeholder="ex : fav@xxxxx.com" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9@-_.]/g,'');"
										pattern="^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$"> 
										<button type="button" id="checkemail" class="checkInform">중복확인</button>
									</td>
								</tr>
								<tr id="emailRuleRow">
									<th></th>
									<td colspan="2">
										<ul id="emailRule">
											<li id="duplicateEmail" class="invalid">이메일 중복확인</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th>휴대폰<span>*</span></th>
									<td>
										<!-- 휴대폰 :  숫자만 입력 11자리까지 가능 --> 
										<input type="text" name="newPhone" id="newPhone" maxlength="11" required spellcheck="false"
										placeholder="- 없이 숫자만 입력하세요" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										pattern="^^(010|011|016|019|018|017)([0-9]{3,4})([0-9]{4})$"> 
										<button type="button" id="checkphone">인증번호 받기</button>
									</td>
								</tr>
								<tr>
									<!-- 한글만 입력 -->
									<th>식당이름<span>*</span></th>
									<td>
										<input type="text" name="restauName" id="restauName" maxlength="30" required spellcheck="false" placeholder="이름을 입력하세요"
										onKeyup="this.value=this.value.replace(/[^가-힣]/g,'');" pattern="^([가-힣]).{1,30}$">
									</td>
								</tr>
								<tr id="addressTr">
									<th>식당주소<span>*</span></th>
									<td>
										<div class="findAddress">
											<input type="text" id="postcode" placeholder="우편번호"> <input type="button"id="getaddress" onclick="execDaumPostcode()" value="주소 찾기">
											<br> 
											<input type="text" name="addr1"  id="address" placeholder="주소"><br> <input type="text" name="addr2" id="detailAddress" placeholder="상세주소">
										</div>
									</td>
								</tr>
								<tr>
									<th>이용약관동의<span>*</span></th>
									<td>
										<div class="all_agree">
											<input type="checkbox" name="allagrees" id="allagrees" value="all" onclick="checkedAll()"> 
											<label for="allagrees"> 
												<span class="label-text">전체 동의합니다</span>
											</label>
										</div>
										<div class="user-check1">
											<input type="checkbox" name="userChkbox" id="userChkbox1" value="Y" class="userChkbox" onclick="checkSelectAll()"> 
											<label for="userChkbox1">
												<span class="label-text">이용약관 동의</span>
											</label> 
											<button type="button">약관보기></button>
										</div>
										<div class="user-check2">
											<input type="checkbox" name="userChkbox" value="Y" id="userChkbox2" class="userChkbox" required onclick="checkSelectAll()"> 
											<label for="userChkbox2"> 
												<span class="label-text">개인정보 수집 • 이용 동의</span> 
												<span class="mandy">(필수)</span>
											</label> 
											<button type="button">약관보기></button>
										</div>
										<div class="user-check3">
											<input type="checkbox" name="userChkboxC" value="N" id="userChkbox3" class="userChkbox" onclick="checkSelectAll()"> 
											<label for="userChkbox3">
												<span class="label-text">개인정보 수집 • 이용 동의</span> 
												<span class="mandy">(선택)</span>
											</label> 
											<button type="button">약관보기></button>
										</div>
										<div class="user-check4">
											<input type="checkbox" name="userChkbox" value="Y" id="userChkbox4" class="userChkbox" required onclick="checkSelectAll()"> 
											<label for="userChkbox4">
												<span class="label-text">본인은 14세 이상입니다.</span> 
												<span class="mandy">(필수)</span> 
											</label>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<button type="submit" id="join">가입하기</button>
					</form>
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
		<div id="modalCont-id">
			<div class="modal">
				<div class="title">
					<h2>알림메세지</h2>
				</div>
				<p>아이디를 입력해주세요.</p>
				<button id="makeAccountBtn1">확인</button>
			</div>
		</div>

		<div id="modalCont-email">
			<div class="modal">
				<div class="title">
					<h2>알림메세지</h2>
				</div>
				<p>이메일을 입력해주세요.</p>
				<button id="makeAccountBtn2">확인</button>
			</div>
		</div>

		<div id="modalCont-phone">
			<div class="modal">
				<div class="title">
					<h2>알림메세지</h2>
				</div>
				<p>휴대폰 번호를 입력해주세요.</p>
				<button id="makeAccountBtn3">확인</button>
			</div>
		</div>
	</div>
	<div class="mobile-bar">
		<ul>
			<li>
				<input type="radio" name="mobile-btn" id="tohome" value="tohome">
				<label for="tohome"> 
					<a href="MoveHomeController">
						<i class="fas fa-home"></i><br> 
						<span>홈으로</span>
					</a>
				</label>
			</li>
			<li>
				<input type="radio" name="mobile-btn" id="look" value="look">
				<label for="look">
					<a href="MoveWelcomeController">
						<i class="fas fa-bars"></i><br> 
						<span>둘러보기</span>
				 	</a>
				 </label>
			</li>
			<li>
				<input type="radio" name="mobile-btn" id="login" value="login">
				<label for="login">
					<a href="MoveLoginController">
						<i class="fas fa-user"></i><br> 
						<span>마이페이지</span>
					</a>
				</label>
			</li>
		</ul>
	</div>
	<script src="js/d_makeAccount.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="js/z_script.js"></script>
</body>

</html>