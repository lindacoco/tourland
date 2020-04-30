package com.yi.tourland.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerController {
	
	//메인
	@RequestMapping(value="tourlandMain", method=RequestMethod.GET)
	public String tourlandMain() { 
		return "/user/tourlandMain"; 
	}
	
	//로그인
	@RequestMapping(value="tourlandLogin", method=RequestMethod.GET)
	public String tourlandLogin() { 
		return "/user/tourlandLogin"; 
	}
	
	//로그인 폼
	@RequestMapping(value="tourlandLoginForm", method=RequestMethod.GET)
	public String tourlandLoginForm() { 
		return "/user/tourlandLoginForm"; 
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
