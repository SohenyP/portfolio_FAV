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
		setSelect(tr);
		/*const td2 = document.createElement("td");
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
		tr.append(td2);*/

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

//관리자 권한 설정 select 만들기
function setSelect(tr) {
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
}

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
				chk: arr
			},
			success: function(data) {
				console.log(data);
				location.reload();
			}
		});
	});
} adminReset();


//관리자 정보 수정
function adminRevise() {
	let rowNum = document.getElementsByName("chkbox");
	let btn = document.getElementById("revAdmin");
	let reviseBtn = document.getElementById("reviseAdmin");
	let resetBtn = document.getElementById("resetAdmin");
	let plusBtn = document.getElementById("plusAdmin");
	let arr = new Array();

	//리셋버튼 클릭시 배열로 rowNum 받아가기
	btn.addEventListener("click", function() {
		btn.style.display = "none";
		resetBtn.setAttribute("disabled", "disabled");
		plusBtn.setAttribute("disabled", "disabled");
		reviseBtn.style.display = "inline";

		for (let i = 0; i < rowNum.length; i++) {
			if (rowNum[i].checked) {
				let cnt = rowNum[i].parentNode.parentNode.childElementCount;

				for (let j = 2; j < cnt - 1; j++) {
					let child = rowNum[i].parentNode.parentNode.children[j];
					let oriText = child.innerHTML;
					const ipt = document.createElement("input");
					ipt.setAttribute("type", "text");
					ipt.setAttribute("class", "inform" + j + j);
					ipt.setAttribute("value", oriText);
					ipt.style.width = "100px";

					child.firstChild.textContent = "";

					rowNum[i].parentNode.parentNode.children[j].append(ipt);
				}

				let auth = rowNum[i].parentNode.parentNode.children[cnt - 1];
				auth.textContent = "";
				setSelect(auth);
				
				let chkCnt = document.querySelectorAll(".inform22").length;
				console.log(chkCnt);

				reviseBtn.addEventListener("click", function() {
					for(let k = 0; k < chkCnt; k++) {
						let jsonObj = new Object();
						
						jsonObj.adminId = document.querySelectorAll(".inform22")[k].value;
						jsonObj.adminPw = document.querySelectorAll(".inform33")[k].value
						jsonObj.adminName = document.querySelectorAll(".inform44")[k].value;
						jsonObj.adminName = document.querySelectorAll(".inform55")[k].value;
						
						jsonObj = JSON.stringify(jsonObj);
						arr.push(JSON.parse(jsonObj));
					}
					
					console.log(arr);
					
					/*$.ajax({
						url: "adminRevise",
						type: "POST",
						data: 
						success: function(data) {
							console.log(data);
							location.reload();
						}
					});*/
				});

			}
			
		}
		//만들어진 배열 ajax로 controller에 전달하기



	});

	//작동안한 체크 필요!!!
	function valueRemove() {
		const tagInput = document.getElementsByTagName("input");
		for (let i = 0; i < tagInput.length; i++) {
			if (tagInput[i].focus) {
				tagInput[i].value = "";
			}
		}
	} valueRemove();

} adminRevise();


