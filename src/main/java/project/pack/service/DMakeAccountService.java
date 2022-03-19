package project.pack.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import project.pack.vo.account_faveeVO;
import project.pack.vo.account_faverVO;
import project.pack.vo.account_memberVO;

@Service
public class DMakeAccountService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 아이디 중복확인
	public void checkDuplicatedId(account_memberVO vo, String writtenId, Model model) {

		String savedId = "";
		String result = "";
		String canId = "";


		try {
			vo.setMemberId(writtenId);
			account_memberVO savedInform = sqlSessionTemplate.selectOne("account.selectMember", vo);
			
			if(savedInform == null) {
				result = "사용 가능한";
				canId = "can";
			}
			else {
				result = "중복된";
				canId = "cant";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}


		model.addAttribute("result", result);
		model.addAttribute("canId", canId);
		model.addAttribute("writtenId", writtenId);
		
		System.out.println("저장된 아이디 : " + savedId);
	}

	// 이메일 중복확인
	public void checkDuplicatedEmail(account_memberVO vo, String writtenEmail, Model model) {

		String savedEmail = "";
		String result = "";
		String canEmail = "";

		try {
			vo.setMemberEmail(writtenEmail);

			account_memberVO savedInform = sqlSessionTemplate.selectOne("account.selectMember", vo);

			if (savedInform == null) {
				result = "사용 가능한";
				canEmail = "can";
			} else {
				result = "중복된";
				canEmail = "cant";
			}

			model.addAttribute("result", result);
			model.addAttribute("canEmail", canEmail);
			model.addAttribute("writtenEmail", writtenEmail);

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("저장된 이메일 " + savedEmail);

	}

	//회원 가입
	public void insertMember(String memberId, String memberPw, String memberName, String memberEmail, String memberContact, String memberBirth, String restauName, String restauAddr, String memberAgree) {
		try {
			
			//member테이블 추가
			account_memberVO vo1 = new account_memberVO();
			vo1.setMemberId(memberId);
			vo1.setMemberPw(memberPw);
			vo1.setMemberName(memberName);
			vo1.setMemberEmail(memberEmail);
			vo1.setMemberContact(memberContact);
			vo1.setMemberAgree(memberAgree);

			//faver테이블 추가
			account_faverVO vo2 = new account_faverVO();
			vo2.setMemberId(memberId);
			vo2.setMemberPw(memberPw);
			vo2.setMemberName(memberName);
			vo2.setMemberEmail(memberEmail);
			vo2.setMemberContact(memberContact);
			vo2.setMemberBirth(memberBirth);
			vo2.setMemberAgree(memberAgree);

			//favee테이블 추가
			account_faveeVO vo3 = new account_faveeVO();
			vo3.setMemberId(memberId);
			vo3.setMemberPw(memberPw);
			vo3.setMemberName(memberName);
			vo3.setMemberEmail(memberEmail);
			vo3.setMemberContact(memberContact);
			vo3.setRestauName(restauName);
			vo3.setRestauAddr(restauAddr);
			vo3.setMemberAgree(memberAgree);
			
			if(restauName.equals("")) {
				vo1.setMemberType("user");
				sqlSessionTemplate.insert("account.insertUser", vo1);
				sqlSessionTemplate.insert("account.insertFaver", vo2);
			}
			else if(!(restauName.equals(""))) {
				vo1.setMemberType("owner");
				sqlSessionTemplate.insert("account.insertUser", vo1);
				sqlSessionTemplate.insert("account.insertFavee", vo3);
			}


		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
