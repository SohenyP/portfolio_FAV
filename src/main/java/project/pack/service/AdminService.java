package project.pack.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import project.pack.vo.adminVO;

@Service
public class AdminService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//로그인
	public String selectAdmin(adminVO vo, HttpSession session, Model model) {
		
		String result = "";
		
		adminVO vo1 = sqlSessionTemplate.selectOne("admin.selectAdmin", vo);
		
		if(vo1 != null) {
			session.setAttribute("adminAcc", vo1);
			result = "";
		}
		else if(vo1 == null) {
			result = "���̵� �Ǵ� ��й�ȣ Ȯ��";
		}
		
		model.addAttribute("alertMSG", result);
		
		System.out.println(result);
		
		return result;
	}
	
	//관리자 리스트 추출
	public void selectAdminList(Model model) {
		model.addAttribute("administrator", sqlSessionTemplate.selectList("admin.selectAdmin"));
		
	}
	
	//관리자 추가
	public void insertAdminList(adminVO vo) {
		
		sqlSessionTemplate.insert("admin.insertAdmin", vo);
	}
	
	//관리자 제거
	public void deleteAdminList(adminVO vo) {
		
		sqlSessionTemplate.update("admin.deleteAdmin", vo);
	}
}
