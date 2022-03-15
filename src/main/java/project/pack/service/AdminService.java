package project.pack.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import project.pack.vo.account_memberVO;
import project.pack.vo.adminVO;

@Service
public class AdminService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 로그인
	public String selectAdmin(adminVO vo, HttpSession session, Model model) {

		String result = "";

		adminVO vo1 = sqlSessionTemplate.selectOne("admin.selectAdmin", vo);

		if (vo1 != null) {
			session.setAttribute("adminAcc", vo1);
			result = "";
		} else if (vo1 == null) {
			result = "아이디와 비밀번호를 확인해주세요";
		}

		model.addAttribute("alertMSG", result);

		System.out.println(result);

		return result;
	}

	// 관리자 리스트 추출
	public void selectAdminList(Model model) {
		model.addAttribute("administrator", sqlSessionTemplate.selectList("admin.selectAdmin"));

	}

	// 관리자 추가
	public void insertAdminList(adminVO vo) {

		sqlSessionTemplate.insert("admin.insertAdmin", vo);
	}

	// 관리자 수정
	public void updateAdminList(adminVO vo) {

		sqlSessionTemplate.update("admin.updateAdmin", vo);
	}

	// 관리자 리셋
	public void deleteAdminList(int chk) {

		sqlSessionTemplate.update("admin.deleteAdmin", chk);
	}

	// 회원 정보 리스트 추출
	public void selectMemList(Model model) {
		model.addAttribute("member", sqlSessionTemplate.selectList("admin.selectMem"));
	}

	// 회원 수정
	public void updateMemList(account_memberVO vo) {

		sqlSessionTemplate.update("admin.updateMem", vo);
	}

	// 회원 차단
	public void deleteMemList(int chk) {

		sqlSessionTemplate.update("admin.deleteMem", chk);
	}

}
