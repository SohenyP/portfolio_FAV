<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div class="containerForRestaurent">
		<header>
			<div class="navNsearch">
				<div class="totalmenu">
					<a href="home" id="restauHomeLogo"> <img src="media/logo/home-top-logo.png" alt="" style="width: 40px; height: 40px;">
					</a>
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
									<input type="text" name="" id="restaurentIpt" placeholder="검색어를 입력하세요">
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
									<li><a href="logout?path=restaurent">로그아웃</a></li>
								</ul>
						</i></li>
					</ul>
				</div>
			</div>
		</header>
		<section>
			<div class="restauCont">
				<div class="restauList">
					<div class="restauListTitle">
						<h1>식당 찾아보기</h1>
						<div class="sort">
							<img src="media/filter.png" alt="">
						</div>
					</div>
					<span id="underLine"></span>
					<c:forEach var="restauList" items="${restaurentList}">
						<article class="${restauList.restauCity}">
							<div class="slideshow-container">
								<img src="media/f_restaurent/${restauList.restauImg1}.jpg" alt="" class="mySlides fade"> 
								<img src="media/f_restaurent/${restauList.restauImg2}.jpg" alt="" class="mySlides fade"> 
								<img src="media/f_restaurent/${restauList.restauImg3}.jpg" alt="" class="mySlides fade"> 
								
								<a class="restaurentPrevBtn">&#10094;</a> 
								<a class="restaurentNextBtn">&#10095;</a>
								<div class="dotbox"></div>
							</div>
							<div class="restauInform">
								<form action="reservation" method="post">
									<h1>
										<a href="#">${restauList.restauName}</a><span id="star">${restauList.restauStyle}</span>
									</h1>
									<p>
										<a href="#">${restauList.restauAddr}</a>
									</p>
									<p>${restauList.restauMenu}</p>
									<input type="hidden" name="restauName" value="${restauList.restauName}" />
									<input type="hidden" name="restauAddr" value="${restauList.restauAddr}"/>
									<input type="hidden" name="restauImg1" value="${restauList.restauImg1}" />
									<input type="hidden" name="restauImg2" value="${restauList.restauImg2}" />
									<input type="hidden" name="restauImg3" value="${restauList.restauImg3}"  />
									<button type="submit">예약하기</button>
								</form>
							</div>
						</article>
					</c:forEach>
				</div>
				
					
				<div class="restauMap">
					<script type="text/javascript">
					//지도 및 마커 
					function initMap() {

						//마커 리스트
						const locations = [
								<c:forEach var='restauList' items='${restaurentList}'>
					     		['${restauList.restauName}', '${restauList.restauAddr}', ${restauList.restauLat}, ${restauList.restauLng}, '${restauList.restauCity}'],
								</c:forEach>
					     		]
						//지도 센터점 
						const center = { lat: 36.1208979, lng: 127.2578289 }

						// 지도 줌, 센터 설정
						const map = new google.maps.Map(document.querySelector(".restauMap"), {
							zoom: 8,
							center: center,
						});

						//구글 지도 마커 내장함수 가져오기
						const infoWindow = new google.maps.InfoWindow();


						//지도 마커 아이콘 변경
						const icon = 'media/logo/mapIcon.png';

						//locations 배열 수만큼 마커 생성하기

						for (let i = 0; i < locations.length; i++) {
							//마커 설정
							const marker = new google.maps.Marker({
								position: new google.maps.LatLng(locations[i][2], locations[i][3]),
								map: map,
								icon: icon,
							});

							//마커 클릭, 마우스오버 인폼창 띄우기
							google.maps.event.addListener(marker, "click", (function(marker, i) {
								return function() {
									makeRestaurentInform();
									focusRestaurent(marker);
								};
							})(marker, i));
							google.maps.event.addListener(marker, "mouseover", (function(marker, i) {
								return function() {
									makeRestaurentInform();
									map.panTo(marker.getPosition());
								};
							})(marker, i));

							//마커 인폼창 만들고 띄우기 function
							function makeRestaurentInform() {
								const restaurentNameAddr = locations[i][0] + "<br><p style='font-size:12px'>" + locations[i][1] + "</p>";
								infoWindow.setContent(restaurentNameAddr);
								infoWindow.open(map, marker);
							}

							//마커 위치로 포커스 function
							function focusRestaurent(marker) {
								map.setCenter(marker.getPosition());
								map.setZoom(15);
							}

							//1. restauList 식당 제목 클릭시 같은 이름의 마커 인덱스 찾아내기 function
							function findMatchMarkerIndex() {
								let titles = document.querySelectorAll(".restauInform>form>h1>a");
								for (const title of titles) {
									title.addEventListener("click", function() {
										if (title) {
											const resultIndex = locations.findIndex(lo => lo[0] == this.textContent);
											makeRestaurentInform1(resultIndex);
										}
									});
								}
							} findMatchMarkerIndex();

							//2. locations[ resultIndex]의 좌표로 이동 But, 인폼창 띄우면 새로 만든 것이라 마우스 이벤트 안먹혀서 지움
							function makeRestaurentInform1(resultIndex) {
								var moveLatLon = new google.maps.LatLng(locations[resultIndex][2], locations[resultIndex][3]);
								map.setCenter(moveLatLon);
								map.setZoom(20);
							}
						}

						// 필터로 restauList display 제어
						const locationsName = [
							{
								name: "서울",
								lat: 37.5369508,
								lng: 126.9697313,
								zoom: 12,
							},
							{
								name: "경기",
								lat: 37.3548374,
								lng: 127.0897562,
								zoom: 10.67,
							},
							{
								name: "부산",
								lat: 35.1463734,
								lng: 129.0480317,
								zoom: 12,
							},
							{
								name: "대전",
								lat: 36.3556901,
								lng: 127.3690238,
								zoom: 13,
							},
							{
								name: "제주",
								lat: 33.39686,
								lng: 126.5187331,
								zoom: 11,
							},
							{
								name: "전주",
								lat: 35.8295315,
								lng: 127.1153474,
								zoom: 13,
							},
							{
								name: "여수",
								lat: 34.7525655,
								lng: 127.6568306,
								zoom: 13,
							},
							{
								name: "포항",
								lat: 36.1006352,
								lng: 129.3321152,
								zoom: 12,
							},
							{
								name: "청주",
								lat: 36.6283907,
								lng: 127.4815395,
								zoom: 13,
							},
							{
								name: "강원",
								lat: 37.8580185,
								lng: 128.7192713,
								zoom: 9.5,
							},
						];
						const filterBtns = document.querySelectorAll(".cityName");
						const restauListTitle = document.querySelector(".restauListTitle>h1");
						const articles = document.querySelectorAll("article");

						//필터 지역명 버튼마다 이벤트 부여
						for (let i = 0; i < filterBtns.length; i++) {
							filterBtns[i].addEventListener("click", (function(i) {
								return function() {
									filter();
								}
							})(i));
							//home화면에서 타고 들어올때 리스트, 지도 리스트업
							/* const link = location.search;
							let params = new URLSearchParams(link);
							let n = params.get("n"); */
							let n = `${n}`;
							console.log(n);

							function filter() {
								//지역명 버튼의 지역명과 같은 name을 가진 배열 인덱스 넘버 찾기
								const findCity = locationsName.findIndex((location) => location.name == filterBtns[i].innerText);
								//찾은 배열 인덱스 번째의 lat, lng 받기
								const center = { lat: locationsName[findCity].lat, lng: locationsName[findCity].lng };
								//찾은 배열 인덱스 번째의 zoom 받기
								const zooms = locationsName[findCity].zoom;
								//받은 lat, lng, zoom 설정
								map.setCenter(center);
								map.setZoom(zooms);
								//식당 찾아보기 > 선택된 지역명으로 변경
								restauListTitle.innerHTML = locationsName[findCity].name;
								restauListTitle.style.height = "68px";
								restauListTitle.style.paddingTop = "10px";

								//선택된 지역 가게 리스트만 display: flex
								for (let k = 0; k < articles.length; k++) {
									articles[k].style.display = "none";
									if (articles[k].classList.contains(locationsName[findCity].name)) {
										articles[k].style.display = "flex";
									}
								}
								if (n) {
									history.replaceState({}, null, location.pathname);
								}
							}


							function filter1(n) {
								//지역명 버튼의 지역명과 같은 name을 가진 배열 인덱스 넘버 찾기
								const findCity = locationsName.findIndex((location) => location.name == n);
								//찾은 배열 인덱스 번째의 lat, lng 받기
								const center = { lat: locationsName[findCity].lat, lng: locationsName[findCity].lng };
								//찾은 배열 인덱스 번째의 zoom 받기
								const zooms = locationsName[findCity].zoom;
								//받은 lat, lng, zoom 설정
								map.setCenter(center);
								map.setZoom(zooms);
								//식당 찾아보기 > 선택된 지역명으로 변경
								restauListTitle.innerHTML = locationsName[findCity].name;
								restauListTitle.style.height = "68px";
								restauListTitle.style.paddingTop = "10px";

								//선택된 지역 가게 리스트만 display: flex
								for (let k = 0; k < articles.length; k++) {
									articles[k].style.display = "none";
									if (articles[k].classList.contains(locationsName[findCity].name)) {
										articles[k].style.display = "flex";
									}
								}
							}

							if (n) {
								window.onload = filter1(n);
							}

						}

					}
					</script>
					<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNl46fe_bOeb0vYjcI898g1kOjopbml9k&callback=initMap&libraries=&v=weekly" async></script>
				</div>
			</div>
		</section>
		<div id="modalCont-sort">
			<div class="modal">
				<div class="title">
					<h1>어디로 떠나볼까요?</h1>
				</div>
				<div class="city">
						<p>도시</p>
						<div class="city-choice">
							<input type="radio" name="city" id="city1" value="city1"> 
							<label for="style1" class="cityName">서울</label> 
							<input type="radio" name="city" id="city2" value="city2"> 
							<label for="style2" class="cityName">경기</label> 
							<input type="radio" name="city" id="city3" value="city3"> 
							<label for="style3" class="cityName">청주</label> 
							<input type="radio" name="city" id="city4" value="city4"> 
							<label for="style4" class="cityName">대전</label> 
							<input type="radio" name="city" id="city5" value="city5"> 
							<label for="style5" class="cityName">강원</label> 
							<input type="radio" name="city" id="city6" value="city6"> 
							<label for="style6" class="cityName">전주</label>
							<input type="radio" name="city" id="city7" value="city7"> 
							<label for="style7" class="cityName">제주</label> 
							<input type="radio" name="city" id="city8" value="city8"> 
							<label for="style8" class="cityName">포항</label> 
							<input type="radio" name="city" id="city9" value="city9"> 
							<label for="style9" class="cityName">부산</label> 
							<input type="radio" name="city" id="city10" value="city10"> 
							<label for="style10" class="cityName">여수</label>
						</div>
				</div>
				<button id="restaurentModalBtn">확인</button>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>

	<script type="text/javascript" src="js/f_restaurent.js"></script>
	<script type="text/javascript" src="js/z_script.js"></script>

</body>
</html>