package com.yi.tourland.controller.cust;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerController {
	
	//메인
	@RequestMapping(value="tourlandMain", method=RequestMethod.GET)
	public String tourlandMain() { 
		return "/customer/tourlandMain"; 
	}
	
	//로그인
	@RequestMapping(value="tourlandLogin", method=RequestMethod.GET)
	public String tourlandLogin() { 
		return "/customer/tourlandLogin"; 
	}
	
	//로그인 폼
	@RequestMapping(value="tourlandLoginForm", method=RequestMethod.GET)
	public String tourlandLoginForm() { 
		return "/customer/tourlandLoginForm"; 
	}   
	
	//로그인 폼
	@RequestMapping(value="tourlandMyPage", method=RequestMethod.GET)
	public String tourlandMyPage() { 
		return "/customer/tourlandMyPage"; 
	} 	
}
