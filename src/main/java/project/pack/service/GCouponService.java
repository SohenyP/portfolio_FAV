package project.pack.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import project.pack.vo.account_couponVO;
import project.pack.vo.account_faveeVO;
import project.pack.vo.account_faverVO;
import project.pack.vo.account_memberVO;
import project.pack.vo.coupon_bbsVO;
import project.pack.vo.coupon_listVO;
import project.pack.vo.restaurent_canidateVO;
import project.pack.vo.restaurent_voteVO;

@Service
public class GCouponService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	account_memberVO member;

	@Autowired
	account_faverVO faver;

	@Autowired
	account_faveeVO favee;

	@Autowired
	account_couponVO coupon;

	//쿠폰 정보 뽑기
	public void selectCoupon(Model model, String rowNum) {
		model.addAttribute("couponInform", sqlSessionTemplate.selectOne("coupon.selectCouponList", rowNum));
	}

	//쿠폰 발급
	public void insertCoupon(
			HttpSession session, 
			Model model, 
			@ModelAttribute("couponInform") coupon_listVO vo,
			int num,
			coupon_bbsVO vo1) {

		String alertMSG = "";

		try {
			//세션에서 아이디 뽑기
			member = (account_memberVO) session.getAttribute("account");
			String sessionId = member.getMemberId();

			// 아이디로 회원 타입 구분 : memberId
			faver.setMemberId(sessionId);
			favee.setMemberId(sessionId);

			account_faverVO isfaver = sqlSessionTemplate.selectOne("account.selectFaver", faver);
			account_faveeVO isfavee = sqlSessionTemplate.selectOne("account.selectFavee", favee);
			System.out.println("faver : " + isfaver);
			System.out.println("favee : " + isfavee);

			//점주 회원 불가
			if (isfaver == null && isfavee != null) {
				// alertMSG 전달
				alertMSG = "FAVER 전용 쿠폰입니다.";
			}
			//일반 회원 가능
			else if (isfaver != null && isfavee == null) {

				// account_memberVO에서 뽑은 정보 coupon_listVO 담기
				coupon.setMemberId(sessionId);
				coupon.setCouponNum(vo.getCouponNum());
				coupon.setCouponName(vo.getCouponName());
				coupon.setCouponDC(vo.getCouponDC());
				coupon.setCouponMax(vo.getCouponMax());
				coupon.setCouponExpire(vo.getCouponExpire());

				//위 coupon으로 쿠폰 중복 수령 체크
				account_couponVO hasCoupon = sqlSessionTemplate.selectOne("coupon.selectCouponFaver", coupon);
				
				String msg1 = "쿠폰이 발급되었습니다. 마이페이지에서 확인하세요.";
				String msg2 = "가입일로부터 30일이 지나 다운받을 수 없습니다.";
				String msg3 = "투표 후 발급 가능합니다.";
				String msg4 = "게시글 작성 후 발급 가능 합니다.";

				// 쿠폰 중복 수령 확인
				if (hasCoupon == null) {
					// rowNum으로 쿠폰 종류 확인
					//쿠폰1
					if (vo.getRowNum().equals("1")) {
						sqlSessionTemplate.insert("coupon.insertCouponList", coupon);
						alertMSG = msg1;
						
					} 
					//쿠폰2 : 가입일 체크해 발급
					else if (vo.getRowNum().equals("2")) {

						String joinDate = isfaver.getJoinDate();
						long elapse = elapseChk(joinDate);

						if (elapse > 30) {
							alertMSG = msg2;
							
						} else if (elapse <= 30) {
							sqlSessionTemplate.insert("coupon.insertCouponList", coupon);
							alertMSG = msg1;
						}
					}

					//쿠폰3 : 투표 여부 체크 후 발급
					else if (vo.getRowNum().equals("3")) {
						
						String voted = selectDoubleVote(session);
						
						if (voted.equals("N")) {
							alertMSG = msg3;
						} else if (voted.equals("Y")) {
							alertMSG = msg1;
							sqlSessionTemplate.insert("coupon.insertCouponList", coupon);
						}
					}

					//쿠폰 4 : 게시글 작성 여부 체크 후 발급
					else if (vo.getRowNum().equals("4")) {
						if(selectBbsMember(session, vo1).equals("발급불가")) {
							alertMSG = msg4;
							selectCouponBbs(model, num);
						}
						else if (selectBbsMember(session, vo1).equals("발급가능")) {
							alertMSG = msg1;
							sqlSessionTemplate.insert("coupon.insertCouponList", coupon);
							selectCouponBbs(model, num);
						}
					}

					//쿠폰 5 : 중복 체크만 하면 발급 가능
					else if (vo.getRowNum().equals("5")) {
						sqlSessionTemplate.insert("coupon.insertCouponList", coupon);
						alertMSG = msg1;
					}

				} else {
					//중복 수령시 
					alertMSG = "이미 받으신 쿠폰입니다.";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("alertMSG", alertMSG);
	}

	// 쿠폰 2: 가입일 중복체크
	public long elapseChk(String joinDate) {

		long elapse = 0;

		try {
			// 오늘날짜 - 가입일 > 30 체크
			SimpleDateFormat formatToDate = new SimpleDateFormat("yyyy-MM-dd");
			String today = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date());
			Date todayIs = formatToDate.parse(today);
			Date join = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).parse(joinDate);

			System.out.println("오늘: " + todayIs);
			System.out.println("가입일 : " + join);

			elapse = (todayIs.getTime() - join.getTime()) / (24 * 60 * 60 * 1000);
			System.out.println("가입일 - 오늘 : " + elapse);
			return elapse;

		} catch (Exception e) {
			e.printStackTrace();
			elapse = 30;
			return elapse;
		}

	}

	// 쿠폰 3 : 후보자 가져오기 
	public void selectVoteList(Model model) {
		try {
			model.addAttribute("voteList", sqlSessionTemplate.selectList("vote.selectCandidate"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 쿠폰 3 : 중복 투표 체크 
	public String selectDoubleVote(HttpSession session) {

		String voted = "";

		try {

			member = (account_memberVO) session.getAttribute("account");

			if (member != null) {
				String sessionId = member.getMemberId();
				restaurent_voteVO doubleVote = sqlSessionTemplate.selectOne("vote.selectDoubleVote", sessionId);

				if (doubleVote == null) {
					voted = "N";
				} else {
					voted = "Y";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return voted;
	}

	// 쿠폰 3 : 투표 하기
	public String updateVote(restaurent_canidateVO candi, restaurent_voteVO vote, HttpSession session) {

		String path = "";

		try {
			// 세션 아이디 가져오기
			member = (account_memberVO) session.getAttribute("account");

			if (member != null) {

				String sessionId = member.getMemberId();

				// 후보자 번호로 투표
				int candiNum = candi.getCandiNum();
				candi = sqlSessionTemplate.selectOne("vote.selectCandidate", candiNum);

				// 투표 후 득표수 업데이트 및 투표자 vote에 담기
				vote.setCandidate(candi.getCandidate());
				vote.setMemberId(sessionId);

				int i = 0;
				
				//중복 투표 체크 후 
				if (selectDoubleVote(session).equals("N")) {
					//vote에 들어간 득표와 투표자 넣어 insert
					i = sqlSessionTemplate.insert("vote.insertVote", vote);
					System.out.println("i:" + i);
					//vote_Result view에서 표시할 집계 업데이트
					sqlSessionTemplate.update("vote.updateVoteResult", vote);

					path = "redirect:/coupon?rowNum=3";

				}

			} else if (member == null) {
				path = "redirect:/login";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return path;
	}
	
	//쿠폰 4 : 게시글 가져가기 및 페이징 
	public void selectCouponBbs(Model model, int num) {
		//페이지당 보여줄 게시글 숫자
		int count = sqlSessionTemplate.selectOne("couponbbs.selectCouponBbsCount");
		//페이지 범위
		int total = (count/5)+((count%5==0)? 0:1);
		//페이지 범위 최초숫자
		int minBlock = (((num-1)/5)*5)+1;
		//페이지 범위 최후숫자
		int maxBlock = (((num-1)/5)+1)*5;
		
		coupon_bbsVO vo = new coupon_bbsVO();
		//페이징 처리시 첫 게시글 num설정
		vo.setStart((num -1)*vo.getCount());
		
		//삭제되지 않은 게시글만 가져가기
		vo.setIsdelete("N");
		model.addAttribute("bbsList", sqlSessionTemplate.selectList("couponbbs.selectCouponBbs", vo));
		
		//view단으로 설정 가져가기
		model.addAttribute("num", num);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("minBlock", minBlock);
		model.addAttribute("maxBlock", maxBlock);
	
	}
	
	//쿠폰 4 : 게시글 추가
	public void insertBbsPost(@ModelAttribute("couponbbsVO") coupon_bbsVO vo) {
		sqlSessionTemplate.insert("couponbbs.insertBbs", vo);
	}
	
	//쿠폰 4 : 게시글 등록 확인
	private String selectBbsMember(HttpSession session, coupon_bbsVO vo) {
		String result = "";
		
		member = (account_memberVO)session.getAttribute("account");
		vo.setMemberId(member.getMemberId()); 
		
		//발급 전 게시글 등록 여부 체크
		if(sqlSessionTemplate.selectList("couponbbs.selectCouponBbs", vo).isEmpty()) {
			result = "발급불가";
		}
		else {
			result = "발급가능";
		}
		System.out.println(result);
		return result;
	}
	
	//쿠폰4 : 게시글 수정하기
	public void updateBbsPost(coupon_bbsVO vo) {
		//url param 받아온 정보 삽입

		System.out.println(vo.getNum());
		System.out.println(vo.getBulletPoint());
		System.out.println(vo.getContent());
		System.out.println(vo.getTitle());
		System.out.println(vo.getMemberId());
		
		sqlSessionTemplate.update("couponbbs.updateBbs", vo);
		
	}
	
	//쿠폰4 : 게시글 삭제하기
	public void deleteBbsPost(coupon_bbsVO vo) {
		
		sqlSessionTemplate.delete("couponbbs.deleteBbs", vo);
	}
	
}
