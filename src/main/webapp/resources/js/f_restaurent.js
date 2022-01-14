/**
 * 
 */

// 필터 모달
function filterModal() {
	const modal = document.getElementById("modalCont-sort");
	const filter = document.querySelector(".sort>img");

	filter.addEventListener("click", function() {
		modal.style.display = "flex";
		modalBtnActive();
	});

	function modalBtnActive() {
		document.getElementById("restaurentModalBtn").addEventListener("click", function(e) {
			e.preventDefault();
			modal.style.display = "none";
		});
	}
}
filterModal();

//식당 사진 슬라이드
function restaurentSlider() {
	//전체 slideshowContainer 갯수 가져오기
	const slideshowContainer = document.querySelectorAll(".slideshow-container");
	// slideshowContainer 갯수만큼 슬라이드 개별 설정
	for (let i = 0; i < slideshowContainer.length; i++) {

		const slider = function() {
			//초기화 리스트 (버튼2, 이미지, 버튼박스, 인덱스 초기넘버)
			let btnR = slideshowContainer[i].querySelector(".restaurentNextBtn");
			let btnL = slideshowContainer[i].querySelector(".restaurentPrevBtn");
			let img = slideshowContainer[i].querySelectorAll(".mySlides");
			let dotbox = slideshowContainer[i].querySelector(".dotbox");
			let num = 0;

			//이미지 갯수만큼 dot 생성하기
			createDots();

			//슬라이드 초기 설정
			showSlides(num);
			//오른버튼 오른슬라이드/왼버튼 왼슬라이드
			btnR.addEventListener("click", rightSlide);
			btnL.addEventListener("click", leftSlide);

			//dot클릭시 슬라이드 이동
			clickDots();

			function createDots() {
				for (let i = 0; i < img.length; i++) {
					let tagForDot = document.createElement("span");
					tagForDot.classList.add("dot");
					tagForDot.setAttribute("data-num", i);
					dotbox.append(tagForDot);
				}
			}

			function showSlides(n) {
				let dots = slideshowContainer[i].querySelectorAll(".dot");
				for (let i = 0; i < img.length; i++) {
					img[i].style.display = "none";
					dots[i].classList.remove("active");
				}
				img[n].style.display = "block";
				dots[n].classList.add("active");
			}

			function rightSlide() {
				if (num < img.length - 1) { num += 1; showSlides(num); }
				else { num = 0; showSlides(num); }
			};
			function leftSlide() {
				if (num > 0) { num -= 1; showSlides(num); }
				else { num = img.length - 1; showSlides(num); }
			};

			function clickDots() {
				let dots = slideshowContainer[i].querySelectorAll(".dot");
				for (let i = 0; i < dots.length; i++) {
					dots[i].addEventListener("click", function() {
						showSlides(dots[i].dataset.num);
					});

				}
			}
		}
		slider();
	}
} restaurentSlider();




