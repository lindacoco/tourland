package com.yi.tourland.controller.user;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yi.tourland.domain.PageMaker;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.BannerVO;
import com.yi.tourland.domain.mng.CustBoardVO;
import com.yi.tourland.domain.mng.EmployeeVO;
import com.yi.tourland.domain.mng.EventVO;
import com.yi.tourland.domain.mng.FaqVO;
import com.yi.tourland.domain.mng.NoticeVO;
import com.yi.tourland.domain.mng.PlanBoardVO;
import com.yi.tourland.domain.mng.PopupVO;
import com.yi.tourland.domain.mng.ProductVO;
import com.yi.tourland.domain.mng.UserVO;
import com.yi.tourland.service.mng.BannerService;
import com.yi.tourland.service.mng.CouponService;
import com.yi.tourland.service.mng.CustBoardService;
import com.yi.tourland.service.mng.EmployeeService;
import com.yi.tourland.service.mng.EventService;
import com.yi.tourland.service.mng.FaqService;
import com.yi.tourland.service.mng.FlightService;
import com.yi.tourland.service.mng.HotelService;
import com.yi.tourland.service.mng.NoticeService;
import com.yi.tourland.service.mng.PlanBoardService;
import com.yi.tourland.service.mng.PopupService;
import com.yi.tourland.service.mng.ProductService;
import com.yi.tourland.service.mng.RentcarService;
import com.yi.tourland.service.mng.TourService;
import com.yi.tourland.service.mng.UserService;

@Controller
public class CustomerController {
	
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
	EventService eventService;
	
	@Autowired
	PopupService popupService;

	@Autowired
	BannerService bannerService;

	@Autowired
	FlightService flightService;

	@Autowired
	RentcarService rentcarService;
	
	@Autowired
	private ProductService productService;

	@Autowired
	PlanBoardService planBoardService;
		
	
	//메인
	@RequestMapping(value="tourlandMain", method=RequestMethod.GET)
	public String tourlandMain(Model model, HttpServletResponse response) throws Exception {
		
	//팝업 불러오기
	    PopupVO popup1 = popupService.setPopup("L");
		if(popup1 != null) {
	
			long settingDays = (popup1.getEnddate().getTime()- popup1.getStartdate().getTime());
			long settingDays2 = Math.abs(settingDays/(24*60*60*1000));
			Cookie cookie = new Cookie("popup1", popup1.getPic());
			cookie.setPath("/");
			cookie.setMaxAge((int)(settingDays2*24*60*60));
			response.addCookie(cookie);
			
			model.addAttribute("popup1",popup1.getPic());
		}
		PopupVO popup2 = popupService.setPopup("R");
		if(popup2 != null) {
			long settingDays = (popup2.getEnddate().getTime()- popup2.getStartdate().getTime());
			long settingDays2 = Math.abs(settingDays/(24*60*60*1000));
			Cookie cookie = new Cookie("popup2", popup2.getPic());
			cookie.setPath("/");
			cookie.setMaxAge((int)(settingDays2*24*60*60));
			response.addCookie(cookie);
			
			model.addAttribute("popup2",popup2.getPic());
		}
		
	//배너 불러오기
		BannerVO banner1 = bannerService.setBanner("L");
		if(banner1 != null) {
			model.addAttribute("banner1",banner1);
		}
		BannerVO banner2 = bannerService.setBanner("R");
		if(banner2 != null) {
			model.addAttribute("banner2",banner2);
		}
		return "/user/tourlandMain"; 
	}
	
	//투어랜드 회원가입
	@RequestMapping(value="tourlandRegister", method=RequestMethod.GET)
	public String tourlandRegister(SearchCriteria cri, UserVO vo, Model model) { 
		int lastNo = 0;
		int lastNo2 = 0;
		try {
			List<UserVO> userList = userService.listSearchCriteriaUser(cri, 0);
			List<UserVO> secessuserList = userService.listSearchCriteriaUser(cri, 1);

			lastNo = userList.get(0).getUserno();
			lastNo2 = secessuserList.get(0).getUserno();
			if (lastNo > lastNo2) {
				model.addAttribute("autoNo", lastNo + 1);
			} else {
				model.addAttribute("autoNo", lastNo2 + 1);
			}

		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return "/user/tourlandRegisterForm"; 
	}
	
	@RequestMapping(value = "tourlandRegister", method = RequestMethod.POST)
	public String tourlandRegisterPost(UserVO vo, RedirectAttributes rattr) throws Exception {
		try{
			userService.insertUser(vo);
			rattr.addFlashAttribute("registerSuccess","aa");
		}catch (Exception e) {
		
		}
		return "redirect:loginForm"; 
	}
	
	// 아이디 존재유무 체크
		@ResponseBody
		@RequestMapping(value = "idCheck/{empid}", method = RequestMethod.GET)
		public ResponseEntity<String> checkEmpId(@PathVariable("empid") String empid) {

			ResponseEntity<String> entity = null;

			try {
				EmployeeVO voForIdCheck = employeeService.readByIdEmployee(empid);
				UserVO voForIdCheck2 = userService.readByIdUser(empid); // 유저 테이블에서 아이디로 검색
				if (voForIdCheck != null || voForIdCheck2 != null) {
					entity = new ResponseEntity<String>("exist", HttpStatus.OK);
				}
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST); // 400에러
			}
			return entity;
		}
	
	
	//마이페이지의 비밀번호 확인
	@RequestMapping(value="EditPassword", method=RequestMethod.GET) 
	public String tourlandEditPassword() throws Exception { 
		return "/user/mypage/tourlandMyInfoEditPassword"; 
	}
	
//	@RequestMapping(value="EditPassword", method=RequestMethod.POST) 
//	public String EditPasswordCheck(String checkPass, UserVO userVO, EmployeeVO empVO, Model model) throws Exception { 
//		
//		UserVO dbUserId = userService.readByIdUser(userVO.getUserid());
//
//		EmployeeVO dbEmpId = employeeService.readByIdEmployee(empVO.getEmpid());
//		
//		System.out.println(dbUserId);
//		System.out.println(dbUserId.getUserpass());
//		System.out.println(checkPass);
//		if(dbEmpId !=null) {
//			if(dbEmpId.getEmppass().equals(checkPass)==false) {
//				model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
//			}
//		}
//		if(dbUserId!=null) {
//			if(dbUserId.getUserpass().equals(checkPass)==false){
//				model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
//			}
//		}
//		return "redirect:/tourlandMyInfoEdit";
//	}
	
	//비밀번호 확인 되었을때 나타나는곳 현서때문에 이렇게 함
	@ResponseBody
	@RequestMapping(value = "EditPasswordCheck/{totalId}", method = RequestMethod.GET)
	public ResponseEntity<String> EditPasswordCheck(@PathVariable("totalId") String totalId,String checkPass,Model model) {
		ResponseEntity<String> entity = null;

		try {
			UserVO dbUserId = userService.readByIdUser(totalId);
			EmployeeVO dbEmpId = employeeService.readByIdEmployee(totalId);
			EmployeeVO dbEmp = employeeService.readByIdPwEmployee(totalId,checkPass);
			UserVO dbUser = userService.readByIdPwUser(totalId,checkPass); // 유저 테이블에서 아이디로 검색
			if(dbEmpId!=null) {
				if(dbEmp==null) {
						entity = new ResponseEntity<String>("NoPass", HttpStatus.OK);
				}
			}
			if(dbUserId!=null) {
				if(dbUser==null) {
						entity = new ResponseEntity<String>("NoPass", HttpStatus.OK);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST); // 400에러
		}
		
		return entity;
	}
	
		
	//마이 페이지-내정보수정에서 보이는 개인정보
	@RequestMapping(value="tourlandMyInfoEdit", method=RequestMethod.GET) 
	public String tourlandMyInfoEdit() throws Exception { 
		return "/user/mypage/tourlandMyInfoEdit"; 
	}
	//마이 페이지 - 내정보수정에서 수정 후 수정버튼을 눌릴때 받을곳
	@RequestMapping(value="editProfile", method=RequestMethod.POST) 
	public String tourlandEditProfile() throws Exception { 
		
		
		return "/user/mypage/tourlandMyInfoEdit"; 
	}
	
	//마이 페이지 - 탈퇴버튼 눌리는 경우
	@RequestMapping(value="logoutWithdrawal",method = RequestMethod.GET)
	public String logoutWithdrawal(String id,UserVO vo,HttpSession session) throws Exception{
		vo = userService.readByIdUser(id);
		vo.setUsersecess(1);
		userService.updateUser(vo);
		session.invalidate();
		return "redirect:/";
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
	//상품 리스트   (제주 패키지)
	@RequestMapping(value="tourlandProductKRList", method=RequestMethod.GET)
	public String tourlandProductKRList(SearchCriteria cri,Model model) throws SQLException {
		List<ProductVO> list = productService.productListPageByDomestic(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(productService.totalCountBySearchProductDomestic(cri));
		model.addAttribute("list",list);
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("cri",cri);
		model.addAttribute("count",productService.totalCountBySearchProductDomestic(cri));
		return "/user/product/tourlandProductKRList"; 
	}	
	//상품 리스트   (일본 패키지)
	@RequestMapping(value="tourlandProductJPList", method=RequestMethod.GET)
	public String tourlandProductJPList() { 
		return "/user/product/tourlandProductJPList"; 
	}	
	//상품 세부 정보    
	@RequestMapping(value="tourlandProductDetail", method=RequestMethod.GET)
	public String tourlandProductDetail(SearchCriteria cri,ProductVO vo,Model model) throws SQLException {
		vo = productService.productByNo(vo);
		model.addAttribute("cri",cri);
		model.addAttribute("vo",vo);
		return "/user/product/tourlandProductDetail"; 
	}
	
	//이벤트 --------------------------------------------------------------------------------------
	@RequestMapping(value="tourlandEventList/{times}", method=RequestMethod.GET)
	public String tourlandEventList(@PathVariable("times") String times, Model model) { 
		String aaaaa= "";
				
		if(times.equals("ingEvent")) {
			List<EventVO> list = eventService.eventListDependsTime(times);
			model.addAttribute("eventList",list);
			aaaaa= "inging";
			model.addAttribute("mistyrose",aaaaa);
		}
		if(times.equals("commingEvent")) {
			List<EventVO> list = eventService.eventListDependsTime(times);
			model.addAttribute("eventList",list);
			aaaaa= "comecome";
			model.addAttribute("mistyrose",aaaaa);
		}
		if(times.equals("expiredEvent")) {
			List<EventVO> list = eventService.eventListDependsTime(times);
			model.addAttribute("eventList",list);
			aaaaa= "donedone";
			model.addAttribute("mistyrose",aaaaa);
		}
		
		
		return "/user/event/eventList"; 
	}
	
	//이벤트 상세 페이지
	 @RequestMapping(value = "eventDetailPage", method = RequestMethod.GET)
		public String eventDetailPage(int no, SearchCriteria cri, Model model) throws Exception {
		 EventVO vo = eventService.readByNoEvent(no);
			model.addAttribute("eventVO", vo);
			model.addAttribute("cri", cri);

			return "/user/event/eventDetailPage";
		}
	
	
	//게시판 ---------------------------------------------------------------------------------------
	
	//공지사항
	@RequestMapping(value="tourlandBoardNotice", method=RequestMethod.GET)
	public String tourlandBoardNotice(SearchCriteria cri, Model model) throws Exception { 
		List<NoticeVO> noticeList = noticeService.noticeList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(noticeService.totalCountNotice(cri));
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
		return "/user/board/tourlandBoardNotice"; 
	}
	
	// 공지사항 상세페이지
		@RequestMapping(value = "tourlandBoardNoticeDetail", method = RequestMethod.GET)
		public String tourlandBoardNoticeDetail(int no, SearchCriteria cri, Model model) throws Exception {
			NoticeVO notice = noticeService.readNoticeByNo(no);
			model.addAttribute("notice", notice);
			model.addAttribute("cri", cri);
			return "/user/board/tourlandBoardNoticeDetail";
		}
	
	//FAQ
	@RequestMapping(value="tourlandBoardFAQ", method=RequestMethod.GET)
	public String tourlandBoardFAQ(SearchCriteria cri, Model model) throws SQLException {
		cri.setPerPageNum(7);
		List<FaqVO> list = faqService.listPage(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(faqService.totalCount(cri) < 10 ? 10 : faqService.totalCount(cri));
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
		return "/user/board/tourlandBoardFAQ"; 
	}
	
	//고객의 소리
	@RequestMapping(value="tourlandCustBoard", method=RequestMethod.GET)
	public String tourlandCustBoard(SearchCriteria cri, Model model) throws Exception { 
		cri.setPerPageNum(5);
		List<CustBoardVO> custBoardList = custBoardService.listSearchCriteriaCustBoard(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(custBoardService.totalSearchCountCustBoard(cri));

		model.addAttribute("cri", cri);
		model.addAttribute("list", custBoardList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "/user/board/tourlandCustBoard"; 
	}
	@RequestMapping(value = "tourlandCustBoardDetail", method = RequestMethod.GET)
	public String tourlandCustBoardDetail(int no, SearchCriteria cri, Model model) throws Exception {
		CustBoardVO vo = custBoardService.readByNoCustBoard(no);

		model.addAttribute("custBoardVO", vo);
		model.addAttribute("cri", cri);

		return "/user/board/tourlandCustBoardDetail";
	}
	
	
	//상품문의 사항
	@RequestMapping(value="tourlandProductBoard", method=RequestMethod.GET)
	public String tourlandProductBoard(SearchCriteria cri, Model model) throws Exception { 
		List<PlanBoardVO> list = planBoardService.listSearchCriteriaPlanBoard(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(planBoardService.totalSearchCountPlanBoard(cri) < 10 ? 10 : planBoardService.totalSearchCountPlanBoard(cri));
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
		return "/user/board/tourlandProductBoard"; 
	}
	
	@RequestMapping(value = "tourlandProductBoardDetail", method = RequestMethod.GET)
	public String tourlandProductBoardDetail(PlanBoardVO vo, SearchCriteria cri, Model model) throws Exception {
		vo = planBoardService.readByVoPlanBoard(vo);
		model.addAttribute("plan", vo);
		model.addAttribute("cri", cri);
		return "/user/board/tourlandProductBoardDetail";
	}

	
	//Footer
	//찾아 오시는 길
	@RequestMapping(value="tourlandMap", method=RequestMethod.GET)
	public String tourlandMap() { 
		return "/user/footer/tourlandMap"; 
	}
	
	@RequestMapping(value="tourlandAgreement", method=RequestMethod.GET)
	public String tourlandAgreement() { 
		return "/user/footer/tourlandAgreement"; 
	}
	
	//회사소개
	@RequestMapping(value="tourlandIntroduce", method=RequestMethod.GET)
	public String tourlandIntroduce() { 
		return "/user/footer/tourlandIntroduce"; 
	}
	
	//제휴페이지
	@RequestMapping(value="tourlandAdvertising", method=RequestMethod.GET)
	public String tourlandAdvertising() { 
		return "/user/footer/tourlandAdvertising"; 
	}

}
