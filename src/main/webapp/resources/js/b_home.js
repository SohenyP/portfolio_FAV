
//  HOME 페이지 자바스크립트
// header notice 자동 슬라이더
function headerSlide() {
	const slides = document.querySelectorAll(".notice");
	const prev = document.getElementById("prev");
	const next = document.getElementById("next");
	const aside = document.querySelector(".container aside");
	let current = 0;

	function showSlide() {
		if (aside) {
			for (let i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
				aside.style.backgroundImage = "none";
			}
			current++;

			if (current > slides.length) {
				current = 1;
				aside.style.backgroundImage =
					"url('media/bg/asidebg" + current + ".png')";
			}
			let minus = current - 1;
			slides[minus].style.display = "block";
			aside.style.backgroundImage = "url('media/bg/asidebg" + minus + ".png')";
			setTimeout(showSlide, 4000);
		}
	}
	showSlide();
	// current--;

	// header notice 슬라이더 버튼
	function btnSlide(n) {
		for (let i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
			aside.style.backgroundImage = "none";
		}
		slides[n].style.display = "block";
		aside.style.backgroundImage = "url('media/bg/asidebg" + n + ".png')";
	}

	// 되감기하면 버벅임이 있음..
	function prevSlide() {
		if (current > 0) {
			current -= 1;
			btnSlide(current);
		} else {
			current = slides.length - 1;
			btnSlide(current);
		}
	}
	function nextSlide() {
		if (current < slides.length - 1) {
			current += 1;
			btnSlide(current);
		} else {
			current = 0;
			btnSlide(current);
		}
	}
	if (prev && next) {
		prev.addEventListener("click", function() {
			prevSlide();
		});
		next.addEventListener("click", function() {
			nextSlide();
		});
		btnSlide(current);
	}
}
headerSlide();

//지역별 식당찾기 가로스크롤>마우스 휠로도 가능하게
function horiScrollwithWheel() {
	const cityRestbox = document.querySelector(".articleWrap>article");
	if (cityRestbox) {
		cityRestbox.addEventListener("wheel", function(e) {
			e.preventDefault();
			cityRestbox.scrollBy({
				left: e.deltaY < 0 ? -50 : 50,
			});
		}/*, {passive:true}*/);
	}
} horiScrollwithWheel();

// 이달의 페이브 슬라이더
function thisMonthFaveSlide() {
	let article = document.querySelectorAll("#sec2 article");
	winH = window.innerHeight;
	event();

	function event() {
		window.addEventListener("scroll", checkPosition);
		window.addEventListener("load", checkPosition);
		window.addEventListener("resize", checkPosition);
	}

	function checkPosition() {
		for (let i = 0; i < article.length; i++) {
			let posFromTop = article[i].getBoundingClientRect().top;
			if (posFromTop - winH < -400) {
				article[i].classList.add("slide-in-bottom");
			}
		}
	}
}
thisMonthFaveSlide();

// 입점하기
function beMyHost() {
	const ipt = document.querySelector(".together>form>input");
	const together = document.querySelector(".together");

	function changebg(bg, color, shadow, value) {
		together.style.background = "url('media/bg/bemyhost" + bg + ".png')";
		ipt.style.color = color;
		ipt.style.textShadow = shadow;
		ipt.value = value;
	}
	if (ipt) {
		ipt.addEventListener("mouseover", function() {
			changebg("over", "#f0d061", "4px 3px 0px #7a7a7a", "페이버님 환영해요!");
		});

		ipt.addEventListener("mouseout", function() {
			changebg("", "#323232", "", "페이브와 함께하기");
		});
	}
}
beMyHost();

//축제
function festivalRandom() {
	const img1 = document.querySelector(".festival-img1 img");
	const img2 = document.querySelector(".festival-img2 img");
	let dome = document.querySelectorAll(".dome");
	let fore = document.querySelectorAll(".fore");

	if (img1 && img2) {
		// 난수 추출
		function numberRandom() {
			//Math.round(Math.random() * ((max-min+1)+min))
			let num = Math.round(Math.random() * 2 + 1);
			return num;
		}

		// 난수 번째 국외내에 축제 추출
		function changeBgNtext(img, country) {
			//난수 실행
			let num = numberRandom();

			//이미지 src 가져와서, 숫자를 난수로 변경시키기
			let src = img.getAttribute("src");
			let resrc = src.replace("1", num);
			img.setAttribute("src", resrc);

			// 축제 텍스트 전부 가렸다가, 난수-1번째 텍스트=보여주기
			for (let i = 0; i < country.length; i++) {
				country[i].style.display = "none";

				let num2 = num - 1;
				country[num2].style.display = "block";
			}
		}
		changeBgNtext(img1, dome);
		changeBgNtext(img2, fore);
	}
}
festivalRandom();










