package com.yi.tourland.controller.user;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

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

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.EmployeeVO;
import com.yi.tourland.domain.mng.PopupVO;
import com.yi.tourland.domain.mng.UserVO;
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
	//상품 리스트   (일본 패키지)
	@RequestMapping(value="tourlandProductJPList", method=RequestMethod.GET)
	public String tourlandProductJPList() { 
		return "/user/product/tourlandProductJPList"; 
	}	
	//상품 세부 정보    
	@RequestMapping(value="tourlandProductDetail", method=RequestMethod.GET)
	public String tourlandProductDetail() { 
		return "/user/product/tourlandProductDetail"; 
	}
}
