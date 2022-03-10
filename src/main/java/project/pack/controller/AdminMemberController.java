package project.pack.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class AdminMemberController {

	// 회원 관리 이동
	@GetMapping("/manageMember")
	public String manageMember() {
		return "admin/adminHome_member";
	}
}
