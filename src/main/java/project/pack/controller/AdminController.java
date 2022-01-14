package project.pack.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import project.pack.service.AdminService;
import project.pack.vo.adminVO;

@Controller
public class AdminController {

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
	
	//관리자 관리 이동
	@GetMapping("/manageAdmin")
	public String manageAdmin(Model model, @ModelAttribute("adminVO") adminVO vo) {
		
		service.selectAdminList(model);
		
		return "admin/adminHome_admin";
	}
	//회원 관리 이동
	@GetMapping("/manageMember")
	public String manageMember() {
		return "admin/adminHome_member";
	}
	//문의 관리 이동
	@GetMapping("/manageAsk")
	public String manageAsk() {
		return "admin/adminHome_ask";
	}
	//쿠폰 관리 이동
	@GetMapping("/manageCoupon")
	public String manageCoupon() {
		return "admin/adminHome_coupon";
	}
	//식당 관리 이동
	@GetMapping("/manageRestaurent")
	public String manageRestaurent() {
		return "admin/adminHome_restaurent";
	}
	//축제 관리 이동
	@GetMapping("/manageFestival")
	public String manageFestival() {
		return "admin/adminHome_festival";
	}
	
	//관리자 추가
	@GetMapping("/adminPlus")
	public String adminPlus(adminVO vo) {
		
		service.insertAdminList(vo);
		
		return "";
	}
	
	//관리자 수정
	@GetMapping("/adminRevise")
	public String adminRevise(adminVO vo) {
		
		return "";
	}
	
	//관리자 삭제
	@GetMapping("/adminMinus")
	public String adminMinus(adminVO vo) {
		
		service.deleteAdminList(vo);
		
		return "redirect:/manageAdmin";
	}
	
	
}
