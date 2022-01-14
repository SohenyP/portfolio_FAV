/**
 * 
 */

// 게시판 보드 확장, 축소
function boardHeight() {
	if (document.querySelector(".board_contents")) {
		$(function() {
			const $info = $(".board_contents tbody a.info");
			const $tbody = $(".board_contents tbody");
			// heightArray라는 배열 공간 만들기
			let heightArray = new Array();

			$tbody.each(function() {
				heightArray.push($(this).find(".description").height());
			});

			$info.click(function(e) {
				e.preventDefault();
				if ($(this).parents("tbody").hasClass("on")) {
					$(this).parents("tbody").removeClass("on");
				} else {
					$(".board_contents tbody").removeClass("on");
					$(this).parents("tbody").addClass("on");
				}
			})

		});
	}
} boardHeight();

//새글 쓰기 페이지 display 수정
function createNewPost() {
	const writeRecipe = document.querySelector(".writebtnBox>#writeRecipe");
	const writerBox = document.getElementById("writerBox");
	const board = document.getElementById("board");
	const submitPost = document.querySelector("#submitPost");
	const backBoard = document.querySelector("#backBoard");
	const pagingBox = document.querySelector("#pagingBox");
	let memberId = document.getElementById("memId");

	writeRecipe.addEventListener("click", function() {
		if (memberId.value) {
			writerBox.style.display = "flex";
			board.style.display = "none";
			pagingBox.style.display = "none";
			writeRecipe.style.display = "none";
		}
		else {
			location.href = "login";
		}
	});

	//완료시 제출
	submitPost.addEventListener("click", function() {
		writer.submit();
	});
	//취소시 게시판 display 수정
	backBoard.addEventListener("click", function() {
		writer.style.display = "none";
		board.style.display = "block";
		pagingBox.style.display = "block";
		writeRecipe.style.display = "block";
	})

} createNewPost();


//수정하기
function modifyPost() {

	/* 게시글 수정 삭제 */
	const writeRecipe = document.querySelector(".writebtnBox>#writeRecipe");
	const board = document.getElementById("board");
	const pagingBox = document.querySelector("#pagingBox");
	const modifyPost = document.querySelector("#modifyPost");
	const backBoard2 = document.querySelector("#backBoard2");
	const modifier = document.querySelector("#modifier");

	let list = document.querySelectorAll(".list");
	let modifyBtnBox = document.querySelectorAll(".modifyBtn");

	for (let i = 0; i < list.length; i++) {
		if (modifyBtnBox[i].firstElementChild != null) {

			let answer = modifyBtnBox[i].previousElementSibling;
			let tr = modifyBtnBox[i].parentElement.parentElement.previousElementSibling;
			let bulletPoint = tr.firstElementChild.nextElementSibling;

			let title = bulletPoint.nextElementSibling.firstElementChild.innerHTML;
			let content = answer.lastElementChild.innerHTML;
			let bullet = tr.firstElementChild.nextElementSibling.innerHTML;
			let memberId = tr.lastElementChild.previousElementSibling.innerHTML;
			let num = tr.firstElementChild.innerHTML;

			//수정 버튼 클릭시 해당 내용 가져오기
			modifyBtnBox[i].firstElementChild.addEventListener("click", function() {

				document.querySelector("#modifyTitle").value = title;
				document.querySelector("#modifyContent").value = content;
				document.querySelector("#modifyBulletPoint").value = bullet;
				document.querySelector("#modifierId").value = memberId;
				document.querySelector("#modifierNum").value = num;

				modifyBox.style.display = "flex";
				board.style.display = "none";
				pagingBox.style.display = "none";
				writeRecipe.style.display = "none";
			});

			//삭제시 게시판 번호 가지고 이동
			modifyBtnBox[i].lastElementChild.addEventListener("click", function() {

				location.href = "deleteBbs?num=" + num;
			});
		}

	}


	//완료시 제출
	modifyPost.addEventListener("click", function() {
		modifier.submit();
	});

	//취소시 게시판 보여주기
	backBoard2.addEventListener("click", function() {
		modifyBox.style.display = "none";
		board.style.display = "block";
		pagingBox.style.display = "block";
		writeRecipe.style.display = "block";

	})

} modifyPost();

