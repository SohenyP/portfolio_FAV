package project.pack.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.pack.service.IReservationService;
import project.pack.service.JMyPageService;
import project.pack.vo.account_couponVO;
import project.pack.vo.account_reservationVO;
@Controller
public class IReservationController {

	@Autowired
	IReservationService service;
	
	@Autowired
	JMyPageService service2;

	// 예약페이지 이동
	@PostMapping("/reservation")
	public String reservation(HttpSession session, @ModelAttribute("reservationVO") account_reservationVO vo, Model model) {

		// 로그인여부따라 path
		String path = "";

		path = service.toReservation(session, vo, model);

		return path;
	}
	
	//예약 제출 페이지
	@PostMapping("/reservationSubmit")
	public String reservationSubmit(HttpServletRequest request, HttpSession session, @ModelAttribute("reservationVO") account_reservationVO vo, Model model) {
		
		String coupon = request.getParameter("couponName");
		System.out.println("사용쿠폰이름 : "+coupon);
		
		String path = service.insertReservationList(session, vo, coupon, model);
		
		return path;
	}
	
	//결제완료 페이지
	@GetMapping("/paymentDone")
	public String paymentDone(@RequestParam("status") String status, @RequestParam("reservationNum") String reservationNum, account_reservationVO vo) {
		
		//status = '결제완료'
		service.updateStatus(status, reservationNum, vo);
		
		return "i_reservation_result";
	}
	
}
