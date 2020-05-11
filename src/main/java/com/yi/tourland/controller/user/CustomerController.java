package com.yi.tourland.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.tourland.domain.mng.PopupVO;
import com.yi.tourland.service.mng.BannerService;
import com.yi.tourland.service.mng.CouponService;
import com.yi.tourland.service.mng.CustBoardService;
import com.yi.tourland.service.mng.EmployeeService;
import com.yi.tourland.service.mng.FaqService;
import com.yi.tourland.service.mng.FlightService;
import com.yi.tourland.service.mng.HotelService;
import com.yi.tourland.service.mng.NoticeService;
import com.yi.tourland.service.mng.PopupService;
import com.yi.tourland.service.mng.RentcarService;
import com.yi.tourland.service.mng.TourService;
import com.yi.tourland.service.mng.UserService;

@Controller
public class CustomerController {
	@Resource(name = "uploadPath") // 서블릿컨텍스트의 id값과 일치해야함
	private String uploadPath; // c:/tourland/upload
	
	@Resource(name = "uploadPath2")
	private String uploadPathPopup; // c:/tourland/upload/popup

	@Autowired
	private TourService tourService;
	@Autowired
	private FaqService faqService;

	@Autowired
	NoticeService noticeService;

	@Autowired
	CustBoardService custBoardService;

	@Autowired
	CouponService couponService;

	@Autowired
	EmployeeService employeeService;

	@Autowired
	UserService userService;

	@Autowired
	HotelService hotelService;
	
	@Autowired
	PopupService popupService;

	@Autowired
	BannerService bannerService;

	@Autowired
	FlightService flightService;

	@Autowired
	RentcarService rentcarService;
	
	
	//메인
	@RequestMapping(value="tourlandMain", method=RequestMethod.GET)
	public String tourlandMain(Model model, HttpServletResponse response) throws Exception {
		//팝업 불러오기

	    PopupVO popup1 = popupService.setPopup("R");
		if(popup1 != null) {
	
			long settingDays = (popup1.getEnddate().getTime()- popup1.getStartdate().getTime());
			long settingDays2 = Math.abs(settingDays/(24*60*60*1000));
			Cookie cookie = new Cookie("popup1", popup1.getPic());
			cookie.setPath("/");
			cookie.setMaxAge((int)(settingDays2*24*60*60));
			response.addCookie(cookie);
			
			model.addAttribute("popup1",popup1.getPic());
		}
		PopupVO popup2 = popupService.setPopup("L");
		if(popup2 != null) {
			long settingDays = (popup2.getEnddate().getTime()- popup2.getStartdate().getTime());
			long settingDays2 = Math.abs(settingDays/(24*60*60*1000));
			Cookie cookie = new Cookie("popup2", popup2.getPic());
			cookie.setPath("/");
			cookie.setMaxAge((int)(settingDays2*24*60*60));
			response.addCookie(cookie);
			
			model.addAttribute("popup2",popup2.getPic());
		}
		
		return "/user/tourlandMain"; 
	}
	//마이 페이지 - 내 정보 수정
	@RequestMapping(value="tourlandMyInfoEdit", method=RequestMethod.GET)
	public String tourlandMyInfoEdit() { 
		return "/user/mypage/tourlandMyInfoEdit"; 
	}
	//마이 페이지 - 내 예약 현황
	@RequestMapping(value="tourlandMyReserv", method=RequestMethod.GET)
	public String tourlandMyReserv() { 
		return "/user/mypage/tourlandMyReserv"; 
	}
	//마이 페이지 - 내 예약 현황
	@RequestMapping(value="tourlandMyWishes", method=RequestMethod.GET)
	public String tourlandMyWishes() { 
		return "/user/mypage/tourlandMyWishes"; 
	}
	//마이 페이지 - 내 쿠폰
	@RequestMapping(value="tourlandMyCoupon", method=RequestMethod.GET)
	public String tourlandMyCoupon() { 
		return "/user/mypage/tourlandMyCoupon"; 
	}
	
	//상품 세부 정보    
	@RequestMapping(value="tourlandProductDetail", method=RequestMethod.GET)
	public String tourlandProductDetail() { 
		return "/user/product/tourlandProductDetail"; 
	}
}
