package project.pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.pack.service.DMakeAccountService;
import project.pack.vo.account_memberVO;

@Controller
public class DMakeAccountController {

	@Autowired
	DMakeAccountService service;

	// 회원가입 전 타입 체크 페이지 이동
	@GetMapping("/makeAccountBefore")
	public String makeAccountBefore() {
		return "d_makeAccount_Before";
	}

	// faver 타입 회원가입
	@GetMapping("/faverAccount")
	public String faverAccount() {
		return "d_makeAccount_faver";
	}

	// favee  타입 회원가입
	@GetMapping("/faveeAccount")
	public String faveeAccount() {
		return "d_makeAccount_favee";
	}

	// 아이디 중복체크
	@GetMapping("/duplicatedId")
	public String duplicatedId() {
		return "d_makeAccount_duplicate_id";
	}

	// 아이디 중복체크 팝업
	@PostMapping("/checkDuplicatedId")
	public String checkDuplicatedId(@RequestParam("newId") String writtenId, Model model, account_memberVO vo) {

		service.checkDuplicatedId(vo, writtenId, model);

		return "d_makeAccount_duplicate_id";
	}

	// 이메일 중복체크
	@GetMapping("/duplicatedEmail")
	public String duplicatedEmail() {
		return "d_makeAccount_duplicate_email";
	}

	// 이메일 중복체크 팝업
	@PostMapping("/checkDuplicatedEmail")
	public String checkDuplicatedEmail(@RequestParam("newEmail") String writtenEmail, Model model,
			account_memberVO vo) {

		service.checkDuplicatedEmail(vo, writtenEmail, model);

		return "d_makeAccount_duplicate_email";
	}

	// 회원 가입 제출
	@PostMapping("/makeAccount")
	public String makeAccount(
			@RequestParam("newId") String memberId, 
			@RequestParam("newPw") String memberPw,
			@RequestParam("newName") String memberName, 
			@RequestParam("newEmail") String memberEmail,
			@RequestParam("newPhone") String memberContact,
			@RequestParam(value = "yyyy", defaultValue = "") String yyyy,
			@RequestParam(value = "mm", defaultValue = "") String mm,
			@RequestParam(value = "dd", defaultValue = "") String dd,
			@RequestParam(value = "restauName", defaultValue = "") String restauName,
			@RequestParam(value = "addr1", defaultValue = "") String addr1,
			@RequestParam(value = "addr2", defaultValue = "") String addr2,
			@RequestParam(value = "userChkboxC", defaultValue = "N") String memberAgree) {

		String memberBirth = yyyy + mm + dd;
		String restauAddr = addr1 + " " + addr2;

		service.insertMember(memberId, memberPw, memberName, memberEmail, memberContact, memberBirth, restauName, restauAddr, memberAgree);

		return "d_makeAccount_After";
	}
}
