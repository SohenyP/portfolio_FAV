package project.pack.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class AdminCouponController {

	// 쿠폰 관리 이동
	@GetMapping("/manageCoupon")
	public String manageCoupon() {
		return "admin/adminHome_coupon";
	}
}
