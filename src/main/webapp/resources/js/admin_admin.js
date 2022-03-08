/**
 * 
 */

//관리자 리스트 추가
function adminPlus() {
	let plusBtn = document.getElementById("plusAdmin");
	let tbody = document.querySelector("tbody");
	let rowNum = document.querySelectorAll(".rowNum");
	let rowCnt = rowNum.length;

	//관리자 추가 클릭시 추가 양식 등장!
	plusBtn.addEventListener("click", function() {
		plusBtn.setAttribute("disabled", "disabled");
		const tr = document.createElement("tr");

		//추가 등록 버튼 만들기
		const td = document.createElement("td");
		const btn = document.createElement("button");
		btn.setAttribute("type", "button");
		btn.setAttribute("id", "plus");
		btn.setAttribute("title", "클릭시 추가됩니다.");
		btn.innerHTML = "+";
		td.append(btn);

		const td1 = document.createElement("td");
		td1.innerHTML = rowCnt + 1;

		tr.append(td);
		tr.append(td1);

		//아이디, 비번, 이름, 메일 input 만들기
		for (let i = 0; i < 4; i++) {
			const td = document.createElement("td");
			const ipt = document.createElement("input");
			ipt.setAttribute("type", "text");
			ipt.setAttribute("id", "inform" + i);
			ipt.style.width = "100px";

			td.append(ipt);
			tr.append(td);
		}

		//관리자 권한 설정 select 만들기
		const td2 = document.createElement("td");
		const select = document.createElement("select");
		select.setAttribute("id", "auth");
		const option1 = document.createElement("option");
		option1.value = "N";
		option1.innerText = "권한없음";
		const option2 = document.createElement("option");
		option2.value = "Y";
		option2.innerText = "권한있음";

		select.append(option1);
		select.append(option2);
		td2.append(select);
		tr.append(td2);

		tbody.append(tr);

		const plus = document.getElementById("plus");
		console.log(plus);

		//+버튼 클릭시 input에 담긴 내용 전달해 db추가
		plus.addEventListener("click", function() {
			let adminId = document.getElementById("inform0").value;
			let adminPw = document.getElementById("inform1").value;
			let adminName = document.getElementById("inform2").value;
			let adminEmail = document.getElementById("inform3").value;
			let assigned = document.getElementById("auth").value;

			console.log(adminId);

			if (adminId != "" && adminPw != "" && adminName != "" && adminEmail != "") {

				let newAdmin = { adminId, adminPw, adminName, adminEmail, assigned };

				console.log(newAdmin);

				$.ajax({
					url: "adminPlus",
					type: "POST",
					data: JSON.stringify(newAdmin),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					success: function(data) {
						console.log(data);
						location.reload();
					}
				});
			}
			else {
				alert("모든 항목을 작성해주세요");
			}
		});
	});
} adminPlus();



//관리자 리셋
function adminReset() {
	let rowNum = document.getElementsByName("chkbox");
	let btn = document.getElementById("resetAdmin");
	let arr = new Array();

	//리셋버튼 클릭시 배열로 rowNum 받아가기
	btn.addEventListener("click", function() {
		for (let i = 0; i < rowNum.length; i++) {
			if (rowNum[i].checked) {
				arr.push(rowNum[i].value);
			}
		}

		//만들어진 배열 ajax로 controller에 전달하기
		$.ajax({
			url: "adminReset",
			type: "POST",
			data: { 
				chk : arr
			},
			success: function(data) {
				console.log(data);
			}
		});
	});


} adminReset();

