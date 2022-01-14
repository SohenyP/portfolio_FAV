package project.pack.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import project.pack.vo.restaurent_listVO;



@Service
public class BHomeService {

	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	//축제 가져오기 : 국내
	public void getFastivalDome(Model model, String table1, String table2) {
		try {
			
			model.addAttribute("festivalDList", sqlSessionTemplate.selectList("festival.selectFastival", table1));
			model.addAttribute("festivalFList", sqlSessionTemplate.selectList("festival.selectFastival", table2));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	//축제 가져오기 : 해외
	public void getRestauList(Model model) {
		try {
			model.addAttribute("restaurentList", sqlSessionTemplate.selectList("restaurent.selectRestaurent"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
