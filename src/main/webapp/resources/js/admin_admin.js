/**
 * 
 */
function managePerson() {

	//관리자 관리
	let plusBtn = document.getElementById("plusAdmin");
	let revBtn = document.getElementById("revAdmin");
	let reviseBtn = document.getElementById("reviseAdmin");
	let resetBtn = document.getElementById("resetAdmin");
	//회원 관리
	let mrevBtn = document.getElementById("revMem");
	let mreviseBtn = document.getElementById("reviseMem");
	let mresetBtn = document.getElementById("resetMem");

	let tbody = document.querySelector("tbody");
	let rowNum = document.querySelectorAll(".rowNum");
	let checkBox = document.querySelectorAll(".chkbox");

	if (plusBtn) {
		reset(resetBtn, checkBox, "adminReset");
		plus(plusBtn, revBtn, resetBtn, tbody, rowNum, "adminPlus");
		revise(revBtn, reviseBtn, resetBtn, plusBtn, checkBox, "권한없음", "권한있음",  "adminRevise");
	}
	else if (mrevBtn) {
		reset(mresetBtn, checkBox, "memReset");
		revise(mrevBtn, mreviseBtn, mresetBtn, "", checkBox, "비동의", "동의", "memRevise");
	}


	//관리자 리셋
	function reset(resetBtn, checkBox, url) {
		let arr = new Array();
		let checkedCnt = 0;

		//리셋버튼 클릭시 배열로 rowNum 받아가기
		resetBtn.addEventListener("click", function() {
			for (let i = 0; i < checkBox.length; i++) {
				if (checkBox[i].checked) {
					checkedCnt++;
					if (checkedCnt > 0) {
						arr.push(checkBox[i].value);
					}
				}
			}

			console.log(checkedCnt);
			//만들어진 배열 ajax로 controller에 전달하기
			if (checkedCnt > 0) {
				$.ajax({
					url: url,
					type: "POST",
					data: {
						chk: arr
					},
					success: function(data) {
						console.log(data);
						location.reload();
					}
				});
			}
			else {
				alert("리셋할 관리자를 선택 해주세요.");
			}

		});
	}

	//관리자 리스트 추가
	function plus(plusBtn, revBtn, resetBtn, tbody, rowNum, url) {
		let rowCnt = rowNum.length;

		//관리자 추가 클릭시 추가 양식 등장!
		plusBtn.addEventListener("click", function() {

			btnDisabled(plusBtn);
			btnDisabled(resetBtn);
			btnDisabled(revBtn);

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

				makeInput(ipt, i);

				td.append(ipt);
				tr.append(td);
			}

			//관리자 권한 설정 select 만들기

			const td2 = document.createElement("td");
			setSelect(td2);
			tr.append(td2);
			tbody.append(tr);

			//추가 버튼 (+버튼)
			const plus = document.getElementById("plus");

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
						url: url,
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
	}


	//관리자 정보 수정
	function revise(revBtn, reviseBtn, resetBtn, plusBtn, checkBox, opt1, opt2, url) {
		let arr = new Array();
		//하나라도 checked된 checkbox있는지 체크 목적!
		let check = 0;

		//수정 버튼 클릭시 배열로 rowNum 받아가기
		revBtn.addEventListener("click", function() {
			console.log("checkBox.length : "+checkBox.length);
			
			for (let i = 0; i < checkBox.length; i++) {
				console.log("i : "+i);
				console.log("checkBox[i] "+checkBox[i]);
				if (checkBox[i].checked) {
					check++;
					console.log("체크1 : " + check);

					if (check > 0) {
						
						btnDisabled(resetBtn);
						if(plusBtn != "") {
							btnDisabled(plusBtn);
						}
						revBtn.style.display = "none";
						reviseBtn.style.display = "inline";

						let cnt = checkBox[i].parentNode.parentNode.childElementCount;

						console.log("cnt : "+cnt);

						for (let j = 2; j < cnt - 1; j++) {
							let child = checkBox[i].parentNode.parentNode.children[j];
							let oriText = child.innerHTML;

							const ipt = document.createElement("input");
							makeInput(ipt, j);
							ipt.setAttribute("value", oriText);

							child.firstChild.textContent = "";

							checkBox[i].parentNode.parentNode.children[j].append(ipt);
						}

						let auth = checkBox[i].parentNode.parentNode.children[cnt - 1];
						auth.textContent = "";
						setSelect(auth, opt1, opt2);

					}

				}

			}
			console.log("체크2 : " + check);
			if (check < 1) {
				alert("수정할 관리자를 선택해주세요.");
			}
			//만들어진 배열 ajax로 controller에 전달하기
			let chkCnt = document.querySelectorAll(".inform2").length;

			reviseBtn.addEventListener("click", function() {
				if (check > 0) {
					for (let k = 0; k < chkCnt; k++) {
						let jsonObj = new Object();

						jsonObj.rowNum = document.querySelectorAll(".inform2")[k].parentElement.previousElementSibling.textContent;
						jsonObj.adminId = document.querySelectorAll(".inform2")[k].value;
						jsonObj.adminPw = document.querySelectorAll(".inform3")[k].value
						jsonObj.adminName = document.querySelectorAll(".inform4")[k].value;
						jsonObj.adminEmail = document.querySelectorAll(".inform5")[k].value;
						jsonObj.assigned = document.querySelectorAll(".auth")[k].value;

						jsonObj = JSON.stringify(jsonObj);
						arr.push(JSON.parse(jsonObj));
					}
					console.log(arr);

					$.ajax({
						url: url,
						type: "POST",
						data: JSON.stringify(arr),
						dataType: "json",
						contentType: "application/json; charset=uft-8",
						traditional: true,
						success: function(data) {
							console.log(data);
							location.reload();

						}
					});
				}
			});
		});
	}


	//관리자 권한 설정 select 만들기
	function setSelect(td, opt1, opt2) {
		const select = document.createElement("select");
		select.setAttribute("id", "auth");
		select.setAttribute("class", "auth");
		select.style.border = "none";
		select.style.borderBottom = "1px dotted #323232";
		select.style.outline = "none";
		select.style.textAlign = "center";
		select.style.fontSize = "17px";
		const option1 = document.createElement("option");
		option1.value = "N";
		option1.innerText = opt1;
		const option2 = document.createElement("option");
		option2.value = "Y";
		option2.innerText = opt2;

		select.append(option1);
		select.append(option2);

		td.append(select);
	}
	//정보 입력용 input 설정
	function makeInput(ipt, i) {
		ipt.setAttribute("type", "text");
		ipt.setAttribute("id", "inform" + i);
		ipt.setAttribute("class", "inform" + i);
		ipt.style.width = "60%";
		ipt.style.border = "none";
		ipt.style.borderBottom = "1px dotted #323232";
		ipt.style.outline = "none";
		ipt.style.textAlign = "center";
		ipt.style.fontSize = "17px";
	}

	//버튼 무력화!
	function btnDisabled(btn) {
		btn.setAttribute("disabled", "disabled");
	}


} managePerson();