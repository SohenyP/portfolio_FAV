package project.pack.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import project.pack.service.BHomeService;

@Controller
public class AGlobalController {

	@Autowired
	BHomeService service;

	
	//  page + div for each type of vegetarian
	@GetMapping("/welcomeFlex")
	public String welcomeFlex(Model model) {
		model.addAttribute("part", "part1");
		return "a_welcome";
	}

	@GetMapping("/welcomePollo")
	public String welcomePollo(Model model) {
		model.addAttribute("part", "part2");
		return "a_welcome";
	}

	@GetMapping("/welcomePesco")
	public String welcomePesco(Model model) {
		model.addAttribute("part", "part3");
		return "a_welcome";
	}

	@GetMapping("/welcomeLtOv")
	public String welcomeLtOv(Model model) {
		model.addAttribute("part", "part4");
		return "a_welcome";
	}

	@GetMapping("/welcomeOv")
	public String welcomeOv(Model model) {
		model.addAttribute("part", "part5");
		return "a_welcome";
	}

	@GetMapping("/welcomeLt")
	public String welcomeLt(Model model) {
		model.addAttribute("part", "part6");
		return "a_welcome";
	}

	@GetMapping("/welcomeVegan")
	public String welcomeVegan(Model model) {
		model.addAttribute("part", "part7");
		return "a_welcome";
	}

	@GetMapping("/welcomeFruit")
	public String welcomeFruit(Model model) {
		model.addAttribute("part", "part8");
		return "a_welcome";
	}
	
	
	//AboutFav 이동
	@GetMapping("/aboutFAV")
	public String aboutFAV() {
		return "e_aboutFAV";
	}
	

	
}
