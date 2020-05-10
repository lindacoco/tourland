package com.yi.tourland.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String tourlandMain(Model model, HttpServletRequest request) throws Exception {
		//팝업 불러오기
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(int i =0; i<cookies.length; i++) {
				Cookie coo = cookies[i];
				if(coo.getName().equals("popup1")) {
					model.addAttribute("popup1",coo.getValue());
					System.out.println("팝1"+coo.getValue());
				}if(coo.getName().equals("popup2")) {
					model.addAttribute("popup2",coo.getValue());
					System.out.println(coo.getValue());
				}	
			}
		}
		return "/user/tourlandMain"; 
	}
	//마이 페이지 - 내 정보 수정
	@RequestMapping(value="tourlandMyInfoEdit", method=RequestMethod.GET)
	public String tourlandMyInfoEdit() { 
		return "/user/tourlandMyInfoEdit"; 
	}
	//마이 페이지 - 내 예약 현황
	@RequestMapping(value="tourlandMyReserv", method=RequestMethod.GET)
	public String tourlandMyReserv() { 
		return "/user/tourlandMyReserv"; 
	}
}
