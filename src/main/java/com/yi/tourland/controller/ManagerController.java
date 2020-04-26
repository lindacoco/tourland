package com.yi.tourland.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManagerController {
	
		//예약관리
		@RequestMapping(value="reservMngList", method=RequestMethod.GET)
		public String reservMngList() { 
			return "/manager/reservationMngList"; 
		}
		
		//항공 추가 폼
		@RequestMapping(value="addFlightForm", method=RequestMethod.GET)
		public String addFlightForm() { 
			return "/manager/addFlightForm"; 
		}
}
