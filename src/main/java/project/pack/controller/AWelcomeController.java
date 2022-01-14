package project.pack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AWelcomeController {
	
	// 웰컴 페이지 이동
	@GetMapping("/welcome")
	public String welcome() {
		return "a_welcome";
	}

}
