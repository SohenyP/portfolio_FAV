package project.pack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminMemberController {

	// 회원 관리 이동
	@GetMapping("/manageMember")
	public String manageMember() {
		return "admin/adminHome_member";
	}
}
