package project.pack.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.pack.service.AdminService;
import project.pack.vo.account_memberVO;
import project.pack.vo.adminVO;

@Controller
public class AdminController {

	@Autowired
	AdminService service;

	// 관리자 로그인 페이지
	@GetMapping("/admin")
	public String admin(@ModelAttribute("adminVO") adminVO vo) {

		return "admin/admin";
	}

	// 로그인하기
	@PostMapping("/adminLogin")
	public String adminLogin(@ModelAttribute("adminVO") adminVO vo, HttpSession session, Model model) {
		String path = "";
		String result = service.selectAdmin(vo, session, model);
		System.out.println("result : " + result);

		// 회원정보 일치
		if (result.equals("")) {
			path = "admin/adminHome";
		}
		// 정보없음
		else {
			path = "admin/admin";
		}

		return path;
	}

	// 관리자 관리 이동
	@GetMapping("/manageAdmin")
	public String manageAdmin(Model model, @ModelAttribute("adminVO") adminVO vo) {

		service.selectAdminList(model);

		return "admin/adminHome_admin";
	}

	// 관리자 추가
	@PostMapping("/adminPlus")
	public ResponseEntity<adminVO> adminPlus(@RequestBody adminVO vo) {

		/*
		 * 전송 테스트용 System.out.println("아디 : "+vo.getAdminId());
		 * System.out.println("비번 : "+vo.getAdminPw());
		 * System.out.println("이름 : "+vo.getAdminName());
		 * System.out.println("이멜 : "+vo.getAdminEmail());
		 * System.out.println("권한 : "+vo.getAssigned());
		 */

		service.insertAdminList(vo);

		ResponseEntity<adminVO> ett = new ResponseEntity<adminVO>(vo, HttpStatus.OK);

		return ett;
	}

	// 관리자 수정
	@PostMapping("/adminRevise")
	public ResponseEntity<List<adminVO>> adminRevise(@RequestBody List<adminVO> vo) throws Exception {

		for (adminVO adminVO : vo) {
			service.updateAdminList(adminVO);
		}

		ResponseEntity<List<adminVO>> ett = new ResponseEntity<List<adminVO>>(vo, HttpStatus.OK);

		return ett;
	}

	// 관리자 리셋
	@PostMapping("/adminReset")
	public @ResponseBody void adminReset(@RequestParam(value = "chk[]") List<Integer> chk) {

		System.out.println("배열 : " + chk);

		for (Integer integer : chk) {
			service.deleteAdminList(integer);
		}

	}

	// 회원 관리 이동
	@GetMapping("/manageMember")
	public String manageMember(Model model) {

		service.selectMemList(model);

		return "admin/adminHome_member";
	}

	// 회원 수정
	@PostMapping("/memRevise")
	public ResponseEntity<List<account_memberVO>> memRevise(@RequestBody List<account_memberVO> vo) throws Exception {

		for (account_memberVO memVO : vo) {
			service.updateMemList(memVO);
			System.out.println(memVO.getMemberType());
			System.out.println(memVO.getMemberId());
			System.out.println(memVO.getMemberPw());
			System.out.println(memVO.getMemberName());
			System.out.println(memVO.getMemberEmail());
			System.out.println(memVO.getMemberContact());
			System.out.println(memVO.getMemberAgree());
		}

		ResponseEntity<List<account_memberVO>> ett = new ResponseEntity<List<account_memberVO>>(vo, HttpStatus.OK);

		return ett;
	}

	// 회원 차단
	@PostMapping("/memReset")
	public @ResponseBody void memReset(@RequestParam(value = "chk[]") List<Integer> chk) {

		System.out.println("배열 : " + chk);

		for (Integer integer : chk) {
			service.deleteMemList(integer);
		}

	}

	// 문의 관리 이동
	@GetMapping("/manageAsk")
	public String manageAsk(Model model) {
		
		service.selectAskList(model);
		
		return "admin/adminHome_ask";
	}

	// 쿠폰 관리 이동
	@GetMapping("/manageCoupon")
	public String manageCoupon() {
		return "admin/adminHome_coupon";
	}

	// 식당 관리 이동
	@GetMapping("/manageRestaurent")
	public String manageRestaurent() {
		return "admin/adminHome_restaurent";
	}

	// 축제 관리 이동
	@GetMapping("/manageFestival")
	public String manageFestival() {
		return "admin/adminHome_festival";
	}

}
