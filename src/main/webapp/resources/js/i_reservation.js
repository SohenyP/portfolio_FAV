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
function setDate() {
	const reserveDate = document.querySelector("#reservationDate");
	//toISOString은 UTC기준 출력
	//현지시간 = 로컬 시간 - 기준시간 을 밀리초단위로 받기위해 1000초 * 60초
	let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * (1000 * 60)).toISOString().slice(0, 16);
	if (reserveDate) {
		reserveDate.value = date;
		reserveDate.setAttribute("min", date);
	}
} setDate();

//쿠폰으로 예약금 조절 및 쿠폰 이름 따오기
function checkTotal() {
	let amount = document.getElementById("charge");
	const selectedCP = document.getElementById("selectedCP");
	const couponName = document.getElementById("couponName");
	
	if (amount && selectedCP) {
		const text = selectedCP.options[selectedCP.selectedIndex].text;
		amount.value = 20000;
		if (selectedCP.value > 0) {
			amount.value = 20000 - (amount.value * selectedCP.value);
			couponName.value = text;

		}
		else if (selectedCP.value == 0) {
			amount.value = 20000;
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