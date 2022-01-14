package project.pack.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import project.pack.vo.account_bbsVO;
import project.pack.vo.account_couponVO;
import project.pack.vo.account_faveeVO;
import project.pack.vo.account_faverVO;
import project.pack.vo.account_memberVO;
import project.pack.vo.account_reservationVO;
import project.pack.vo.restaurent_listVO;
import project.pack.vo.revision_VO;

@Service
public class JMyPageService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//세션 정보 가져오기
	public account_memberVO getSession(HttpSession session) {

		account_memberVO vo = (account_memberVO)session.getAttribute("account");
		
		return vo;
	}
	
	//회원 타입 구분
	public String checkType(HttpSession session, account_faverVO faver, account_faveeVO favee) {
		
		String areYouFaver = "";
		
		account_memberVO vo = getSession(session);
	
		String sessionId = vo.getMemberId();
		String sessionPw = vo.getMemberPw();
		System.out.println("sessionId: "+sessionId);
		System.out.println("sessionPw: "+sessionPw);
		
		faver.setMemberId(sessionId);
		faver.setMemberPw(sessionPw);
		
		favee.setMemberId(sessionId);
		favee.setMemberPw(sessionPw);
		
		account_faverVO isFaver = sqlSessionTemplate.selectOne("account.selectFaver", faver);
		System.out.println("isFaver : "+isFaver);
		account_faveeVO isFavee = sqlSessionTemplate.selectOne("account.selectFavee", favee);
		System.out.println("isFavee : "+isFavee);
		
		if(isFaver == null) {
			areYouFaver = "N";
		}
		else if (isFavee == null) {
			areYouFaver = "Y";
		}
		
		return areYouFaver;
		
	}

	//회원 타입 따라 다른 페이지로 이동 로직
	public String getMyPage(HttpSession session, account_faverVO faver, account_faveeVO favee, Model model) {
		
		String path = "";
		
		try {
			//회원 타입 구분
			String areYouFaver = checkType(session, faver, favee);
			
			account_memberVO vo = getSession(session);
			
			
			//점주
			if(areYouFaver.equals("N")) {
				//점주 예약 리스트 가져오기 (memberOid, status)
				account_reservationVO vo1 = new account_reservationVO();
				vo1.setMemberOid(vo.getMemberId());
				vo1.setStatus("결제완료");
				selectReservationList(vo1, model);
				
				//점주 식당 정보 가져오기
				restaurent_listVO getResList = new restaurent_listVO();
				getResList.setMemberId(vo.getMemberId());
				selectMyRestaurent(getResList, model);
				
				//점주 1:1문의 글 가져오기
				account_bbsVO getAskList = new account_bbsVO();
				getAskList.setMemberId(vo.getMemberId());
				getQnaBbs(getAskList, model);
				
				
				//점주 정보 가져가기
				account_faveeVO isFavee = new account_faveeVO();
				isFavee.setMemberId(vo.getMemberId());
				model.addAttribute("isFavee", sqlSessionTemplate.selectOne("account.selectFavee", isFavee));
				
				//점주 마이페이지 path
				path = "j_mypage_favee";
			}
			//회원
			else if(areYouFaver.equals("Y")) {
				//회원 예약 리스트 가져오기 (memberBid)
				account_reservationVO vo2 = new account_reservationVO();
				vo2.setMemberBid(vo.getMemberId());
				selectReservationList(vo2, model);
				
				//회원 쿠폰 리스트 가져오기
				account_couponVO couponList = new account_couponVO();
				couponList.setMemberId(vo.getMemberId());
				selectCouponList(couponList, model);
				
				//회원 1:1문의글 가져오기
				account_bbsVO getAskList = new account_bbsVO();
				getAskList.setMemberId(vo.getMemberId());
				getQnaBbs(getAskList, model);
				
				//회원 정보 가져가기
				account_faverVO isFaver = new account_faverVO();
				isFaver.setMemberId(vo.getMemberId());
				model.addAttribute("isFaver", sqlSessionTemplate.selectOne("account.selectFaver", isFaver));

				//회원 마이페이지path
				path = "j_mypage_faver";
			}
			else {
				System.out.println("회원/점주 아님");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return path;
	}
	
	//예약 리스트 뽑기
	public void selectReservationList(account_reservationVO vo, Model model1) {
		
		model1.addAttribute("myReservation", sqlSessionTemplate.selectList("reservation.selectReservationList", vo));
		
	}
	
	//수령 쿠폰 리스트 뽑기
	public void selectCouponList(account_couponVO vo, Model model2) {
		
		model2.addAttribute("myCoupon", sqlSessionTemplate.selectList("coupon.selectCouponFaver", vo));
	
	}
	
	//소유 식당 리스트 뽑기
	public void selectMyRestaurent(restaurent_listVO memberId, Model model3) {
		
		model3.addAttribute("myRestaurent", sqlSessionTemplate.selectList("restaurent.selectRestaurent", memberId));
	}
	
	
	//id, pw로 정보 뽑기
	public account_memberVO selectMemberPw(account_memberVO vo) {
		account_memberVO vo1 = null;
		
		try {
			vo1 = sqlSessionTemplate.selectOne("account.selectMember", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo1;
	}
	
	//회원 정보 수정하기
	public void revisionInform(revision_VO vo, Model model, HttpSession session) {
		
		int i = 0;
		
		i = sqlSessionTemplate.update("account.updateInform", vo);
		
		if(i > 0) {
			account_memberVO account = new account_memberVO();
			account.setMemberId(vo.getNewId());
			//회원정보 수정 내용 업뎃
			account = sqlSessionTemplate.selectOne("account.selectMember", account);
			//세션 업뎃
			session.setAttribute("account", account);
			//수정 후 alertMSG
			model.addAttribute("alertMSG", "회원정보가 수정되었습니다.");
		}
		

	}
	//탈퇴 전 잔여예약 체크 로직
	public String selectRemainReservation(account_reservationVO vo, Model model1) {
		String alertMSG = "";
		
		//잔여 예약 확인
		account_reservationVO result = sqlSessionTemplate.selectOne("reservation.selectReservationList", vo);
		System.out.println("잔여예약체크 :"+result);
		
		if(result == null) {
			alertMSG = "탈퇴가능";
		}
		else {
			alertMSG = "잔여 예약이 존재해 탈퇴가 불가능 합니다.";
		}
		
		//alertMSG 반환
		return alertMSG;
		
	}
	//회원 탈퇴
	public String deleteMember(account_memberVO vo, Model model) {
		
		String alertMSG = "";
		
		try {
			//아이디로 회원 타입 체크
			account_faverVO memberId = new account_faverVO();
			memberId.setMemberId(vo.getMemberId());
			account_faverVO isFaver = (account_faverVO)sqlSessionTemplate.selectOne("account.selectFaver", memberId);
			
			System.out.println("isfaver? :"+isFaver);
			
			//탈퇴 전 잔여 예약 확인
			account_reservationVO vo1 = new account_reservationVO();
			if(isFaver == null) {
				vo1.setMemberOid(vo.getMemberId());
				System.out.println(vo1.getMemberOid());
			}
			else if(isFaver != null) {
				vo1.setMemberBid(vo.getMemberId());
				System.out.println(vo1.getMemberBid());
			}
			
			//today ~ today+14 사이 예약 존재시 탈퇴 불가
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String today = LocalDate.now(ZoneId.of("Asia/Seoul")).format(formatter);
			String last = LocalDate.now(ZoneId.of("Asia/Seoul")).plusDays(14).format(formatter);
			System.out.println(today);
			System.out.println(last);
			
			vo1.setReservationDate(today);
			vo1.setReservationDate2(last);
			
			//탈퇴 가능여부 메세지 받아오기
			alertMSG = selectRemainReservation(vo1, model);
			
			System.out.println("탈퇴가능합니까:"+alertMSG);
			
			if(!(alertMSG.equals("탈퇴가능"))) {
				//탈퇴 불가 메세지 VIEW로 SEND
				model.addAttribute("alertMSG", alertMSG);
			}
			else if(alertMSG.equals("탈퇴가능")){
				//탈퇴처리
				sqlSessionTemplate.update("account.deleteMember", vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return alertMSG;
	}
	
	//1:1문의 게시글 뽑기
	public void getQnaBbs(account_bbsVO vo, Model model) {
		
		model.addAttribute("qnaList", sqlSessionTemplate.selectList("account.selectBbs", vo));
	}
	
	//1:1게시글 수정시 정보 가져가기
	public void getQnaBbs2(int rowNum, account_bbsVO vo, Model model) {
		
		account_bbsVO vo1 = sqlSessionTemplate.selectOne("account.selectBbs2", rowNum);
		
		vo.setTitle(vo1.getTitle());
		vo.setContent(vo1.getContent());
		vo.setMemberId(vo1.getMemberId());
		vo.setBullet(vo1.getBullet());
		
		System.out.println(vo1.getBullet());
		System.out.println(vo1.getTitle());
		System.out.println(vo1.getMemberId());
	}
	
	//1:1게시글 수정제출
	public void updateQnaBbs(account_bbsVO vo) {
		sqlSessionTemplate.update("account.updateBbs", vo);
	}
	
	//1:1문의 게시글 가져오기
	public void getInform(HttpSession session, account_faverVO faver, account_faveeVO favee,  Model model) {
		String areYouFaver = checkType(session, faver, favee);
		model.addAttribute("areYouFaver", areYouFaver);
	}
	
	//1:1문의 게시글 추가
	public void insertAskBbs(@ModelAttribute("accountbbsVO") account_bbsVO vo) {
		sqlSessionTemplate.insert("account.insertBbs", vo);
	}
	
	//1:1게시글 삭제
	public void deletAskBbs(HttpSession session,  account_bbsVO vo, int rowNum) {
		account_memberVO getId = getSession(session);
		vo.setMemberId(getId.getMemberId());
		vo.setRowNum(rowNum);
		sqlSessionTemplate.delete("account.deleteBbs", vo);
	}
	
}
