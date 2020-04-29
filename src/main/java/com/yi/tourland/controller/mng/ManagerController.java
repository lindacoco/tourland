package com.yi.tourland.controller.mng;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManagerController {
	
		//예약관리
		@RequestMapping(value="reservMngList", method=RequestMethod.GET)
		public String reservMngList() { 
			return "/manager/reservation/reservationMngList"; 
		}
		
		//항공 추가 폼
		@RequestMapping(value="addFlightForm", method=RequestMethod.GET)
		public String addFlightForm() { 
			return "/manager/flight/addFlightForm"; 
		}
		
		//직원관리리스트
		@RequestMapping(value="empMngList", method=RequestMethod.GET)
		public String empMngList() { 
			return "/manager/employee/empMngList"; 
		}
		//고객관리리스트
		@RequestMapping(value="userMngList", method=RequestMethod.GET)
		public String custMngList() { 
			return "/manager/user/custMngList"; 
		}
		
		//예약관리
		@RequestMapping(value="reservationMgnList", method=RequestMethod.GET)
		public String reservationMgnList() { 
			return "/manager/reservation/reservationMngList"; 
		}
		
		//상품관리
		@RequestMapping(value="addProductForm", method=RequestMethod.GET)
		public String addProductForm() { 
			return "/manager/product/addProductForm"; 
		}
		
		//이벤트관리
		
		
		//게시판관리
		
		//FAQ 관리
		@RequestMapping(value="FAQMngList", method=RequestMethod.GET)
		public String FAQMngList() { 
			return "/manager/board/FAQMngList"; 
		}
		
		
		
		
		//디자인관리
		
		
		//공지사항 관리
		@RequestMapping(value="noticeMngList", method=RequestMethod.GET)
		public String noticeMngList() { 
			return "/manager/notice/noticeMngList"; 
		}
		
		//쿠폰관리
		@RequestMapping(value="couponMngList", method=RequestMethod.GET)
		public String couponMngList() { 
			return "/manager/coupon/couponMngList"; 
		}
		
		//장바구니
		
		
}
