package project.pack.service;

import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import project.pack.vo.account_couponVO;
import project.pack.vo.account_memberVO;
import project.pack.vo.account_reservationVO;
import project.pack.vo.restaurent_listVO;

@Service
public class IReservationService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	JMyPageService service2;
	
	//예약하기 : 로그인 정보 있는 회원 한정
	public String toReservation(HttpSession session, account_reservationVO vo, Model model) {
		
		String path = "";
		
		account_memberVO logined = (account_memberVO)session.getAttribute("account");
		
		if(logined != null) {
			System.out.println(logined.getMemberContact());
			
			//로그인 정보 있으면, 사용가능 쿠폰 가져오기
			account_couponVO couponList = new account_couponVO();
			couponList.setMemberId(logined.getMemberId());
			couponList.setIsExpire("N");
			service2.selectCouponList(couponList, model);
			
			path = "i_reservation";
			
		}
		else {
			path = "redirect:/login";
		}
		
		return path; 
	}
	
	//예약 하기
	public String insertReservationList(HttpSession session, account_reservationVO vo, String coupon, Model model) {
		
		String path = "";
				
		try {
			//세션 id = Bid 예약고객
			account_memberVO vo1 = (account_memberVO)session.getAttribute("account");
			vo.setMemberBid(vo1.getMemberId());
			
			//restaurentVO에서 Oid = 점주
			restaurent_listVO vo2 = new restaurent_listVO();
			vo2.setRestauName(vo.getRestauName());
			vo2 = sqlSessionTemplate.selectOne("restaurent.selectRestaurent", vo2);
			vo.setMemberOid(vo2.getMemberId());
			
			//예약 날짜
			vo.setReservationDate(new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date()));
			
			//예약번호 만들기(예약날짜+전화+예약시간)
			LocalTime now = LocalTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmm");
			String formatedNow = now.format(formatter);

			String reservationNum = vo.getReservationDate().replace("-", "")+vo.getMemberContact()+formatedNow;
			vo.setReservationNum(reservationNum);

			model.addAttribute("reservationNum", reservationNum);

			
			//db에 예약 추가
			int i = 0;
			i = sqlSessionTemplate.insert("reservation.insertReservationList", vo);
			System.out.println("예약완료면 1 : "+i);
			
			//예약 추가 됐다면
			if(i > 0) {
				//쿠폰 사용처리
				account_couponVO expireCoupon = new account_couponVO();
				expireCoupon.setIsExpire("Y");
				expireCoupon.setMemberId(vo1.getMemberId());
				expireCoupon.setCouponName(coupon);
				sqlSessionTemplate.update("coupon.updateCouponExpire", expireCoupon);
				
				//예약 후 결제페이지
				path = "i_reservation_payment";
			}
			else {
				//예약 불발시 예약페이지 재이동
				path = "redirct:/reservation";
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return path;
	}
	
	//결제 상태 변경
	public void updateStatus(String status, String reservationNum, account_reservationVO vo) {
		System.out.println("num : "+reservationNum);
		System.out.println("status : "+status);
		
		vo.setReservationNum(reservationNum);
		vo.setStatus(status);
		
		sqlSessionTemplate.update("reservation.updateStatus", vo);
	}

	
}
