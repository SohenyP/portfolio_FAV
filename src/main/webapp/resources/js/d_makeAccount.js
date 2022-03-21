/**
 * 
 */

// 아이디, 이메일 공란시 입력 요청 및 중복확인
function duplicatedChk() {
	let id = document.getElementById("newId");
	const checkid = document.getElementById("checkid");
	const modalContid = document.getElementById("modalCont-id");
	const modalBtn1 = document.getElementById("makeAccountBtn1");

	let mail = document.getElementById("newEmail");
	const checkmail = document.getElementById("checkemail");
	const modalContemail = document.getElementById("modalCont-email");
	const modalBtn2 = document.getElementById("makeAccountBtn2");

	function checkElem(btns, elems, modal1, popup) {
		if (btns) {
			btns.addEventListener("click", function() {
				if (!elems.value) {
					modal1.style.display = "flex";
					modalBtnActive(modalBtn1);
					modalBtnActive(modalBtn2);
				} else if (elems.value) {
					window.open(
						popup,
						"_blank",
						"top=200, left=200, width=380, height=500"
					);

				}
			});
		}
	}
	checkElem(checkid, id, modalContid, "duplicatedId");
	checkElem(checkmail, mail, modalContemail, "duplicatedEmail");

	//모달 닫기
	function modalBtnActive(modalBtns) {
		modalBtns.addEventListener("click", function(e) {
			e.preventDefault();
			this.parentElement.parentElement.style.display = "none";
		});
	}
}
duplicatedChk();





//휴대폰 인증번호 : 페이크
function selfAuthentication() {
	const phone = document.getElementById("newPhone");
	const checkphone = document.getElementById("checkphone");
	const modalContephone = document.getElementById("modalCont-phone");
	const modalBtn3 = document.getElementById("makeAccountBtn3");

	function checkElem(btns, elems, modal) {
		btns.addEventListener("click", function() {
			if (!elems.value) {
				modal.style.display = "flex";
				modalBtnActive(modalBtn3);
			} else {
				window.open(
					"d_makeAccountSelfAuthentication.jsp",
					"_blank",
					"top=200, left=200, width=380, height=500"
				);
			}
		});
	}
	checkElem(checkphone, phone, modalContephone);

	function modalBtnActive(modalBtns) {
		modalBtns.addEventListener("click", function(e) {
			e.preventDefault();
			this.parentElement.parentElement.style.display = "none";
		});
	}
}
selfAuthentication();




//아이디, 비밀번호 조건 만족 리스트
function pwRule() {
	const idInput = document.querySelector("#newId");
	const pwInput = document.querySelector("#newPw");
	const emailInput = document.querySelector("#newEmail");
	const currentPwInput = document.querySelector("#currentPw");

	const idRuleRow = document.querySelector("#idRuleRow");
	const pwRuleRow = document.querySelector("#pwRuleRow");
	const emailRuleRow = document.querySelector("#emailRuleRow");

	let lengthId = document.querySelector("#lengthId");
	let duplicateId = document.querySelector("#duplicateId");

	let lengthPw = document.querySelector("#length");
	let upper = document.querySelector("#upper");
	let number = document.querySelector("#number");
	let special = document.querySelector("#special");
	let current = document.querySelector("#current");

	let duplicateEmail = document.querySelector("#duplicateEmail");

	let upperCase = /[A-Z]/g;
	let numbers = /[0-9]/g;
	let specials = /[#?!@$ %^&*-]/g;

	const checkIdBtn = document.getElementById("checkid");
	const checkEmailBtn = document.getElementById("checkemail");

	forPw();
	forId();
	forEmail();
	changePw(currentPwInput, pwInput, current);

	//pw만 해당되는 부분
	function forPw() {
		init(idInput, idRuleRow);
		pwInput.addEventListener("keyup", function() {
			forAll(pwInput, upperCase, upper);
			forAll(pwInput, numbers, number);
			forAll(pwInput, specials, special);
			forLength(pwInput, 8, lengthPw);
		});
	}
	//id만 해당되는 부분
	function forId() {
		init(pwInput, pwRuleRow);
		idInput.addEventListener("keyup", function() {
			forLength(idInput, 6, lengthId);
			reloadDuplicate(duplicateId);
			ableBtn(checkIdBtn);
		});
	}

	//email만 해당되는 부분
	function forEmail() {
		init(emailInput, emailRuleRow);
		emailInput.addEventListener("keyup", function() {
			reloadDuplicate(duplicateEmail);
			ableBtn(checkEmailBtn);
		});
	}

	//input 포커스시 룰 보이게
	function init(ipt, ruleRow) {
		ipt.addEventListener("focus", function() { showRule(ruleRow); })
		ipt.addEventListener("blur", function() { hideRule(ruleRow); })
	}
	function showRule(ruleRow) {
		ruleRow.style.display = "table-row";
	}
	function hideRule(ruleRow) {
		ruleRow.style.display = "none";
	}

	//주어진 조건 만족시 invalid>valid : pw에서만 사용함
	function forAll(ipt, rule, ruleList) {
		if (ipt.value.match(rule)) {
			ruleList.classList.remove("invalid");
			ruleList.classList.add("valid");
		}
		else {
			ruleList.classList.remove("valid");
			ruleList.classList.add("invalid");
		}
	}

	//input value 길이따라 invalud>valid
	function forLength(ipt, num, ruleList) {
		if (ipt.value.length >= num && ipt.value.length <= 30) {
			ruleList.classList.remove("invalid");
			ruleList.classList.add("valid");
		}
		else {
			ruleList.classList.remove("valid");
			ruleList.classList.add("invalid");
		}
	}

	//중복 확인 valid>invalid
	function reloadDuplicate(rule) {
		rule.classList.remove("valid");
		rule.classList.add("invalid");
	}

	//버튼 비활성화 해제
	function ableBtn(btn) {
		btn.removeAttribute("disabled");
	}


	//회원정보 수정시 구비번 일치 여부 체크 : 일치하면 안됨!
	function changePw(currentPw, newPw, rule) {

		newPw.addEventListener("keyup", function() {
			if (currentPw.value != newPw.value && currentPw.value != "") {
				console.log(currentPw.value);
				console.log(newPw.value);
				rule.classList.remove("invalid");
				rule.classList.add("valid");
			}
			else {
				rule.classList.remove("valid");
				rule.classList.add("invalid");
			}
		});

	}

} pwRule();

//비밀번호 확인 다를때 경고문구 띄우기
function checkPW() {
	//회원가입용
	let newPw = document.getElementById("newPw"); 
	let newPwCheck = document.getElementById("newPwCheck"); 
	const msgWrong = document.getElementById("wrong"); 
	
	//회원정보 수정용
	let currentPw = document.getElementById("currentPw");
	let memberPw = document.getElementById("memberPw");
	const msgIncorrect = document.getElementById("incorrect");
	
	//회원가입 비번, 비번확인 체크
	compareValue(newPw, newPwCheck, msgWrong);
	//회원정보수정 비번, 오리지날비번 체크
	compareValue(memberPw, currentPw, msgIncorrect);

	function compareValue(origin, checknum, message) {
		checknum.addEventListener("keyup", function() {
			if (checknum.value != origin.value) {
				message.style.display = "inline";
			} else if ((checknum.value = origin.value)) {
				message.style.display = "none";
			}
			//오리지날 비번 지워졌을때 wrong문구 지우기 추가 필요
			if (checknum.value == "") {
				message.style.display = "none";
			}
		});
	}

}
checkPW();

//전체동의 클릭 > 전체체크
function checkedAll() {
	var userchkboxs = document.getElementsByClassName("userChkbox");
	var allagreebtns = document.querySelector("#allagrees");
	const userChkboxC = document.querySelector('input[name="userChkboxC"]');

	if (allagreebtns) {
		if (allagreebtns.checked == true) {
			console.log("allagreebnts.checked");
			for (let btns of userchkboxs) {
				btns.checked = true;
				userChkboxC.value = "Y";
			}
		}
		else {
			console.log("allagreebnts.unchecked");
			for (let btns of userchkboxs) {
				btns.checked = false;
				userChkboxC.value = "N";
			}
		}

	}
} checkedAll();


//체크 하나라도 해지시 전체동의 해제
function checkSelectAll() {
	const checkboxes = document.querySelectorAll('input.userChkbox');
	const checkedPart = document.querySelectorAll('input.userChkbox:checked');
	const selectAll = document.querySelector('#allagrees');

	if (checkboxes && selectAll) {
		if (checkboxes.length === checkedPart.length) {
			selectAll.checked = true;
		} else {
			selectAll.checked = false;
		}
	}

} checkSelectAll();


//선택동의 VALUE바꾸기
function changeValue() {
	const userChkboxC = document.querySelector('input[name="userChkboxC"]');
	if (userChkboxC) {
		userChkboxC.addEventListener("click", function() {
			if (userChkboxC.checked == true) {
				userChkboxC.value = "Y";
			}
			else {
				userChkboxC.value = "N";
			}
		});
	}

} changeValue();



// 우편번호 넣기!
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ""; // 주소 변수
			var extraAddr = ""; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === "R") {
				// 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else {
				// 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === "R") {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== "" && data.apartment === "Y") {
					extraAddr +=
						extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== "") {
					extraAddr = " (" + extraAddr + ")";
					addr = addr + extraAddr;
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("address").value = addr;
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("postcode").value = data.zonecode;
			document.getElementById("address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("detailAddress").focus();
		},
	}).open();
}

//뒤로가기 금지
function blockBackward() {
	window.history.forward();
	noBack();
	function noBack() {
		window.history.forward();
	}
}blockBackward();