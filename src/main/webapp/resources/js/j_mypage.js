/**
 * 
 */
/*메뉴 선택시 각 페이지 보여주기*/
function showMypage() {
	let navBtns = document.querySelectorAll(".mypage>nav>ul>.navBtn");
	for (var i = 0; i < navBtns.length; i++) {
		navBtns[i].addEventListener("click", function() {
			let mypages = document.querySelectorAll(".mypage>.mypageMain>div");
			for (let mypage of mypages) {
				mypage.style.display = "none";
			}
			mypages[(this.dataset.num) - 1].style.display = "block";
		});

	}
} showMypage();

//점주 페이지 이미지 확대
function makeLargeforImage() {
	let ownerImages = document.querySelectorAll(".ownerIamge");
	const ownerImageModal = document.getElementById("ownerImageModal");
	const ownerImageModalBox = document.querySelector(".ownerImageModalBox");

	if (ownerImages) {
		for (var i = 0; i < ownerImages.length; i++) {
			ownerImages[i].addEventListener("click", function() {
				let imgSrc = this.getAttribute("src");
				let imgAlt = this.getAttribute("alt");

				ownerImageModalBox.firstElementChild.setAttribute("src", imgSrc);
				ownerImageModalBox.firstElementChild.setAttribute("alt", imgAlt);
				ownerImageModal.style.display = "flex";
			});
		}
	}
	if (ownerImageModal) {
		ownerImageModal.addEventListener("click", function() {

			ownerImageModal.style.display = "none";
		});
	}
} makeLargeforImage();


//개인정보 수정 페이지 비밀번호 조건 만족 리스트
function pwRule() {
	const pwInput = document.querySelector("#newPw");
	const pwRuleRow = document.querySelector("#pwRuleRow");
	let length = document.querySelector("#length");
	let upper = document.querySelector("#upper");
	let number = document.querySelector("#number");
	let special = document.querySelector("#special");

	let upperCase = /[A-Z]/g;
	let numbers = /[0-9]/g;
	let specials = /[#?!@$ %^&*-]/g;

	if (pwInput) {
		init();
	}


	function init() {
		pwInput.addEventListener("focus", function() { showRule(); })
		pwInput.addEventListener("blur", function() { hideRule(); })
		pwInput.addEventListener("keyup", function() {
			forAll(upperCase, upper);
			forAll(numbers, number);
			forAll(specials, special);
			forLength(length);
		});

	}

	function showRule() {
		pwRuleRow.style.display = "table-row";
	}
	function hideRule() {
		pwRuleRow.style.display = "none";
	}

	function forAll(rule, ruleList) {
		if (pwInput.value.match(rule)) {
			ruleList.classList.remove("invalid");
			ruleList.classList.add("valid");
		}
		else {
			ruleList.classList.remove("valid");
			ruleList.classList.add("invalid");
		}
	}


	function forLength(ruleList) {
		if (pwInput.value.length >= 8 && pwInput.value.length <= 30) {
			ruleList.classList.remove("invalid");
			ruleList.classList.add("valid");
		}
		else {
			ruleList.classList.remove("valid");
			ruleList.classList.add("invalid");
		}
	}
} pwRule();

//개인정보 수정 페이지에서 조건 불만족시 모달창 또는 alert 띄우기
function modalAlert() {
	const reviseBtn = document.getElementById("revise");
	const curPw = document.getElementById("currentPw");
	const newPw = document.getElementById("newPw");
	const newPwCheck = document.getElementById("newPwCheck");

	const modalbox = document.getElementById("modalCont-idpw");
	const modalPw = document.getElementById("pw");
	const pwBtn = document.querySelector("#pwBtn");
	const modals = document.querySelectorAll(".modal");


	const invalidPw = document.querySelectorAll("#pwRule>.invalid");
	const invalidEmail = document.querySelector("#duplicateEmail");

	//전체 modal숨기기
	for (let modal of modals) {
		modal.style.display = "none";
	}

	if (reviseBtn) {
		validationChk(reviseBtn, curPw, newPw, newPwCheck, modalbox, modalPw, pwBtn, invalidPw, invalidEmail);
	}

	//유효성 검사
	function validationChk(btn1, input1, input2, input3, modalbox, modalPw, btn2) {
		btn1.addEventListener("click", function(e) {

			//조건 : 현재비번 or 새비번, 새비번확인 없을 때
			if (!(input1.value) || ((input2.value) && !(input3.value)) || (!(input2.value) && (input3.value))) {

				// submit방지
				e.preventDefault();
				showModal(modalbox, modalPw, btn2);
			}
			//pw 채웠을 때
			else {
				if (finishDuplication(input2, invalidPw, invalidEmail) == true) {
					// submit되살리기
					return true;
				}
				else {
					alert("비밀번호 조건 또는 새로운 이메일 중복확인 체크");
				}
			}
		});
	}

	//모달창 띄우기
	function showModal(modalbox, modalPw, btn2) {
		//모달등장
		modalbox.style.display = "flex";
		modalPw.style.display = "block";
		modalBtnActive(btn2, modalbox);
	}

	// 모달내 버튼 누르면 모달 닫기
	function modalBtnActive(btn, modalbox) {
		btn.addEventListener("click", function() {
			modalbox.style.display = "none";
		});
	}

	//중복확인 안하면 submit불가
	function finishDuplication(input2, invalidPw, invalidEmail) {
		if (input2.value && invalidPw) {
			alert("비밀번호 조건을 모두 만족해야합니다.");
			return false;
		}
		else if (invalidEmail.classList.contains("invalid")) {
			alert("새로운 이메일에 대한 중복확인이 필요합니다.")
			return false;
		}

		else {
			return true;
		}
	}
} modalAlert();

//개인정보수정 페이지 진입 전 비번체크 / 회원정보 수정 완료시 비번체크
//회원 탈퇴시 비번체크 / 탈퇴 가능여부 체크
function showAlert() {

	let alertInput = document.getElementById("alertMSG");
	if (alertInput && alertInput.value != "") {
		alert(alertInput.value);
	}


} showAlert();


//1:1문의 페이지 이동버튼
function moveQna() {
	const writeQna = document.querySelector("#writeQna");
	const writeQna1 = document.querySelector("#writeQna1");
	if (writeQna) {

		writeQna.addEventListener("click", function() {
			location.href = "toAsk";
		});
	}
	if ( writeQna1) {
		writeQna1.addEventListener("click", function() {
			location.href = "toAsk";
		});
	}
	
} moveQna();

//1:1문의 페이지 수정 / 삭제 버튼
function qnaBtns() {
	const modifyQnaBtns = document.querySelectorAll(".modifyQna");
	const deleteQnaBtns = document.querySelectorAll(".deleteQna");
	const rowNums = document.querySelectorAll(".rowNum");


	for (let i = 0; i < modifyQnaBtns.length; i++) {

		let rowNum = parseInt(rowNums[i].value);

		//수정
		modifyQnaBtns[i].addEventListener("click", function() {

			location.href = "toAskModify?rowNum=" + rowNum;
		});

		//삭제
		deleteQnaBtns[i].addEventListener("click", function() {

			location.href = "askDelete?rowNum=" + rowNum;
		});
	}

} qnaBtns();

//1:1문의 페이지 > 작성완료 or 취소
function qnaPage() {

	const backBoard3 = document.querySelector("#backBoard3");
	const qnaPost = document.querySelector("#qnaPost");
	const qnaWriter = document.querySelector("#qnaWriter");
	const qnaTitle = document.querySelector("#qnaTitle");
	const qnaContent = document.querySelector("#qnaContent");

	if (backBoard3) {
		backBoard3.addEventListener("click", function() {
			location.href = "/myPage";
		});
		qnaPost.addEventListener("click", function() {
			if (qnaTitle.value && qnaContent.value) {
				qnaWriter.submit();
			}
			else {
				alert("제목과 내용을 입력해주세요");
			}
		});
	}

} qnaPage();

// 게시판 보드 확장, 축소
function boardHeight() {
	if (document.querySelector("#myQna")) {
		$(function() {
			const $info = $("#myQna tbody a#info");
			const $tbody = $("#myQna tbody");
			// heightArray라는 배열 공간 만들기
			let heightArray = new Array();

			$tbody.each(function() {
				heightArray.push($(this).find("#description").height());
			});

			$info.click(function(e) {
				e.preventDefault();
				if ($(this).parents("tbody").hasClass("on")) {
					$(this).parents("tbody").removeClass("on");
				} else {
					$("#myQna tbody").removeClass("on");
					$(this).parents("tbody").addClass("on");
				}
			})

		});
	}
} boardHeight();
function boardHeight2() {
	if (document.querySelector("#myQna1")) {
		$(function() {
			const $info = $("#myQna1 tbody a#info1");
			const $tbody = $("#myQna1 tbody");
			// heightArray라는 배열 공간 만들기
			let heightArray = new Array();

			$tbody.each(function() {
				heightArray.push($(this).find("#description1").height());
			});

			$info.click(function(e) {
				e.preventDefault();
				if ($(this).parents("tbody").hasClass("on")) {
					$(this).parents("tbody").removeClass("on");
				} else {
					$("#myQna1 tbody").removeClass("on");
					$(this).parents("tbody").addClass("on");
				}
			})

		});
	}
} boardHeight2();