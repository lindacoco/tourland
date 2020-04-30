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
import com.yi.tourland.domain.mng.CouponVO;
import com.yi.tourland.domain.mng.FaqVO;
import com.yi.tourland.domain.mng.NoticeVO;
import com.yi.tourland.service.mng.CouponService;
import com.yi.tourland.service.mng.FaqService;
import com.yi.tourland.service.mng.NoticeService;

@Controller
public class ManagerController {
	@Autowired
	private FaqService faqService;

	@Autowired
	NoticeService noticeService;

	@Autowired
	CouponService couponService;

	// 예약관리
	@RequestMapping(value = "reservMngList", method = RequestMethod.GET)
	public String reservMngList() {
		return "/manager/reservation/reservationMngList";
	}

	// 항공 추가 폼
	@RequestMapping(value = "addFlightForm", method = RequestMethod.GET)
	public String addFlightForm() {
		return "/manager/flight/addFlightForm";
	}

	// 직원관리리스트
	@RequestMapping(value = "empMngList", method = RequestMethod.GET)
	public String empMngList() {
		return "/manager/employee/empMngList";
	}

	// 고객관리리스트
	@RequestMapping(value = "userMngList", method = RequestMethod.GET)
	public String custMngList() {
		return "/manager/user/custMngList";
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
		model.addAttribute("page", cri.getPage());
		return "/manager/board/FAQMngList";
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

	// 장바구니

}
