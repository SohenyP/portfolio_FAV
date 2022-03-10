package project.pack.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class AdminFestivalController {
	// 축제 관리 이동
	@GetMapping("/manageFestival")
	public String manageFestival() {
		return "admin/adminHome_festival";
	}
}
