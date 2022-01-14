<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 중복확인</title>
<style type="text/css">
h1 {
	display: none;
}
</style>
</head>
<body>
	<form action="checkDuplicatedEmail" method="post">
		<label for="duplicatedEmail">이메일 중복확인</label> 
		<input type="text" name="newEmail" id="newEmail" value="${writtenEmail}" pattern="^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$"/> 
		<input type="hidden" name="canEmail" id="canEmail" value="${canEmail}" />
		<button type="submit" id="checkBtn">중복확인</button>
		<button type="button" id="useEmail">이메일 사용하기</button>
	</form>

	<h1>
		<span id="email">${writtenEmail}</span>은/는 <span id="result">${result}</span> 이메일 입니다.
	</h1>

	<script type="text/javascript">
		const checkBtn = document.querySelector("#checkBtn");
		const useEmail = document.getElementById("useEmail");
		const btn = document.querySelector("#checkBtn");
		const ipt = document.querySelector("#newEmail");
		const canEmail = document.querySelector("#canEmail");
		var checkEmail = document.querySelector("#email");
		var result = document.querySelector("#result");

		
		//횐가입 페이지에서 입력한 id값을 input창에 넣기
		if(ipt.value == "") {
			ipt.value = opener.document.querySelector("#newEmail").value;
		}

		//아이디란에 아이디 없으면 모든 버튼 비활성화
		ipt.addEventListener("keyup", function() {
			if (ipt.value.length >= 6) {
				checkBtn.disabled = false;
			} else {
				checkBtn.disabled = true;
				useEmail.setAttribute("disabled", true);
			}
		});

		//아이디 사용가능하면 '아이디 사용하기'버튼 활성화하기
		useEmail.setAttribute("disabled", true);
			if (canEmail.value == "can") {
				useEmail.removeAttribute("disabled");
			} else {
				useEmail.setAttribute("disabled", true);
			}

		//중복체크 후에 글자 보여주기
		if (result.innerHTML == "") {
			document.querySelector("h1").style.display = "none";
		} else {
			document.querySelector("h1").style.display = "block";
		}
		
		//아이디 사용하기 버튼 클릭 > 횐가입id창으로 id전송 및 중복확인창닫기
		useEmail.addEventListener("click", function(){
			console.log(ipt.value);
			opener.document.getElementById("newEmail").value = ipt.value;
			opener.document.getElementById("checkemail").setAttribute("disabled", true);
			opener.document.getElementById("duplicateEmail").classList.remove("invalid");
			opener.document.getElementById("duplicateEmail").classList.add("valid");
			window.close();
		});
	</script>
</body>
</html>