package project.pack.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.pack.service.CLoginService;
import project.pack.service.JMyPageService;
import project.pack.vo.account_bbsVO;
import project.pack.vo.account_faveeVO;
import project.pack.vo.account_faverVO;
import project.pack.vo.account_memberVO;
import project.pack.vo.revision_VO;

@Controller
public class JMyPageController {

	@Autowired
	JMyPageService service;

	@Autowired
	CLoginService service2;

	// 마이페이지 이동
	@GetMapping("/myPage")
	public String myPage(HttpSession session, account_faverVO faver, account_faveeVO favee, Model model) {

		// 회원 타입따라 path 결정
		String path = service.getMyPage(session, faver, favee, model);

		return path;
	}

	// 회원정보 수정 전 비번확인 페이지
	@GetMapping("/changeInformBefore")
	public String changeInform(HttpSession session) {

		service.getSession(session);

		return "j_mypage_beforeChange";
	}

	// 회원정보 수정 페이지
	@GetMapping("/changeInform")
	public String changeInform(@ModelAttribute("memberVO") account_memberVO vo, Model model) {

		String path = "";

		account_memberVO vo1 = service.selectMemberPw(vo);

		//비번 다르면 다시 비번확인 페이지
		if (vo1 == null || !(vo1.getMemberPw().equals(vo.getMemberPw()))) {

			System.out.println(vo.getMemberPw());
			System.out.println(vo1.getMemberPw());

			model.addAttribute("alertMSG", "비밀번호를 확인해주세요");
			path = "forward:/changeInformBefore";
		} else {
			path = "j_mypage_changeInform";
		}

		return path;
	}

	// 회원정보 수정하기
	@PostMapping("/revise")
	public String revise(revision_VO vo, Model model, HttpSession session) {

		service.revisionInform(vo, model, session);

		return "j_mypage_changeInform";
	}

	// 회원 탈퇴 페이지 이동
	@GetMapping("toDeleteAccount")
	public String toDeleteAccount() {

		return "j_mypage_beforeDelete";
	}

	//회원 탈퇴 페이지
	@GetMapping("/deleteAccount")
	public String deleteAccount(@ModelAttribute("memberVO") account_memberVO vo, Model model, HttpSession session) {

		String path = "";

		//비번 체크 위해 db 저장 비번 가져오기
		account_memberVO vo1 = service.selectMemberPw(vo);

		// 틀림
		if (vo1 == null || !(vo1.getMemberPw().equals(vo.getMemberPw()))) {

			model.addAttribute("alertMSG", "비밀번호를 확인해주세요.");
			path = "forward:/toDeleteAccount";
		}
		// 맞음
		else {
			//탈퇴 가능여부 메세지 받아오기
			String alertMSG = service.deleteMember(vo, model);

			// 탈퇴 가능시 탈퇴처리 및 HOME이동
			if (alertMSG.equals("탈퇴가능")) {
				service2.initLoginSession(session);
				path = "redirect:/home";
			}
			// 탈퇴 불가시 다시 DELTEACCOUNT페이지 이동
			else {
				path = "forward:/toDeleteAccount";
			}
		}

		return path;
	}

	//1:1문의 게시글 db가져오기
	@GetMapping("toAsk")
	public String toAsk(@ModelAttribute("accountbbsVO") account_bbsVO vo, HttpSession session, account_faverVO faver,
			account_faveeVO favee, Model model) {

		service.getInform(session, faver, favee, model);

		return "j_mypage_ask";
		
	}
	
	//1:1문의 게시글 추가
	@GetMapping("/insertQnaBbs")
	public String insertQnaBbs(@ModelAttribute("accountbbsVO") account_bbsVO vo) {
		
		service.insertAskBbs(vo);

		return "redirect:/myPage";
	}

	//1:1문의 게시글 수정 이동
	@GetMapping("/toAskModify")
	public String toAskModify(@RequestParam("rowNum") int rowNum, @ModelAttribute("accountbbsVO") account_bbsVO vo, Model model,
			HttpSession session, account_faverVO faver, account_faveeVO favee) {
		
		service.getInform(session, faver, favee, model);
		service.getQnaBbs2(rowNum, vo, model);
		
		return "j_mypage_ask_modify";
		
	}
	
	//1:1문의 게시글 수정
	@GetMapping("/askModify")
	public String askModify(@ModelAttribute("accountbbsVO") account_bbsVO vo) {
		
		service.updateQnaBbs(vo);
		
		return "forward:/myPage";
	}
	
	//1:1문의 게시글 삭제
	@GetMapping("/askDelete")
	public String askDelete(@RequestParam("rowNum") int rowNum, HttpSession session, account_bbsVO vo) {
		
		service.deletAskBbs(session, vo, rowNum);
		
		return "forward:/myPage";
	}

}
