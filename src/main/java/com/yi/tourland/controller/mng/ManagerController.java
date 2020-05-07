package com.yi.tourland.controller.mng;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yi.tourland.domain.PageMaker;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.AirplaneVO;
import com.yi.tourland.domain.mng.BannerVO;
import com.yi.tourland.domain.mng.CouponVO;
import com.yi.tourland.domain.mng.CustBoardVO;
import com.yi.tourland.domain.mng.DataListVO;
import com.yi.tourland.domain.mng.EmployeeVO;
import com.yi.tourland.domain.mng.FaqVO;
import com.yi.tourland.domain.mng.HotelVO;
import com.yi.tourland.domain.mng.NoticeVO;
import com.yi.tourland.domain.mng.RentcarVO;
import com.yi.tourland.domain.mng.TourVO;
import com.yi.tourland.domain.mng.UserVO;
import com.yi.tourland.service.mng.BannerService;
import com.yi.tourland.service.mng.CouponService;
import com.yi.tourland.service.mng.CustBoardService;
import com.yi.tourland.service.mng.EmployeeService;
import com.yi.tourland.service.mng.FaqService;
import com.yi.tourland.service.mng.FlightService;
import com.yi.tourland.service.mng.HotelService;
import com.yi.tourland.service.mng.NoticeService;
import com.yi.tourland.service.mng.RentcarService;
import com.yi.tourland.service.mng.TourService;
import com.yi.tourland.service.mng.UserService;
import com.yi.tourland.util.UploadFileUtils;

@Controller
public class ManagerController {

	@Resource(name = "uploadPath") // 서블릿컨텍스트의 id값과 일치해야함
	private String uploadPath; // c:/tourland/upload/

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
	BannerService bannerService;

	@Autowired
	FlightService flightService;

	@Autowired
	RentcarService rentcarService;

	// 예약관리
	@RequestMapping(value = "reservMngList", method = RequestMethod.GET)
	public String reservMngList(SearchCriteria cri, Model model) {
		return "/manager/reservation/reservationMngList";
	}

	// 항공 관리
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
	public String addFlightForm(Model model) throws Exception {
		SearchCriteria cri = new SearchCriteria();
		//항공기번호 세팅
		int dbNo = flightService.totalCountAirplane(cri);
		//출발편 번호
		int no = dbNo +1;
		//도착편 번호
		int nextNo = dbNo+2;
		model.addAttribute("airTotalCnt",no);
		model.addAttribute("airTotalNextCnt",nextNo);
		return "/manager/flight/addFlightForm2";
	}

	// 항공 추가 폼
	@RequestMapping(value = "addFlightForm", method = RequestMethod.POST)
	public String addFlightResult(DataListVO list) throws Exception {
		for(AirplaneVO a : list.getList()) {
			flightService.addAirplane(a);
		}
		
		return "redirect:/flightMngList";
	}


	// 직원관리리스트
	@RequestMapping(value = "empMngList/{empretired}", method = RequestMethod.GET)
	public String empMngList(SearchCriteria cri, Model model, @PathVariable("empretired") int empretired)
			throws Exception {

		List<EmployeeVO> empList = employeeService.listSearchCriteriaEmployee(cri, empretired);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(employeeService.totalSearchCountEmployee(cri, empretired));

		model.addAttribute("cri", cri);
		model.addAttribute("list", empList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("empretired", empretired);

		// 같은 페이지를 공유하기에 버튼이름 변경을 위한 model값 선언
		if (empretired == 1) {
			model.addAttribute("btnName", "근무사원 리스트");
		} else {
			model.addAttribute("btnName", "퇴사사원 조회");
		}

		return "/manager/employee/empMngList";
	}

	// 사원 추가
	@RequestMapping(value = "employeeRegister", method = RequestMethod.GET)
	public String employeeRegisterGet(SearchCriteria cri, Model model) {
		int lastNo = 0;
		int lastNo2 = 0;

		try {
			List<EmployeeVO> empList = employeeService.listSearchCriteriaEmployee(cri, 0);
			List<EmployeeVO> retiredEmpList = employeeService.listSearchCriteriaEmployee(cri, 1);

			lastNo = empList.get(0).getEmpno();
			lastNo2 = retiredEmpList.get(0).getEmpno();

			if (lastNo > lastNo2) {
				model.addAttribute("autoNo", lastNo + 1);
			} else {
				model.addAttribute("autoNo", lastNo2 + 1);
			}

		} catch (Exception e) {
			e.printStackTrace();
			// 퇴사 사원이 없는 경우 오류가 뜨기에 시범 데이터 입력
		}

		return "/manager/employee/empRegisterForm";
	}

	@RequestMapping(value = "employeeRegister", method = RequestMethod.POST)
	public String employeeRegisterPost(EmployeeVO vo) throws Exception {

		employeeService.insertEmployee(vo);
		return "redirect:empMngList/0";
	}

	// 아이디 존재유무 체크
	@ResponseBody
	@RequestMapping(value = "empIdCheck/{empid}", method = RequestMethod.GET)
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

	// 사원 리스트 클릭했을 때 자세한 정보 보기로 넘어가기
	@RequestMapping(value = "employeeDetail/{empretired}", method = RequestMethod.GET)
	public String employeeDetail(EmployeeVO vo, SearchCriteria cri, Model model,
			@PathVariable("empretired") int empretired) throws Exception {
		vo = employeeService.readByNoEmployee(vo.getEmpno());
		model.addAttribute("empVO", vo);
		// System.out.println(vo); //퇴사사원 null로 찍혀서 mapper수정
		model.addAttribute("cri", cri);
		model.addAttribute("empretired", empretired);
		return "/manager/employee/empDetailForm";
	}

	// 사원 디테일 페이지에서 수정 버튼 눌렀을 때 수정 처리
	@RequestMapping(value = "employeeUpdate/{empretired}", method = RequestMethod.POST)
	public String employeeUpdate(EmployeeVO vo, SearchCriteria cri, Model model,
			@PathVariable("empretired") int empretired) throws Exception {
		employeeService.updateEmployee(vo);
		// System.out.println(vo);
		model.addAttribute("empVO", vo);
		model.addAttribute("cri", cri);
		model.addAttribute("empretired", empretired);
		return "redirect:/employeeDetail/" + empretired + "?empno=" + vo.getEmpno() + "&page=" + cri.getPage()
				+ "&searchType=" + cri.getSearchType() + "&keyword=" + cri.getKeyword();
	}

	// 사원 논리 삭제(퇴사처리) 및 완전 삭제(정보삭제)
	@RequestMapping(value = "employeeDelete/{empretired}/{empno}", method = RequestMethod.GET)
	public String employeeDelete(SearchCriteria cri, Model model, @PathVariable("empretired") int empretired,
			@PathVariable("empno") int empno) throws Exception {
		EmployeeVO vo = employeeService.readByNoEmployee(empno);
		// System.out.println(vo);
		if (empretired == 0) { // 근무사원이라면
			vo.setEmpretired(1); // 퇴사 사원 처리
			employeeService.updateEmployee(vo);
		} else {
			employeeService.deleteEmployee(vo.getEmpno()); // 완전 삭제
		}

		return "redirect:/empMngList/" + empretired + "?page=" + cri.getPage() + "&searchType=" + cri.getSearchType()
				+ "&keyword=" + cri.getKeyword();
	}

	// 고객관리리스트
	@RequestMapping(value = "userMngList/{usersecess}", method = RequestMethod.GET)
	public String custMngList(SearchCriteria cri, Model model, @PathVariable("usersecess") int usersecess)
			throws Exception {
		List<UserVO> userList = userService.listSearchCriteriaUser(cri, usersecess);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(userService.totalSearchCountUser(cri, usersecess));

		model.addAttribute("cri", cri);
		model.addAttribute("list", userList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("usersecess", usersecess);

		// 같은 페이지를 공유하기에 버튼이름 변경을 위한 model값 선언
		if (usersecess == 1) { // 탈퇴회원일 경우
			model.addAttribute("btnName", "회원 리스트");
		} else {
			model.addAttribute("btnName", "탈퇴회원 조회");
		}

		return "/manager/user/userMngList";
	}

	@RequestMapping(value = "userRegister", method = RequestMethod.GET)
	public String userRegister(SearchCriteria cri, UserVO vo, Model model) throws Exception {
		int lastNo = 0;
		int lastNo2 = 0;
		try {
			List<UserVO> userList = userService.listSearchCriteriaUser(cri, 0);
			List<UserVO> secessuserList = userService.listSearchCriteriaUser(cri, 1);

			lastNo = userList.get(0).getUserno();
			lastNo2 = secessuserList.get(0).getUserno();

//			System.out.println(lastNo);
//			System.out.println(lastNo2);
			if (lastNo > lastNo2) {
				model.addAttribute("autoNo", lastNo + 1);
			} else {
				model.addAttribute("autoNo", lastNo2 + 1);
			}

		} catch (Exception e) {
			e.printStackTrace();
			// 퇴사 사원이 없는 경우 오류가 뜨기에 시범 데이터 입력
		}
		return "/manager/user/userRegister";
	}


	// 고객 리스트 클릭했을 때 자세한 정보 보기로 넘어가기
	@RequestMapping(value = "userDetailForm/{usersecess}", method = RequestMethod.GET)
	public String userDetailForm(int no, SearchCriteria cri, Model model, @PathVariable("usersecess") int usersecess) throws Exception {
		UserVO vo = userService.readByNoUser(no);
		System.out.println(vo);
		model.addAttribute("userVO", vo);
		model.addAttribute("cri", cri);
		model.addAttribute("usersecess", usersecess);
		return "/manager/user/userDetailForm";
	}

	@RequestMapping(value = "userRegister", method = RequestMethod.POST)
	public String userRegisterPost(UserVO vo) throws Exception {
        System.out.println(vo);
		userService.insertUser(vo);
		return "redirect:userMngList/0";
	}

	// 예약관리
	@RequestMapping(value = "reservationMgnList", method = RequestMethod.GET)
	public String reservationMgnList() {
		return "/manager/reservation/reservationMngList";
	}

	// 상품관리
	@RequestMapping(value = "addProductForm", method = RequestMethod.GET)
	public String addProductFormGet(SearchCriteria cri, Model model) throws Exception {
		List<AirplaneVO> flightListDepature = flightService.airplaneListByDepature(cri);
		List<AirplaneVO> flightListRending = flightService.airplaneListByRending(cri);
		List<HotelVO> hotelList = hotelService.listSearchHotel(cri);
		List<TourVO> tourList = tourService.listPage(cri);
		List<RentcarVO> rentcarList = rentcarService.listSearchCriteriaRentcar(cri);
		PageMaker pageMakerByFlightDepature = new PageMaker();
		pageMakerByFlightDepature.setCri(cri);
		pageMakerByFlightDepature.setTotalCount(flightService.totalCountAirplaneByDepature(cri));
		PageMaker pageMakerByFlightRending = new PageMaker();
		pageMakerByFlightRending.setCri(cri);
		pageMakerByFlightRending.setTotalCount(flightService.totalCountAirplaneByRending(cri));
		PageMaker pageMakerByHotel = new PageMaker();
		pageMakerByHotel.setCri(cri);
		pageMakerByHotel.setTotalCount(hotelService.totalSearchCountHotel(cri));
		PageMaker pageMakerByTour = new PageMaker();
		pageMakerByTour.setCri(cri);
		pageMakerByTour.setTotalCount(tourService.totalCountBySearchCriteria(cri));
		PageMaker pageMakerByRentcar = new PageMaker();
		pageMakerByRentcar.setCri(cri);
		pageMakerByRentcar.setTotalCount(rentcarService.totalSearchCountRentcar(cri));
		model.addAttribute("flightListDepature",flightListDepature);
		model.addAttribute("pageMakerByFlightDepature",pageMakerByFlightDepature);
		model.addAttribute("flightListRending",flightListRending);
		model.addAttribute("pageMakerByFlightRending",pageMakerByFlightRending);
		model.addAttribute("hotelList",hotelList);
		model.addAttribute("pageMakerByHotel",pageMakerByHotel);
		model.addAttribute("tourList",tourList);
		model.addAttribute("pageMakerByTour",pageMakerByTour);
		model.addAttribute("rentcarList",rentcarList);
		model.addAttribute("pageMakerByRentcar",pageMakerByRentcar);
		return "/manager/product/addProductForm";
	}

	@RequestMapping(value = "addProductForm", method = RequestMethod.POST)
	public String addProductFormPost() {
		return "redirect:productMgnList";
	}

	@ResponseBody
	@RequestMapping(value = "flightList", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> flightList(String div, SearchCriteria cri, Model model) {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<>();
		if (div.equals("Depature")) {
			try {
				List<AirplaneVO> flightList = flightService.airplaneListByDepature(cri);
				PageMaker pageMaker = new PageMaker();
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(flightService.totalCountAirplaneByDepature(cri));
				map.put("list", flightList);
				map.put("pageMaker", pageMaker);
				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.BAD_REQUEST);
			}
		} else if (div.equals("Rending")) {
			try {
				List<AirplaneVO> flightList = flightService.airplaneListByRending(cri);
				PageMaker pageMaker = new PageMaker();
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(flightService.totalCountAirplaneByRending(cri));
				map.put("list", flightList);
				map.put("pageMaker", pageMaker);
				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.BAD_REQUEST);
			}
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "flightList/{no}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> flightList(@PathVariable("no") int no, AirplaneVO vo, Model model) {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<>();
		try {
			vo.setNo(no);
			vo = flightService.airplaneByNo(vo);
			map.put("vo", vo);
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	@ResponseBody
	@RequestMapping(value = "hotelList", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> hotelList(SearchCriteria cri, Model model) {
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String,Object> map = new HashMap<>();
		try {
			List<HotelVO> hotelList = hotelService.listSearchHotel(cri);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(hotelService.totalSearchCountHotel(cri));
			map.put("list", hotelList);
			map.put("pageMaker", pageMaker);
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		}
		catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@ResponseBody
	@RequestMapping(value = "hotelList/{no}", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> hotelList(@PathVariable("no") int no,HotelVO vo, Model model) {
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String,Object> map = new HashMap<>();
		try {
			vo.setNo(no);
			vo = hotelService.readHotel(vo);
			map.put("vo", vo);
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		}
		catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	@ResponseBody
	@RequestMapping(value = "tourList", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> tourList(SearchCriteria cri, Model model) {
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String,Object> map = new HashMap<>();
		try {
			List<TourVO> tourList = tourService.listPage(cri);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(tourService.totalCountBySearchCriteria(cri));
			map.put("list", tourList);
			map.put("pageMaker", pageMaker);
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		}
		catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@ResponseBody
	@RequestMapping(value = "tourList/{no}", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> tourList(@PathVariable("no") int no,TourVO vo, Model model) {
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String,Object> map = new HashMap<>();
		try {
			vo.setNo(no);
			vo = tourService.selectTourByNo(vo);
			map.put("vo", vo);
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		}
		catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	@ResponseBody
	@RequestMapping(value = "rentList", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> rentList(SearchCriteria cri, Model model) {
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String,Object> map = new HashMap<>();
		try {
			List<RentcarVO> rentList = rentcarService.listSearchCriteriaRentcar(cri);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(rentcarService.totalSearchCountRentcar(cri));
			map.put("list", rentList);
			map.put("pageMaker", pageMaker);
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		}
		catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@ResponseBody
	@RequestMapping(value = "rentList/{no}", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> rentList(@PathVariable("no") int no,RentcarVO vo, Model model) {
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String,Object> map = new HashMap<>();
		try {
			vo.setNo(no);
			vo = rentcarService.readByNo(no);
			map.put("vo", vo);
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		}
		catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	// 현지 투어 관리
	@RequestMapping(value = "tourMngList", method = RequestMethod.GET)
	public String tourMngList(SearchCriteria cri, Model model) throws SQLException {
		List<TourVO> list = tourService.listPage(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(
				tourService.totalCountBySearchCriteria(cri) < 10 ? 10 : tourService.totalCountBySearchCriteria(cri));
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
		model.addAttribute("page", cri.getPage());
		return "/manager/tour/tourMngList";
	}

	@RequestMapping(value = "tourRegister", method = RequestMethod.GET)
	public String tourRegisterGet(Model model) throws SQLException {
		int no = tourService.totalCount();
		model.addAttribute("no", no);
		return "/manager/tour/tourRegister";
	}

	@RequestMapping(value = "tourRegister", method = RequestMethod.POST)
	public String tourRegisterPost(TourVO vo, Model model) throws SQLException {
		tourService.insertTour(vo);
		return "redirect:tourMngList";
	}

	@RequestMapping(value = "tourDetail", method = RequestMethod.GET)
	public String tourDetail(TourVO vo, SearchCriteria cri, Model model) throws SQLException {
		vo = tourService.selectTourByNo(vo);
		model.addAttribute("tour", vo);
		model.addAttribute("cri", cri);
		return "/manager/tour/tourDetail";
	}

	@RequestMapping(value = "tourModify", method = RequestMethod.GET)
	public String tourModifyGet(TourVO vo, SearchCriteria cri, Model model) throws SQLException {
		vo = tourService.selectTourByNo(vo);
		model.addAttribute("tour", vo);
		model.addAttribute("cri", cri);
		return "/manager/tour/tourModify";
	}

	@RequestMapping(value = "tourModify", method = RequestMethod.POST)
	public String tourModifyPost(TourVO vo, SearchCriteria cri) throws SQLException {
		tourService.updateTour(vo);
		return "redirect:tourDetail?no=" + vo.getNo() + "&page=" + cri.getPage() + "&searchType=" + cri.getSearchType()
				+ "&searchType2=" + cri.getSearchType2() + "&keyword=" + cri.getKeyword();
	}

	@RequestMapping(value = "tourDelete", method = RequestMethod.GET)
	public String tourDelete(TourVO vo, SearchCriteria cri, Model model) throws SQLException {
		tourService.deleteTour(vo);
		return "redirect:tourMngList?page=" + cri.getPage() + "&searchType=" + cri.getSearchType() + "&searchType2="
				+ cri.getSearchType2() + "&keyword=" + cri.getKeyword();
	}

	// 렌트카 상품 관리
	@RequestMapping(value = "rentcarMngList", method = RequestMethod.GET)
	public String rentcarMngList(SearchCriteria cri, Model model) throws Exception {
		List<RentcarVO> rentcarList = rentcarService.listSearchCriteriaRentcar(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(rentcarService.totalSearchCountRentcar(cri));

		model.addAttribute("cri", cri);
		model.addAttribute("list", rentcarList);
		model.addAttribute("pageMaker", pageMaker);

		return "/manager/rentcar/rentcarMngList";
	}

	//렌트카 추가
	@RequestMapping(value = "rentcarRegister", method = RequestMethod.GET)
	public String rentcarRegister(SearchCriteria cri, Model model) {
		int lastNo =0;
		
		try{
			List<RentcarVO> rentcarList = rentcarService.listSearchCriteriaRentcar(cri);

		    
		    lastNo = rentcarList.get(0).getNo();
		
				model.addAttribute("autoNo",lastNo+1);
			
			
		}catch (Exception e) {
		    e.printStackTrace();
		    //퇴사 사원이 없는 경우 오류가 뜨기에 시범 데이터 입력 
		}
		
		return "/manager/rentcar/rentcarRegister";
	}
	//렌트카 상품 삭제
		@RequestMapping(value = "delRentcar", method = RequestMethod.GET)
		public String delRentcar(int no, SearchCriteria cri) throws Exception{
			rentcarService.deleteRentcar(no);
			return "redirect:/rentcarMngList?page="+cri.getPage()+"&searchType="+cri.getSearchType()+"&keyword="+cri.getKeyword();
		}

	// 이벤트관리

// 게시판관리 -------------------------------------------------------------------------------------------------------------------------

	// FAQ 관리
	@RequestMapping(value = "FAQMngList", method = RequestMethod.GET)
	public String FAQMngList(SearchCriteria cri, Model model) throws SQLException {
		List<FaqVO> list = faqService.listPage(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(faqService.totalCount(cri) < 10 ? 10 : faqService.totalCount(cri));
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
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
	public String FAQDetail(FaqVO vo, SearchCriteria cri, Model model) throws SQLException {
		vo = faqService.selectFAQByNo(vo);
		model.addAttribute("faq", vo);
		model.addAttribute("cri", cri);
		return "/manager/board/FAQDetail";
	}

	@RequestMapping(value = "FAQModify", method = RequestMethod.GET)
	public String FAQModifyGet(FaqVO vo, SearchCriteria cri, Model model) throws SQLException {
		vo = faqService.selectFAQByNo(vo);
		model.addAttribute("faq", vo);
		model.addAttribute("cri", cri);
		return "/manager/board/FAQModify";
	}

	@RequestMapping(value = "FAQModify", method = RequestMethod.POST)
	public String FAQModifyPost(FaqVO vo, SearchCriteria cri) throws SQLException {
		faqService.updateFAQ(vo);
		return "redirect:FAQDetail?no=" + vo.getNo() + "&page=" + cri.getPage() + "&searchType=" + cri.getSearchType()
				+ "&searchType2=" + cri.getSearchType2() + "&keyword=" + cri.getKeyword();
	}

	@RequestMapping(value = "FAQDelete", method = RequestMethod.GET)
	public String FAQDelete(FaqVO vo, SearchCriteria cri, Model model) throws SQLException {
		faqService.deleteFAQ(vo);
		return "redirect:FAQMngList?page=" + cri.getPage() + "&searchType=" + cri.getSearchType() + "&searchType2="
				+ cri.getSearchType2() + "&keyword=" + cri.getKeyword();
	}

	// 고객의 소리

	// 고객의 소리 리스트
	@RequestMapping(value = "custBoardMngList", method = RequestMethod.GET)
	public String custBoardMngList(SearchCriteria cri, Model model) throws Exception {

		List<CustBoardVO> custBoardList = custBoardService.listSearchCriteriaCustBoard(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(custBoardService.totalSearchCountCustBoard(cri));

		model.addAttribute("cri", cri);
		model.addAttribute("list", custBoardList);
		model.addAttribute("pageMaker", pageMaker);

		return "/manager/board/custBoardList";
	}

	// 고객의 소리 조회
	@RequestMapping(value = "custBoardDetail", method = RequestMethod.GET)
	public String custBoardDetail(int no, SearchCriteria cri, Model model) throws Exception {
		CustBoardVO vo = custBoardService.readByNoCustBoard(no);

		model.addAttribute("custBoardVO", vo);
		model.addAttribute("cri", cri);

		return "/manager/board/custBoardDetail";
	}

	// 고객의 소리 추가 버튼 눌렀을 때
	@RequestMapping(value = "custBoardRegister", method = RequestMethod.GET)
	public String custBoardRegister(SearchCriteria cri, Model model) {
		int lastNo = 0;
		try {
			List<CustBoardVO> custBoardList = custBoardService.listSearchCriteriaCustBoard(cri);
			lastNo = custBoardList.get(0).getNo() + 1;
		} catch (Exception e) {
			lastNo = 1;
		}

		model.addAttribute("autoNo", lastNo); // 가장 나중 번호로 자동세팅

		return "/manager/board/custBoardRegister";
	}

	// 고객의 소리 추가
	@RequestMapping(value = "custBoardRegister", method = RequestMethod.POST)
	public String custBoardRegisterPost(CustBoardVO vo, Model model) throws Exception {

		custBoardService.insertCustBoard(vo);

		return "redirect:/custBoardDetail?no=" + vo.getNo();
	}

	// 고객의 소리 업데이트- 고객글을 함부로 업데이트 하면 안되기 때문에 테스트용에 가까움
	@RequestMapping(value = "custBoardUpdate", method = RequestMethod.POST)
	public String custBoardUpdate(CustBoardVO vo, SearchCriteria cri, Model model) throws Exception {
		System.out.println(vo);
		custBoardService.updateCustBoard(vo);

		model.addAttribute("custBoardVO", vo);
		model.addAttribute("cri", cri);
		return "redirect:/custBoardDetail?no=" + vo.getNo() + "&page=" + cri.getPage() + "&searchType="
				+ cri.getSearchType() + "&keyword=" + cri.getKeyword();
	}

	// 고객의 소리 게시글 삭제
	@RequestMapping(value = "removeCustBoard", method = RequestMethod.GET)
	public String removeCustBoard(int no, SearchCriteria cri) throws Exception {
		custBoardService.deleteCustBoard(no);
		return "redirect:/custBoardMngList?page=" + cri.getPage() + "&searchType=" + cri.getSearchType() + "&keyword="
				+ cri.getKeyword();
	}

	// 상품문의 사항

// 디자인관리 ---------------------------------------------------------------------------------------------------------------

	// 팝업

	// 배너
	@RequestMapping(value = "bannerMngList", method = RequestMethod.GET)
	public String bannerMngList(SearchCriteria cri, Model model) throws Exception {

		List<BannerVO> bannerList = bannerService.listSearchCriteriaBanner(cri);

		String rightBanner = bannerList.get(1).getPic();
		String leftBanner = bannerList.get(0).getPic();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(bannerService.totalSearchCountBanner(cri));

		model.addAttribute("cri", cri);

		model.addAttribute("list", bannerList);

        //작은이미지는 앞에 s_달려있음
		model.addAttribute("list",bannerList);
		model.addAttribute("rightBanner",rightBanner);
		model.addAttribute("leftBanner",leftBanner);

		model.addAttribute("pageMaker", pageMaker);

		return "/manager/design/bannerMngList";
	}

	// 배너 추가 버튼 눌렀을 때
	@RequestMapping(value = "bannerRegister", method = RequestMethod.GET)
	public String bannerRegister(SearchCriteria cri, Model model) {
		int lastNo = 0;
		try {
			List<BannerVO> bannerList = bannerService.listSearchCriteriaBanner(cri);
			lastNo = bannerList.get(0).getNo() + 1;
		} catch (Exception e) {
			lastNo = 1;
		}

		model.addAttribute("autoNo", lastNo); // 가장 나중 번호로 자동세팅

		return "/manager/design/bannerRegister";
	}

	// 배너 이미지 한개 업로드
	@RequestMapping(value = "bannerRegister", method = RequestMethod.POST)
	public String bannerRegisterPost(BannerVO vo, MultipartFile bannerPic, Model model) throws Exception {

		String savedName = UploadFileUtils.uploadFile(uploadPath, bannerPic.getOriginalFilename(),
				bannerPic.getBytes());
		String bigSizePic = savedName.substring(0, 12) + savedName.substring(14);
		// 배너기 때문에 썸네일 아닌 이미지 파일 이름으로 디비에 저장

		vo.setPic(bigSizePic);
		bannerService.insertBanner(vo);
		return "redirect:/bannerMngList";
	}

	// c드라이브에 있는 이미지에 대한 데이터를 직접 가져와야한다. ajax용으로 처리됨
	@ResponseBody
	@RequestMapping(value = "displayFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String filename) {
		ResponseEntity<byte[]> entity = null;

		// System.out.println("displayFile-----------"+ filename);
		InputStream in = null;
		try {
			in = new FileInputStream(uploadPath + filename); // 파일개체는 오류처리하라고..
			String format = filename.substring(filename.lastIndexOf(".") + 1); // 파일 확장자 뽑아내기 점 빼고
			MediaType mType = null;

			if (format.equalsIgnoreCase("png")) {
				mType = MediaType.IMAGE_PNG;
			} else if (format.equalsIgnoreCase("jpg") || format.equalsIgnoreCase("jpeg")) {
				mType = MediaType.IMAGE_JPEG;
			} else if (format.equalsIgnoreCase("GIF")) {
				mType = MediaType.IMAGE_GIF;
			}
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(mType);

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);

			in.close();

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 배너 디테일 조회
	@RequestMapping(value = "bannerDetailForm", method = RequestMethod.GET)
	public String bannerDetailForm(int no, SearchCriteria cri, Model model) throws Exception {
		BannerVO vo = bannerService.readByNoBanner(no);

		model.addAttribute("bannerVO", vo);
		model.addAttribute("cri", cri);

		return "/manager/design/bannerDetailForm";
	}

	// 디테일 페이지이자 폼에서 업데이트를 하는 경우
	@RequestMapping(value = "bannerUpdate", method = RequestMethod.POST)
	public String bannerUpdate(BannerVO vo, MultipartFile bannerPic, Model model) throws Exception {

		if (bannerPic.getBytes().length != 0) { // 새로 첨부한 파일이 있다면
			// 원래 vo가 가진 pic의 네임으로 폴더에 저장된 사진들 지우기

			File bannerFile = new File(uploadPath + vo.getPic());
			bannerFile.delete();

			String smallSizePic = vo.getPic().substring(0, 12) + "s_" + vo.getPic().substring(12); // 썸네일용 사진도
			// System.out.println(smallSizePic);
			File bannerFile2 = new File(uploadPath + smallSizePic);
			bannerFile2.delete();

			// 수정 된 파일로 교체
			String savedName = UploadFileUtils.uploadFile(uploadPath, bannerPic.getOriginalFilename(),
					bannerPic.getBytes());
			String bigSizePic = savedName.substring(0, 12) + savedName.substring(14);
			// 배너기 때문에 썸네일 아닌 이미지 파일 이름으로 디비에 저장

			vo.setPic(bigSizePic);
		}
		bannerService.updateBanner(vo);

		return "redirect:/bannerDetailForm?no=" + vo.getNo();

	}

	// 배너 삭제
	@RequestMapping(value = "removeBanner", method = RequestMethod.GET)
	public String removeBanner(SearchCriteria cri, Model model, int no) throws Exception {
		BannerVO vo = bannerService.readByNoBanner(no);
		if (vo.getPic() != null) {
			// 폴더에 남은 사진들 먼저 지우기
			File bannerFile = new File(uploadPath + vo.getPic());
			bannerFile.delete();

			String smallSizePic = vo.getPic().substring(0, 12) + "s_" + vo.getPic().substring(12); // 썸네일용 사진도

			File bannerFile2 = new File(uploadPath + smallSizePic);
			bannerFile2.delete();
		}

		bannerService.deleteBanner(vo.getNo());

		return "redirect:/bannerMngList?page=" + cri.getPage() + "&searchType=" + cri.getSearchType() + "&keyword="
				+ cri.getKeyword();
	}

	//리스트에서 배너 미리보기
	@ResponseBody
	@RequestMapping(value = "getPicPath/{no}",method = RequestMethod.GET)
	public ResponseEntity<String> getPicPath(@PathVariable("no") int no){

		ResponseEntity<String> entity = null;
		
		try {
			BannerVO vo = bannerService.readByNoBanner(no);
	
			if(vo !=null ) {
			entity = new ResponseEntity<String>(vo.getPic(),HttpStatus.OK);
			   }
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST); //400에러
					
		}
		return entity;
		
	}
	
	//리스트에서 미리보기로 본 후 설정 버튼 눌렀을 때 메인 이미지에 반영될 배너 리스트(설정여부 isSetting 리스트 갱신되기)
/*	@RequestMapping(value = "bannerIsSetting/{no}/{whichSide}", method = RequestMethod.POST)
	public String bannerIsSetting(@PathVariable("no") int no, Model model,SearchCriteria cri,@PathVariable("whichSide") String whichSide) throws Exception{
		
		List<BannerVO> OldBannerList = bannerService.listCriteriaSettingBanner(cri, 1);
		if(OldBannerList.size() == 0 ) {
			BannerVO vo = bannerService.readByNoBanner(no);
			vo.setIsSetting(1);
			bannerService.updateBanner(vo);
		}
	     bannerService.updateBanner(vo);
		
		return "redirect:/bannerDetailForm?no="+vo.getNo();
		
	}
*/	


// 공지사항 관리 ------------------------------------------------------------------------------------------------------------------

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

	// 공지사항 추가
	@RequestMapping(value = "addNoticeForm", method = RequestMethod.GET)
	public String addNoticeForm(Model model) throws Exception {
		SearchCriteria cri = new SearchCriteria();
		int total = noticeService.totalCountNotice(cri);
		int totalCnt = total + 1;
		model.addAttribute("totalCnt", totalCnt);
		return "/manager/notice/addNoticeForm";
	}

	// 공지사항 추가
	@RequestMapping(value = "addNoticeForm", method = RequestMethod.POST)
	public String addNoticeResult(NoticeVO notice, Model model) throws Exception {
		System.out.println(notice);
		noticeService.addNotice(notice);
		return "redirect:/noticeMngList";
	}

	// 공지사항 상세페이지
	@RequestMapping(value = "noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(int no, SearchCriteria cri, Model model) throws Exception {
		NoticeVO notice = noticeService.readNoticeByNo(no);
		model.addAttribute("notice", notice);
		model.addAttribute("cri", cri);
		return "/manager/notice/noticeDetail";
	}

	// 공지사항 삭제
	@RequestMapping(value = "removeNotice", method = RequestMethod.GET)
	public String removeNotice(int no, SearchCriteria cri, Model model) throws Exception {
		noticeService.removeNotice(no);
		model.addAttribute("cri", cri);
		return "redirect:/noticeMngList";
	}

	// 공지사항 수정
	@RequestMapping(value = "editNotice", method = RequestMethod.GET)
	public String editNoticeGET(int no, Model model) throws Exception {
		NoticeVO notice = noticeService.readNoticeByNo(no);
		model.addAttribute("notice", notice);
		return "/manager/notice/editNotice";
	}

	// 공지사항 수정
	@RequestMapping(value = "editNotice", method = RequestMethod.POST)
	public String editNoticePOST(NoticeVO notice, Model model) throws Exception {
		System.out.println(notice);
		noticeService.editNotice(notice);
		return "redirect://noticeDetail?no=" + notice.getNo();
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
	//쿠폰 추가
		@RequestMapping(value="addCouponForm", method=RequestMethod.GET)
		public String addCouponForm(Model model) throws Exception{
			SearchCriteria cri = new SearchCriteria();
			int total = couponService.totalCountNotice(cri);
			int totalCnt = total+1;
			model.addAttribute("totalCnt", totalCnt);
			return "/manager/coupon/addCouponForm";
		}
	//쿠폰 추가
	@RequestMapping(value="addCouponForm", method=RequestMethod.POST)
	public String addCouponResult(CouponVO coupon,Model model) throws Exception{

		System.out.println(coupon);

		couponService.addCoupon(coupon);
		return "redirect:/couponMngList";
	}
	
	//쿠폰 상세페이지
		@RequestMapping(value="couponDetail", method=RequestMethod.GET)
		public String couponDetail(int cno,SearchCriteria cri, Model model) throws Exception{
			CouponVO coupon = couponService.readCouponByNo(cno);
			model.addAttribute("coupon", coupon);
			model.addAttribute("pdate", coupon.getPdate());
			model.addAttribute("edate", coupon.getEdate());
			model.addAttribute("cri", cri);
			return "/manager/coupon/couponDetail";
		}
	
	//쿠폰 삭제
		@RequestMapping(value = "removeCoupon", method = RequestMethod.GET)
		public String removeCoupon(int cno, SearchCriteria cri, Model model) throws Exception {
			couponService.removeCoupon(cno);
			model.addAttribute("cri",cri);
			return "redirect:/couponMngList";
		}

	// 쿠폰 수정
	@RequestMapping(value = "editCoupon", method = RequestMethod.GET)
	public String editCouponGET(int cno, Model model) throws Exception {
		CouponVO coupon = couponService.readCouponByNo(cno);
		 model.addAttribute("pdate", coupon.getPdate()); 
		 model.addAttribute("edate",coupon.getEdate()); 
		 model.addAttribute("coupon", coupon);
		
		return "/manager/coupon/editCoupon";
	}

	// 쿠폰 수정
	@RequestMapping(value = "editCoupon", method = RequestMethod.POST)
	public String editCouponPOST(CouponVO coupon, Model model) throws Exception {
		couponService.editCoupon(coupon);
		return "redirect:/couponDetail?cno=" + coupon.getCno();
	}

	//호텔관리
	@RequestMapping(value="hotelMngList", method=RequestMethod.GET)
	public String hotelListPage(SearchCriteria cri, Model model) throws Exception { 
		List<HotelVO> list = hotelService.listCriteriaHotel(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(hotelService.totalSearchCountHotel(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		return "/manager/hotel/hotelMngList";
	}

	@RequestMapping(value = "hotelRegister", method = RequestMethod.GET)
	public String hotelResgiter(SearchCriteria cri, Model model) throws Exception {
		List<HotelVO> list = hotelService.listCriteriaHotel(cri);
		model.addAttribute("lastNum", list.get(0).getNo());
		return "/manager/hotel/hotelRegister";
	}

	@RequestMapping(value = "hotelRegister", method = RequestMethod.POST)
	public String hotelResgiterPost(HotelVO vo) throws Exception {
		hotelService.insertHotel(vo);
		return "redirect:hotelMngList";
	}

	@RequestMapping(value = "hotelModify", method = RequestMethod.GET)
	public String hotelModify(HotelVO vo, SearchCriteria cri, Model model) throws Exception {
		vo = hotelService.readHotel(vo);
		model.addAttribute("hotelVo", vo);
		model.addAttribute("cri", cri);
		return "/manager/hotel/hotelModify";
	}

	@RequestMapping(value = "hotelModify", method = RequestMethod.POST)
	public String hotelModifyPost(HotelVO vo, SearchCriteria cri) throws Exception {
		hotelService.updateHotel(vo);
		return "redirect:hotelMngList?no="+vo.getNo()+"page="+cri.getPage() +"&searchType=" + cri.getSearchType()+"&keyword=" + cri.getKeyword();
	}

	@RequestMapping(value = "hotelDelete", method = RequestMethod.GET)
	public String hotelDelete(HotelVO vo, SearchCriteria cri) throws Exception {
		hotelService.deleteHotel(vo);
		return "redirect:hotelMngList?page=" + cri.getPage() +"&searchType=" + cri.getSearchType()+"&keyword=" + cri.getKeyword();
	}
	// 장바구니

}