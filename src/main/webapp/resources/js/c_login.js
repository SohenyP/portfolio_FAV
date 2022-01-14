/**
 * 
 */
//로그인시 아이디, 비번 공란 불가하게 만들기
function loginModal() {
	const loginBtn = document.getElementById("loginBtn");
	const id = document.getElementById("memberId");
	const pw = document.getElementById("memberPw");
	const modalbox = document.getElementById("modalCont-idpw");
	const modalIdPw = document.getElementById("idPw");
	const modalId = document.getElementById("id");
	const modalPw = document.getElementById("pw");
	const idPwBtn = document.querySelector("#idPwBtn");
	const idBtn = document.querySelector("#idBtn");
	const pwBtn = document.querySelector("#pwBtn");
	const modals = document.querySelectorAll(".modal");

	if (loginBtn && id && pw) {
		loginBtn.addEventListener("click", function(e) {
			//전체 modal숨기기
			for (let modal of modals) {
				modal.style.display = "none";
			}
			//id, pw 둘 다 없을 때
			if (!(id.value) && !(pw.value)) {
				// submit방지
				e.preventDefault();
				modalbox.style.display = "flex";
				modalIdPw.style.display = "block";
				modalBtnActive(idPwBtn);
			}
			//id 없을 때
			else if (!(id.value) && (pw.value)) {
				// submit방지
				e.preventDefault();
				modalbox.style.display = "flex";
				modalId.style.display = "block";
				modalBtnActive(idBtn);

			}
			//pw없을 때
			else if (!(pw.value) && (id.value)) {
				// submit방지
				e.preventDefault();
				modalbox.style.display = "flex";
				modalPw.style.display = "block";
				modalBtnActive(pwBtn);

			}
			//id, pw 채웠을 때
			else {
				// submit되살리기
				return true;
			}
		});
	}

	// 모달내 버튼 누르면 모달 닫기
	function modalBtnActive(btn) {
		btn.addEventListener("click", function() {
			modalbox.style.display = "none";
		});
	}

}
loginModal();



//로그인 실패시 알림창 띄우기
function isItUser() {
	let user = document.querySelector("#isItUser");


	if (user != null) {
		let userchk = user.value;
		if (userchk == "NID") {
			alert("존재하지 않는 아이디 입니다.");
		}
		else if (userchk == "NPW") {
			alert("비밀번호가 다릅니다.");
		}
	}

} isItUser();

//아이디 or 비번찾기 공란 금지
function findModal() {
	const findBtn = document.getElementById("findBtn");
	const id = document.getElementById("myId");
	const email = document.getElementById("myEmail");
	const name = document.getElementById("myName");
	const modalbox = document.getElementById("modalCont-find")
	const modalBtn = document.querySelector("#findModalBtn");
	const modals = document.querySelector(".modal");


	if (findBtn) {
		findBtn.addEventListener("click", function(e) {
			//modal숨기기
			modals.style.display = "none";
			if (id) {
				//id, email 둘 중 하나라도 없으면
				if (!(id.value) || !(email.value)) {
					// submit방지
					e.preventDefault();
					modalbox.style.display = "flex";
					modals.style.display = "block";
					modalBtnActive(modalBtn, modalbox);
				}
				//id, pw 채웠을 때
				else {
					// submit되살리기
					return true;
				}
			}
			else if (name) {
				//name, email 없을 때
				if (!(name.value) || !(email.value)) {
					// submit방지
					e.preventDefault();
					modalbox.style.display = "flex";
					modals.style.display = "block";
					modalBtnActive(modalBtn, modalbox);

				}
				//id, pw 채웠을 때
				else {
					// submit되살리기
					return true;
				}
			}
		});
	}
}

// 모달내 버튼 누르면 모달 닫기
function modalBtnActive(modalBtn, modalbox) {
	modalBtn.addEventListener("click", function() {
		modalbox.style.display = "none";
	});
}
findModal();



//아이디 or 비번찾기 결과페이지 : 버튼 종류에 따른 이동페이지 주소 설정
function findIdsetAddress() {
	const form = document.querySelector("#findForm");
	const refindBtn = document.querySelector("#refindBtn");
	const findPwBtn = document.querySelector("#findPwBtn");
	const toLoginBtn = document.querySelector("#toLoginBtn");

	if (refindBtn) {
		refindBtn.addEventListener("click", function() {
			form.setAttribute("action", "toFindId");
			form.submit();
		});
	}
	if (findPwBtn) {
		findPwBtn.addEventListener("click", function() {
			form.setAttribute("action", "toFindPw");
			form.submit();
		});
	}
	if (toLoginBtn) {
		toLoginBtn.addEventListener("click", function() {
			form.setAttribute("action", "login");
			form.submit();
		});
	}
} findIdsetAddress();



