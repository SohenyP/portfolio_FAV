/**
 * 
 */

// 쿠폰이벤트 
let inputs = document.getElementsByClassName("restChoice");
const voteBtn = document.querySelector("#voteBtn");
const voteForm = document.getElementById("voteSumbit");
const votedChk = document.getElementById("voted").value;

let checknum = 0;
// 투표하기 버튼 이벤트
voteBtn.addEventListener("click", function() {

	for (let i = 0; i < inputs.length; i++) {
		if (inputs[i].checked == true) {
			if (votedChk == "N" || votedChk == "") {
				checknum++;
				voteForm.submit();
			}
			else if(votedChk == "Y") {
				checknum++;
				alert("이미 투표 하셨습니다.");
			}
		}
	}
	if (checknum == 0) {
		alert("투표할 식당을 선택해주세요.");
	}


});
