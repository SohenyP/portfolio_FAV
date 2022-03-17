/**
 * 
 */
//예약페이지 자바스크립트

//주소에서 받은 값 사용하기
/*const link = location.search;
let params = new URLSearchParams(link);
let n = params.get("n");
console.log(n);
*/

//이미지 슬라이드쇼
function slidesRestaurent() {

	let btnR = document.getElementById("right");
	let btnL = document.getElementById("left");
	let img = document.querySelectorAll("#imagebox>img");
	let num = 0;

	if (btnR) {
		showSlides(num);
		btnR.onclick = rightSlide;
		btnL.onclick = leftSlide;

		function showSlides(n) {
			for (let i = 0; i < img.length; i++) {
				img[i].style.display = "none";
			}
			img[n].style.display = "block";
		}

		function rightSlide() {
			if (num < img.length - 1) {
				num += 1;
				showSlides(num);
			}
			else {
				num = 0;
				showSlides(num);
			}

			// 위의 ifelse문을 showSlides반복 없이 하려면 showSlides 맨 마지막에 한개 쓰고, 중괄호 다 지우기

		};
		function leftSlide() {
			if (num > 0) {
				num -= 1;
				showSlides(num);
			}
			else {
				num = img.length - 1;
				showSlides(num);
			}
		};
	}
}
slidesRestaurent();

// 예약하기 날짜/시간 부분 기본값 설정
function setDateTime() {
	const reserveDate = document.querySelector("#reservationDate");
	const reserveTime = document.querySelector("#reservationTime");
	let today = new Date();
	//toISOString은 UTC기준 출력
	//현지시간 = 로컬 시간 - 기준시간 을 밀리초단위로 받기위해 1000초 * 60초
	//let now = new Date(new Date().getTime() - new Date().getTimezoneOffset() * (1000 * 60)).toISOString().slice(0, 16);
	let now = today.toISOString().slice(0, 10);
	let tommorrow = new Date(today.setDate(today.getDate()+1)).toISOString().slice(0, 10);
	let nowMax = new Date(today.setDate(today.getDate()+12)).toISOString().slice(0, 10);
	let tmrMax = new Date(today.setDate(today.getDate()+13)).toISOString().slice(0, 10);
	
	let hour = today.getHours();
	let min = today.getMinutes();
	let nowTime = hour + min;
	
	
	
	//날짜 및 시간 설정
	if (reserveDate) {
		
		if(hour >= 7 && hour < 18) {
			console.log("당일예약가능");
			setTime();
			setDate(now, nowMax);
			blockTime(hour);
		}
		else {
			console.log("당일예약불가");
			setDate(tommorrow, tmrMax);
			//다음날 부터 예약 가능할 때는 아침 7부터 예약 가능
			if(hour < 8) {
				blockTime(hour);
			}
		}
		
	}
	
	//예약 가능 날짜 범위 설정
	function setDate(minDate, maxDate) {
		reserveDate.value = minDate;
		reserveDate.setAttribute("min", minDate);
		reserveDate.setAttribute("max", maxDate);
	}
	
	//예약 가능 초기 시간 설정
	function setTime() {
		reserveTime.value = hour+3;
	}
	
	//현재 이전 시간 예약 불가
	function blockTime(standard) {
		reserveTime.addEventListener("change", function(){
			console.log(reserveTime.value);
			if(reserveTime.value < standard+3) {
				alert("현재 시간으로부터 3시간 이후만 예약 가능합니다.")
				reserveTime.value = standard+3;
			}
		});
	}
	
}setDateTime();

//쿠폰으로 예약금 조절 및 쿠폰 이름 따오기
function checkTotal() {
	let charge = document.getElementById("charge");
	const selectedCP = document.getElementById("selectedCP");
	const couponName = document.getElementById("couponName");
	
	if (charge && selectedCP) {
		//option.innerText 가져오기
		const text = selectedCP.options[selectedCP.selectedIndex].text;
		
		charge.value = 20000;
		
		if (selectedCP.value) {
			//최대 할인 금액 초과시 max 적용
			let condition = selectedCP.value.split("-");
			let percent = condition[0];
			let max = condition[1];
			
			if((charge.value * percent) >= max) {
				charge.value -= max;
			}
			else if((charge.value * percent) < max) {
				charge.value -= (charge.value * percent);
			}
			couponName.value = text;

		}
		else if (selectedCP.value == 0 || selectedCP.value == "") {
			charge.value = 20000;
		}
	}

} checkTotal();



//result페이지에서 버튼 따라 action 설정
function actionChange() {
	const btnMypage = document.getElementById("myPage");

	btnMypage.addEventListener("click", function() {
		location.href = "myPage";
	});
	
} actionChange();