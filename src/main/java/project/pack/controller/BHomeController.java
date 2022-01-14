package project.pack.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import project.pack.service.BHomeService;

@Controller
public class BHomeController {

	@Autowired
	BHomeService service;

	// HOME이동 + FESTIVAL정보 뿌리기
	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		String table1 = "festival_domestic";
		String table2 = "festival_foreign";
		
		model.addAttribute("account", session.getAttribute("account"));

		service.getFastivalDome(model, table1, table2);

		return "b_home";
	}

	// 식당찾기 이동
	@GetMapping("/restaurent")
	public String restaurent(HttpServletRequest request, Model model) {

		String n = request.getParameter("location");
		if (n != null) {
			model.addAttribute("n", n);
		}
		service.getRestauList(model);

		return "f_restaurent";
	}

}
