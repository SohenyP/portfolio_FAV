package project.pack.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import project.pack.vo.account_memberVO;

@Service
public class CLoginService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	account_memberVO memberVO;

	//로그인 : 아이디 비번 체크
	public String selectMemberId(HttpSession session, Model model, String writtenId, String writtenPw) {

		String path = "";
		String isItUser = "";
		
		account_memberVO savedInform = null;
		
		try {
			memberVO.setMemberId(writtenId);
			savedInform = sqlSessionTemplate.selectOne("account.selectMember", memberVO);
			
			if (savedInform == null) {
				path = "c_login";
				isItUser = "NID";
			} 
			else {
				String savedId = savedInform.getMemberId();
				String savedPw = savedInform.getMemberPw();
				
				//로그인 성공
				if (writtenId.equals(savedId) && writtenPw.equals(savedPw)) {
					session.setAttribute("account", savedInform);
					System.out.println(session.getAttribute("account"));
					path = "b_home";
					
				} 
				//비밀번호 불일치
				else if (writtenId.equals(savedId) && !(writtenPw.equals(savedPw))) {
					path = "c_login";
					isItUser = "NPW";
				}
				//탈퇴한 회원
				else if (writtenId.equals(savedId) && (writtenPw.equals(null))) {
					path = "c_login";
					isItUser = "NMB";
				}
				//차단된 회원 : memberType이 blocked
				else if (writtenId.equals(savedId) && writtenPw.equals(savedPw) && memberVO.getMemberType().equals("blocked")) {
					path = "c_login";
					isItUser = "BLC";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			//예외페이지 만들기
		}

		model.addAttribute("isItUser", isItUser);
		return path;

	}

	//아이디 찾기
	public account_memberVO findId(String writtenName, String writtenEmail) {
		
		account_memberVO savedInform = null;
		try {
			memberVO.setMemberName(writtenName);
			memberVO.setMemberEmail(writtenEmail);
			savedInform = sqlSessionTemplate.selectOne("account.selectMember", memberVO);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return savedInform;
	}

	// 비번 찾기
	public account_memberVO findPw(String writtenId, String writtenEmail) {
		
		account_memberVO savedInform = null;
		try {
			memberVO.setMemberId(writtenId);
			memberVO.setMemberEmail(writtenEmail);
			savedInform = sqlSessionTemplate.selectOne("account.selectMember", memberVO);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return savedInform;
	}

	// 로그아웃
	public void initLoginSession(HttpSession session) {
		try {
			session.invalidate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
