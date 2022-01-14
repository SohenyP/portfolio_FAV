/**
 * 
 */

function getCouponBtn() {

	const form = document.getElementById("couponForm");
	const getCPbtn = document.getElementById("getCPbtn");
	const loginBtn = document.getElementById("goToLogin");

	if (loginBtn) {
		//비로그인시 쿠폰받으면 로그인 페이지로 이동
		loginBtn.addEventListener("click", function() {
			form.setAttribute("action", "login");
			form.submit();
		});
	}
	if (getCPbtn) {
		//로그인시 쿠폰 받으면 쿠폰 받기 처리 후 다시 쿠폰 창으로 돌아오게 하기
		getCPbtn.addEventListener("click", function() {
			form.setAttribute("action", "getCoupon");
			form.submit();
		});
	}

} getCouponBtn();

function afterGettingCoupon() {
	
	
	const alertMSG = document.getElementById("alertMSG");
	
	if(alertMSG.value) {
		alert(alertMSG.value);
	}

} afterGettingCoupon();