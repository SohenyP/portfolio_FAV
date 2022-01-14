package project.pack.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.pack.service.GCouponService;
import project.pack.vo.coupon_bbsVO;
import project.pack.vo.coupon_listVO;
import project.pack.vo.restaurent_canidateVO;
import project.pack.vo.restaurent_voteVO;

@Controller
public class GCouponController {

	@Autowired
	GCouponService service;

	// 쿠폰 페이지 이동 및 기본 설정
	@GetMapping("/coupon")
	public String coupon(
			@RequestParam(defaultValue = "") String rowNum, 
			@RequestParam(defaultValue = "1") int num,
			Model model, 
			HttpSession session,
			@ModelAttribute("couponbbsVO") coupon_bbsVO vo) {

		// 쿠폰 메인 페이지
		if (rowNum != "") {
			service.selectCoupon(model, rowNum);
		}
		// 쿠폰 3 페이지
		if (rowNum.equals("3")) {
			service.selectVoteList(model);
			model.addAttribute("voted", service.selectDoubleVote(session));
			
			if(service.selectDoubleVote(session) == "Y") {
				service.selectVoteList(model);
				rowNum = "3_result";
			}
		}
		
		//쿠폰 4 페이지
		if(rowNum.equals("4")) {
			service.selectCouponBbs(model, num);
		}

		return "g_couponEvent" + rowNum;
	}

	//쿠폰 받기
	@GetMapping("/getCoupon")
	public String getCoupon(
			HttpSession session, 
			Model model, 
			@ModelAttribute("couponInform") coupon_listVO vo, 
			@ModelAttribute("couponbbsVO") coupon_bbsVO vo1,
			@RequestParam(defaultValue = "1") int num) {
		String path = "";
		
		System.out.println("rowNum :" + vo.getRowNum());
		
		service.insertCoupon(session, model, vo, num, vo1);
		
		if (vo.getRowNum().equals("3")) {
			service.selectVoteList(model);
			//쿠폰3: 이미 투표한 사람은 result 페이지만 보도록
			if(service.selectDoubleVote(session) == "Y") {
				path = "_result";
			}
		}

		return "g_couponEvent" + vo.getRowNum()+path;
	}

	//쿠폰3 : 투표하기
	@GetMapping("/vote")
	public String vote(Model model, restaurent_canidateVO candi, restaurent_voteVO vote, HttpSession session) {

		String path = "";

		//투표 가불에 따라 path설정
		path = service.updateVote(candi, vote, session);
		service.selectVoteList(model);

		return path;
	}
	
	
	//쿠폰4 : 게시글 추가
	@GetMapping("/insertBbs")
	public String insertBbs(@ModelAttribute("couponbbsVO") coupon_bbsVO vo) {
		
		service.insertBbsPost(vo);
		
		return "redirect:/coupon?rowNum=4&num=1";
	}
	
	
	//쿠폰4 : 게시글 수정
	@GetMapping("/updateBbs")
	public String updateBbs(coupon_bbsVO vo) {
		
		service.updateBbsPost(vo);
		
		return "redirect:/coupon?rowNum=4";
	}
	
	//쿠폰4 : 게시글 삭제
	@GetMapping("/deleteBbs")
	public String deleteBbs(coupon_bbsVO vo) {
		
		service.deleteBbsPost(vo);

		return "redirect:/coupon?rowNum=4";
		
	}
	

}
