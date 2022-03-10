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
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.pack.service.AdminService;
import project.pack.vo.adminVO;

@Controller
public class AdminManageController {

	@Autowired
	AdminService service;
	
	//관리자 관리 이동
	@GetMapping("/manageAdmin")
	public String manageAdmin(Model model, @ModelAttribute("adminVO") adminVO vo) {
		
		service.selectAdminList(model);
		
		return "admin/adminHome_admin";
	}
	
	//관리자 추가
	@PostMapping("/adminPlus")
	public ResponseEntity<adminVO> adminPlus(@RequestBody adminVO vo) {
		
		/* 전송 테스트용
		 * System.out.println("아디 : "+vo.getAdminId());
		 * System.out.println("비번 : "+vo.getAdminPw());
		 * System.out.println("이름 : "+vo.getAdminName());
		 * System.out.println("이멜 : "+vo.getAdminEmail());
		 * System.out.println("권한 : "+vo.getAssigned());
		 */
		
		service.insertAdminList(vo);
		
		ResponseEntity<adminVO> ett = new ResponseEntity<adminVO>(vo, HttpStatus.OK);
		
		return ett;
	}
	
	//관리자 수정
	@PostMapping("/adminRevise")
	public ResponseEntity<List<adminVO>> adminRevise(@RequestBody List<adminVO> vo) throws Exception {
		
		for (adminVO adminVO : vo) {
			service.updateAdminList(adminVO);
		}
		
		ResponseEntity<List<adminVO>> ett = new ResponseEntity<List<adminVO>>(vo, HttpStatus.OK);
	
		return ett;
	}
	
	//관리자 리셋
	@PostMapping("/adminReset")
	public @ResponseBody void adminReset(@RequestParam(value="chk[]") List<Integer> chk ) {
		
		System.out.println("배열 : "+chk);
		
		for (Integer integer : chk) {
			service.deleteAdminList(integer);
		}
		
	}
	
	
}
