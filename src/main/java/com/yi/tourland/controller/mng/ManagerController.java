package com.yi.tourland.controller.mng;


import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.tourland.domain.PageMaker;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.AirplaneVO;
import com.yi.tourland.domain.mng.CouponVO;
import com.yi.tourland.domain.mng.EmployeeVO;
import com.yi.tourland.domain.mng.FaqVO;
import com.yi.tourland.domain.mng.NoticeVO;
import com.yi.tourland.domain.mng.UserVO;
import com.yi.tourland.service.mng.CouponService;
import com.yi.tourland.service.mng.EmployeeService;
import com.yi.tourland.service.mng.FaqService;
import com.yi.tourland.service.mng.FlightService;
import com.yi.tourland.service.mng.NoticeService;
import com.yi.tourland.service.mng.UserService;

@Controller
public class ManagerController {
	@Autowired
	private FaqService faqService;

	@Autowired
	NoticeService noticeService;

	@Autowired
	CouponService couponService;
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	FlightService flightService;

	// 예약관리
	@RequestMapping(value = "reservMngList", method = RequestMethod.GET)
	public String reservMngList(SearchCriteria cri, Model model) {
		return "/manager/reservation/reservationMngList";
	}
	
	//항공 관리
	@RequestMapping(value = "flightMngList", method = RequestMethod.GET)
	public String flightMngList(SearchCriteria cri, Model model) throws Exception {
		List<AirplaneVO> flightList = flightService.airplaneList(cri);   
		PageMaker pageMaker = new PageMaker();  
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(flightService.totalCountAirplane(cri));
		model.addAttribute("flightList", flightList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);    
		return "/manager/flight/flightMngList";
	}
	    
	// 항공 추가 폼
	@RequestMapping(value = "addFlightForm", method = RequestMethod.GET)
	public String addFlightForm() {
		return "/manager/flight/addFlightForm";
	}
	// 항공 추가 폼       
	@RequestMapping(value = "addFlightForm", method = RequestMethod.POST)
	public String addFlightResult() {
		return "flightMngList";
	}      

	// 직원관리리스트
	@RequestMapping(value = "empMngList", method = RequestMethod.GET)
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

	// 고객관리리스트
	@RequestMapping(value = "userMngList", method = RequestMethod.GET)
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

	// 예약관리
	@RequestMapping(value = "reservationMgnList", method = RequestMethod.GET)
	public String reservationMgnList() {
		return "/manager/reservation/reservationMngList";
	}

	// 상품관리
	@RequestMapping(value = "addProductForm", method = RequestMethod.GET)
	public String addProductForm() {
		return "/manager/product/addProductForm";
	}

	// 이벤트관리

	// 게시판관리

	// FAQ 관리
	@RequestMapping(value = "FAQMngList", method = RequestMethod.GET)
	public String FAQMngList(SearchCriteria cri, Model model) throws SQLException {
		List<FaqVO> list = faqService.listPage(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(faqService.totalCount(cri) < 10 ? 10 : faqService.totalCount(cri));
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri",cri);
		model.addAttribute("page", cri.getPage());
		return "/manager/board/FAQMngList";
	}
	@RequestMapping(value = "FAQRegister", method = RequestMethod.GET)
	public String FAQResgiterGet() throws SQLException {
		return "/manager/board/FAQRegister";
	}
	@RequestMapping(value = "FAQRegister", method = RequestMethod.POST)
	public String FAQResgiterPost(FaqVO vo) throws SQLException {
		faqService.insertFAQ(vo);
		return "redirect:FAQMngList";
	}
	@RequestMapping(value = "FAQDetail", method = RequestMethod.GET)
	public String FAQDetail(FaqVO vo,SearchCriteria cri,Model model) throws SQLException {
		vo = faqService.selectFAQByNo(vo);
		model.addAttribute("faq",vo);
		model.addAttribute("cri",cri);
		return "/manager/board/FAQDetail";
	}
	@RequestMapping(value = "FAQModify", method = RequestMethod.GET)
	public String FAQModifyGet(FaqVO vo,SearchCriteria cri,Model model) throws SQLException {
		vo = faqService.selectFAQByNo(vo);
		model.addAttribute("faq",vo);
		model.addAttribute("cri",cri);
		return "/manager/board/FAQModify";
	}
	@RequestMapping(value = "FAQModify", method = RequestMethod.POST)
	public String FAQModifyPost(FaqVO vo,SearchCriteria cri,Model model) throws SQLException {
		faqService.updateFAQ(vo);
		model.addAttribute("cri",cri);
		return "redirect:FAQMngList";
	}
	@RequestMapping(value = "FAQDelete", method = RequestMethod.GET)
	public String FAQDelete(FaqVO vo,SearchCriteria cri,Model model) throws SQLException {
		faqService.deleteFAQ(vo);
		model.addAttribute("cri",cri);
		return "redirect:FAQMngList";
	}
	// 디자인관리

	// 공지사항 관리
	@RequestMapping(value = "noticeMngList", method = RequestMethod.GET)
	public String noticeMngList(SearchCriteria cri, Model model) throws Exception {
		List<NoticeVO> noticeList = noticeService.noticeList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(noticeService.totalCountNotice(cri));
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
		return "/manager/notice/noticeMngList";
	}
	//공지사항 추가
	@RequestMapping(value="addNoticeForm", method=RequestMethod.GET)
	public String addNoticeForm(Model model) throws Exception{
		SearchCriteria cri = new SearchCriteria();
		int total = noticeService.totalCountNotice(cri);
		int totalCnt = total+1;
		model.addAttribute("totalCnt", totalCnt);
		return "/manager/notice/addNoticeForm";
	}
	//공지사항 상세페이지
	@RequestMapping(value="noticeDetail", method=RequestMethod.GET)
	public String noticeDetail(int no,SearchCriteria cri, Model model) throws Exception{
		NoticeVO notice = noticeService.readNoticeByNo(no);
		model.addAttribute("notice", notice);
		model.addAttribute("cri", cri);
		return "/manager/notice/noticeDetail";
	}
	
	//공지사항 삭제
		@RequestMapping(value = "removeNotice", method = RequestMethod.GET)
		public String removeNotice(int no, SearchCriteria cri, Model model) throws Exception {
			noticeService.removeNotice(no);
			model.addAttribute("cri",cri);
			return "redirect:/noticeMngList";
		}
	
	
	@RequestMapping(value="addNoticeForm", method=RequestMethod.POST)
	public String addNoticeResult(NoticeVO notice, Model model) throws Exception{
		System.out.println(notice);
		noticeService.addNotice(notice);
		return "redirect:/noticeMngList";
	}

	// 쿠폰관리
	@RequestMapping(value = "couponMngList", method = RequestMethod.GET)
	public String couponMngList(SearchCriteria cri, Model model) throws Exception {
		List<CouponVO> couponList = couponService.couponList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(couponService.totalCountNotice(cri));
		model.addAttribute("couponList", couponList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
		return "/manager/coupon/couponMngList";
	}

	
	//호텔관리
	@RequestMapping(value="hotelManager", method=RequestMethod.GET)
	public String hotelManager() { 
		return "/manager/hotel/hotelMngList"; 
	}

	// 장바구니


}