<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<style type="text/css">
h1 {
	display: none;
}
</style>
</head>
<body>
	<form action="checkDuplicatedId" method="post">
		<label for="duplicatedId">아이디 중복확인</label> 
		<input type="text" name="newId" id="newId" value="${writtenId}"  pattern="^([A-Za-z0-9]).{5,30}$"/> 
		<input type="hidden" name="canId" id="canId" value="${canId}" />
		<button type="submit" id="checkBtn">중복확인</button>
		<button type="button" id="useId">아이디 사용하기</button>
	</form>

	<h1>
		<span id="id">${writtenId}</span>은/는 <span id="result">${result}</span> 아이디 입니다.
	</h1>

	<script type="text/javascript">
		const checkBtn = document.querySelector("#checkBtn");
		const useId = document.getElementById("useId");
		const btn = document.querySelector("#checkBtn");
		const ipt = document.querySelector("#newId");
		const canId = document.querySelector("#canId");
		var checkid = document.querySelector("#id");
		var result = document.querySelector("#result");

		
		//횐가입 페이지에서 입력한 id값을 input창에 넣기
		if(ipt.value == "") {
			ipt.value = opener.document.querySelector("#newId").value;
		}

		//아이디란에 아이디 없으면 모든 버튼 비활성화
		ipt.addEventListener("keyup", function() {
			if (ipt.value.length >= 6) {
				checkBtn.disabled = false;
			} else {
				checkBtn.disabled = true;
				useId.setAttribute("disabled", true);
			}
		});

		//아이디 사용가능하면 '아이디 사용하기'버튼 활성화하기
		useId.setAttribute("disabled", true);
			if (canId.value == "can" && ipt.value.length>=6) {
				useId.removeAttribute("disabled");
			} else {
				useId.setAttribute("disabled", true);
			}

		//중복체크 후에 결과텍스트 보여주기
		if (result.innerHTML == "") {
			document.querySelector("h1").style.display = "none";
		} else {
			document.querySelector("h1").style.display = "block";
		}
		
		//아이디 사용하기 버튼 클릭시 > 횐가입id input으로 id전송 및 중복확인창닫기
		useId.addEventListener("click", function(){
			console.log(ipt.value);
			opener.document.getElementById("newId").value = ipt.value;
			opener.document.getElementById("checkid").setAttribute("disabled", true);
			opener.document.getElementById("duplicateId").classList.remove("invalid");
			opener.document.getElementById("duplicateId").classList.add("valid");
			window.close();
		});
	</script>
</body>
</html>