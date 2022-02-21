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
				
				if (writtenId.equals(savedId) && writtenPw.equals(savedPw)) {
					session.setAttribute("account", savedInform);
					System.out.println(session.getAttribute("account"));
					path = "b_home";
					
				} else if (writtenId.equals(savedId) && !(writtenPw.equals(savedPw))) {
					path = "c_login";
					isItUser = "NPW";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
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