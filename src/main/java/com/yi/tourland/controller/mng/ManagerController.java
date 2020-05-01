package com.yi.tourland.controller.mng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.tourland.domain.PageMaker;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.EmployeeVO;
import com.yi.tourland.domain.mng.UserVO;
import com.yi.tourland.service.mng.EmployeeService;
import com.yi.tourland.service.mng.UserService;

@Controller
public class ManagerController {
	
	@Autowired
	EmployeeService employeeService;
	@Autowired
	UserService userService;
	
	
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
		public String empMngList(SearchCriteria cri, Model model) throws Exception { 
			List<EmployeeVO> empList = employeeService.listSearchCriteriaEmployee(cri, 0);
			

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(employeeService.totalSearchCountEmployee(cri,0));
			
			model.addAttribute("cri", cri);
			model.addAttribute("list",empList);
			model.addAttribute("pageMaker", pageMaker);
			
			return "/manager/employee/empMngList"; 
		}
		//고객관리리스트
		@RequestMapping(value="userMngList", method=RequestMethod.GET)
		public String custMngList(SearchCriteria cri, Model model) throws Exception { 
			List<UserVO> userList = userService.listSearchCriteriaUser(cri, 0);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(userService.totalSearchCountUser(cri, 0));
			
			model.addAttribute("cri", cri);
			model.addAttribute("list",userList);
			model.addAttribute("pageMaker", pageMaker);
			
			return "/manager/user/userMngList"; 
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
