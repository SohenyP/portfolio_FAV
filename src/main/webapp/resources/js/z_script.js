
// 검색하기 input 확장, 축소
function inputSize() {
	const icon = document.querySelector("#user-search .icon");
	const clear = document.querySelector(".clear");
	const search = document.getElementById("user-search");
	const input = document.querySelector("#homeIpt");
	if (icon) {
		icon.addEventListener("click", function() {
			search.classList.add("wide");
		});
	}
	if (clear) {
		clear.addEventListener("click", function() {
			search.classList.remove("wide");
			input.value = "";
		});
	}
}
inputSize();



//상단 메뉴 특정위치에서 로고는 안보이게
// 버전1 : aside기준이라 home에서만 적용됨
function fixedMenu() {
	const aside = document.querySelector("aside");
	const headerImg = document.querySelector("header>a");

	winH = window.innerHeight;
	event();

	function event() {
		window.addEventListener("scroll", checkPosition);
		window.addEventListener("load", checkPosition);
		window.addEventListener("resize", checkPosition);
	}

	function checkPosition() {
		let posFromTop = aside.getBoundingClientRect().top;
		// console.log(posFromTop - winH);
		if (posFromTop - winH < -1100) {
			headerImg.style.height = "0";
			headerImg.style.margin = "0";
			headerImg.style.padding = "0";
			headerImg.firstElementChild.style.display = "none";
		} else {
			headerImg.style.height = "100px";
			headerImg.style.marginBottom = "4rem";
			headerImg.firstElementChild.style.display = "flex";
		}
	}
}// fixedMenu(); //실행안함

//버전2: 스크롤 기준이라 전체 적용됨
function fixedMenu2() {
	window.onscroll = function() {
		scrollPercent();
	};

	function scrollPercent() {
		//스크롤 퍼센티지 구하기
		let winScroll = document.scrollTop || document.documentElement.scrollTop;
		let height =
			document.documentElement.scrollHeight -
			document.documentElement.clientHeight;
		let scrolled = (winScroll / height) * 100;
		finalTextEvent(scrolled);
	}

	function finalTextEvent(scrolled) {
		const headerImg = document.querySelector("header>#headerImg");
		// console.log(scrolled);
		if (headerImg) {
			if (scrolled >= 2.9) {
				headerImg.style.height = "0";
				headerImg.style.margin = "0";
				headerImg.style.padding = "0";
				headerImg.firstElementChild.style.display = "none";
			} else {
				headerImg.style.height = "100px";
				headerImg.style.marginBottom = "4rem";
				headerImg.firstElementChild.style.display = "flex";
			}
		}
	}
}
fixedMenu2();




//로그인 전후로 유저 아이콘 내용 변경하기
function userMenu() {
	let userIcon = document.querySelector("#userIcon");
	let userMenus = document.querySelectorAll(".userMenu");
	let beforeMenu = document.querySelector("#beforeLogin");
	let afterMenu = document.querySelector("#afterLogin");
	let memId = document.querySelector("#memId");

	for (const userMenu of userMenus) {
		userMenu.style.display = "none";
	}
	userIcon.addEventListener("mouseover", function() {

		if (memId.value) {
			afterMenu.style.display = "block";
		}
		else if (!memId.value) {
			beforeMenu.style.display = "block";
		}

	});

	userIcon.addEventListener("mouseout", function() {
		if (memId.value) {
			afterMenu.style.display = "none";
		}
		else if (!memId.value) {
			beforeMenu.style.display = "none";
		}
	});


} userMenu();


//로그아웃 후 이동 path 설정
function setPath() {
	const logout = document.querySelector("#logout");
	let path = location.pathname;
	let goTo = path.split('/')[2];
	let search = location.search;

	if (goTo == "myPage") {
		logout.href = "logout?path=home";
	}
	else if (search != "") {
		let num = search.split('=')[1];
		logout.href = "logout?path=coupon&rowNum=" + num;	
	}
	else {
		logout.href = "logout?path=" + goTo;	
	}
	

} setPath();



