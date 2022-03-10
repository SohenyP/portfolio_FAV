package project.pack.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import project.pack.service.AdminService;
import project.pack.vo.adminVO;

public class AdminLoginController {
	
	@Autowired
	AdminService service;
	
	//관리자 로그인 페이지
	@GetMapping("/admin")
	public String admin(@ModelAttribute("adminVO") adminVO vo) {
		
		return "admin/admin";
	}
	
	//로그인하기
	@PostMapping("/adminLogin")
	public String adminLogin(@ModelAttribute("adminVO") adminVO vo, HttpSession session, Model model) {
		String path = "";
		String result = service.selectAdmin(vo, session, model);
		System.out.println("result : "+result);
		
		//회원정보 일치
		if(result.equals("")) {
			path = "admin/adminHome";		
		}
		//정보없음
		else {
			path = "admin/admin";
		}
		
		return path;
	}
}
