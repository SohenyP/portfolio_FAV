package project.pack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminCouponController {

	// 쿠폰 관리 이동
	@GetMapping("/manageCoupon")
	public String manageCoupon() {
		return "admin/adminHome_coupon";
	}
}
