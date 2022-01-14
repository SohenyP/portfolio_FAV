
// WELCOME 페이지 자바스크립트
function welcomeNavBtn() {
	let btns = document.querySelectorAll("#containerWelcome header aside ul li a");
	const parts = document.querySelectorAll(".part");

	// aside버튼 효과
	for (let i = 0; i < btns.length; i++) {
		//버튼 누를시 해당 페이지로 이동
		btns[i].addEventListener("click", function(e) {
			e.preventDefault();
			parts[i].scrollIntoView({ behavior: "smooth" });
		});
		for (let i = 0; i < parts.length; i++) {
			if (parts[i].scrollIntoView) {
				btns[i].style.opacity = 1;
			}
		}
	}
}

function welcomeFinalAnimate() {
	// 마지막 final div 스크롤 접근시 글자 setTimeout으로 설정
	window.onscroll = function() {
		scrollPercent();
	};

	function scrollPercent() {
		//스크롤 퍼센티지 구하기
		let winScroll = document.scrollTop || document.documentElement.scrollTop;
		let height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
		let scrolled = (winScroll / height) * 100;
		finalTextEvent(scrolled);
	}

	function finalTextEvent(scrolled) {
		// console.log(scrolled);

		const text1 = document.querySelector("#part9 .inner #beforeHome").firstElementChild;
		const text2 = text1.nextElementSibling;
		const text3 = document.querySelector("#part9 .inner #beforeHome").lastElementChild;

		if (scrolled >= 100) {
			setTimeout(function() {
				text1.classList.add("fade-in-bottom");
				text1.style.display = "block";
				setTimeout(function() {
					//  clear, remove해도 얘는 계속 추가하려고함 ERROR
					text2.classList.add("fade-in-bottom");
					text2.style.display = "block";
					text1.remove();
					setTimeout(function() {
						text3.classList.add("fade-in-bottom");
						text3.style.display = "block";
						text2.remove();
					}, 2000);
				}, 2000);
			});
		}
	}
}
welcomeNavBtn();
welcomeFinalAnimate();

function movePart() {
	getPart()

	function getPart() {
		let specificPart = document.querySelector("#specificPart").value;
		move(specificPart)
	}

	function move(specificPart) {
		if (specificPart) {
			console.log(specificPart);
			let part = document.getElementById(`${specificPart}`);
			console.dir(part);
			part.scrollIntoView({ behavior: "smooth" });
		}
	}



} movePart();