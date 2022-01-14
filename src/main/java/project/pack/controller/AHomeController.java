package project.pack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AHomeController {
	
	//첫 페이지 설정
	@RequestMapping(value = "/", method =RequestMethod.GET)
	public String home() {
		return "a_welcome";
		
	}
}
