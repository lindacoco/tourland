package com.yi.tourland.controller.mng;


import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yi.tourland.domain.PageMaker;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.BannerVO;
import com.yi.tourland.domain.mng.CouponVO;
import com.yi.tourland.domain.mng.EmployeeVO;
import com.yi.tourland.domain.mng.FaqVO;
import com.yi.tourland.domain.mng.HotelVO;
import com.yi.tourland.domain.mng.NoticeVO;
import com.yi.tourland.domain.mng.UserVO;
import com.yi.tourland.service.mng.BannerService;
import com.yi.tourland.service.mng.CouponService;
import com.yi.tourland.service.mng.EmployeeService;
import com.yi.tourland.service.mng.FaqService;
import com.yi.tourland.service.mng.HotelService;
import com.yi.tourland.service.mng.NoticeService;
import com.yi.tourland.service.mng.UserService;
import com.yi.tourland.util.UploadFileUtils;


@Controller
public class ManagerController {
	
	@Resource(name ="uploadPath") //서블릿컨텍스트의 id값과 일치해야함 
	private String uploadPath;
	
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
	HotelService hotelService;
	
	@Autowired
	BannerService bannerService;


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
	//팝업 
	
	//배너
	@RequestMapping(value = "bannerMngList", method = RequestMethod.GET)
	public String bannerMngList(SearchCriteria cri, Model model) throws Exception {
		List<BannerVO> bannerList = bannerService.listSearchCriteriaBanner(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(bannerService.totalSearchCountBanner(cri));
		
		
		model.addAttribute("cri", cri);
		model.addAttribute("list",bannerList);
	
		model.addAttribute("pageMaker", pageMaker);
		
		return "/manager/design/bannerMngList"; 
	}
	//배너 추가 버튼 눌렀을 때
	@RequestMapping(value = "bannerRegister",method = RequestMethod.GET)
	public String bannerRegister(SearchCriteria cri, Model model) throws Exception {
		List<BannerVO> bannerList = bannerService.listSearchCriteriaBanner(cri);
		int lastNo = bannerList.get(0).getNo();
		//	System.out.println(lastNo);
		model.addAttribute("autoNo",lastNo+1);
		
		return "/manager/design/bannerRegister"; 
	}
	//이미지 한개
	@RequestMapping(value = "bannerUpload", method = RequestMethod.POST)
	public String outUpResult(String content, MultipartFile file, HttpServletRequest request, Model model) throws IOException {

		String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());

	    model.addAttribute("test",content);
	    model.addAttribute("file",savedName);
	    model.addAttribute("Originfile",file.getOriginalFilename());
		
		return "outUploadFileResult";
	}
	
	// c드라이브에 있는 이미지에 대한 데이터를 직접 가져와야한다. ajax용으로 처리됨
	@ResponseBody
	@RequestMapping(value="displayFile", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String filename){
		ResponseEntity<byte[]> entity = null;
		
		//System.out.println("displayFile-----------"+ filename);
		InputStream in = null;
		try {
			in = new FileInputStream(uploadPath+filename); //파일개체는 오류처리하라고..
			String format = filename.substring(filename.lastIndexOf(".")+1); //파일 확장자 뽑아내기 점 빼고
		     MediaType mType = null;
			
			if(format.equalsIgnoreCase("png")) {
				mType = MediaType.IMAGE_PNG;
			}else if(format.equalsIgnoreCase("jpg")|| format.equalsIgnoreCase("jpeg")) {
				mType = MediaType.IMAGE_JPEG;
			}else if(format.equalsIgnoreCase("GIF")) {
				mType = MediaType.IMAGE_GIF;
			}
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(mType);
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers ,HttpStatus.OK);
		    
			
			in.close();
		    
		    
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	

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

	
	//호텔관리
	@RequestMapping(value="hotelMngList", method=RequestMethod.GET)
	public String hotelListPage(SearchCriteria cri, Model model) throws Exception { 
		List<HotelVO> list = hotelService.listCriteriaHotel(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(hotelService.totalCountHotel());
		
		model.addAttribute("cri",cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());

		return "/manager/hotel/hotelMngList"; 
	}

	// 장바구니


}