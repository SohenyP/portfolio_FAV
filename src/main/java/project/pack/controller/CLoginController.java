package project.pack.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.pack.service.CLoginService;
import project.pack.vo.account_memberVO;

@Controller
public class CLoginController {

	@Autowired
	CLoginService service;

	// 로그인 페이지 이동
	@RequestMapping(value = "/login")
	public String login() {
		return "c_login";
	}

	// 로그인
	@PostMapping("/loginSubmit")
	public String loginSubmit(HttpServletRequest request, HttpSession session, Model model) {

		String path = "";

		String writtenId = request.getParameter("memberId");
		String writtenIdPw = request.getParameter("memberPw");

		path = service.selectMemberId(session, model, writtenId, writtenIdPw);
		
		return path;
	}

	//로그아웃
	@RequestMapping(value = "/logout")
	public String logout(
			HttpServletRequest request, 
			@RequestParam String path, 
			@RequestParam(defaultValue = "") String rowNum) {

		HttpSession session = request.getSession();
		service.initLoginSession(session);
		
		System.out.println("path:"+path);
		
		String finalPath = "";
		
		if(rowNum != "") {
			finalPath = "redirect:/"+path+"?rowNum="+rowNum;
		}
		else if(rowNum == "") {
			finalPath = "redirect:/"+path;	
		}
		
		return finalPath;
	}
	
	
	// 아이디 찾기 이동
	@RequestMapping("/toFindId")
	public String toFindId() {
		return "c_login_find_id";
	}

	// 아이디 찾기 로직
	@PostMapping("/findId")
	public String findId(HttpServletRequest request, Model model) {

		String result = "";

		String writtenName = request.getParameter("myName");
		String writtenEmail = request.getParameter("myEmail");
		
		account_memberVO savedInform = service.findId(writtenName, writtenEmail);
		

		if (savedInform == null) {
			result = "일치하는 회원 정보가 없습니다.";
			model.addAttribute("result", result);

		} else {
			String savedId = savedInform.getMemberId();
			
			model.addAttribute("result", savedId);
			System.out.println("savedId : "+savedId);
		}

		return "c_login_find_id_result";
	}

	// 비밀번호 찾기 이동
	@RequestMapping(value = "/toFindPw")
	public String toFindPw() {
		
		return "c_login_find_pw";
	}

	// 비밀번호 찾기 로직
	@PostMapping("/findPw")
	public String findPw(HttpServletRequest request, Model model) {

		String result = "";

		String writtenId = request.getParameter("myId");
		String writtenEmail = request.getParameter("myEmail");
		
		account_memberVO savedInform = service.findPw(writtenId, writtenEmail);

		if (savedInform == null) {
			result = "일치하는 회원 정보가 없습니다.";
			model.addAttribute("result", result);

		} else {
			String savedPw = savedInform.getMemberPw();
			
			model.addAttribute("result", savedPw);
			System.out.println("savedPw :"+savedPw);
		}
		
		return "c_login_find_pw_result";
	}

}
