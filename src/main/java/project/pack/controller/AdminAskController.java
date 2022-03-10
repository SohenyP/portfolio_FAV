package project.pack.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class AdminAskController {
	// 문의 관리 이동
	@GetMapping("/manageAsk")
	public String manageAsk() {
		return "admin/adminHome_ask";
	}
}
