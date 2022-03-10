package project.pack.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class AdminRestaurentController {

	// 식당 관리 이동
	@GetMapping("/manageRestaurent")
	public String manageRestaurent() {
		return "admin/adminHome_restaurent";
	}
}
