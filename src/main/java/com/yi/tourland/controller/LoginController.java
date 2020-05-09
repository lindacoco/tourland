package com.yi.tourland.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.tourland.domain.mng.EmployeeVO;
import com.yi.tourland.domain.mng.UserVO;
import com.yi.tourland.service.mng.EmployeeService;
import com.yi.tourland.service.mng.UserService;

@Controller("/user/*")
public class LoginController {
	
	@Autowired
	EmployeeService empService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="loginForm",method = RequestMethod.GET)
	public String loginGet(){
		return "/user/tourlandLoginForm";
	}
	
	@RequestMapping(value="loginForm",method=RequestMethod.POST)
	public String loginPost(String id, String pass, UserVO userVO, EmployeeVO empVO, Model model, HttpSession session) throws Exception {
		//input에서 받는 아이디,비밀번호를 유저와 사원쪽에 넣고
		userVO.setUserid(id);
		userVO.setUserpass(pass);
		empVO.setEmpid(id);
		empVO.setEmppass(pass);
		//맞는게 있는지 비교
		UserVO dbUser = userService.readByIdUser(userVO.getUserid());
		EmployeeVO dbEmp = empService.readByIdEmployee(empVO.getEmpid());
		//UserVO userPass = userService.readByPassUser(pass);
		
		//직원아이디가 있는 경우
		if(dbEmp!=null) {
			//퇴사한 직원인 경우
			if(dbEmp.getEmpretired()==1) {
				model.addAttribute("error", "로그인 권한이 없습니다.");
				return "/user/tourlandLoginForm";
			}
			//비밀번호가 맞지않는 경우
			if(dbEmp.getEmppass().equals(empVO.getEmppass())==false) {
				model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
				return "/user/tourlandLoginForm";
			}
			//전부 다 맞는 경우(직원)
			session.setAttribute("Manager",empVO.getEmpname());  
			return "redirect:/tourlandMain";
			
		//회원아이디가 있는 경우
		}else if(dbUser!=null) {
			//탈퇴한 회원인 경우
			if(dbUser.getUsersecess()==1) {
				model.addAttribute("error", "로그인 권한이 없습니다.");
				return "/user/tourlandLoginForm";
			}
			//회원 비밀번호가 맞지 않는 경우
			if(dbUser.getUserpass().equals(userVO.getUserpass())==false) {
				System.out.println(dbUser.getUserpass());
				System.out.println(userVO.getUserpass());
				model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
				return "/user/tourlandLoginForm";
			}
			//전부 다 맞는 경우(회원)
			session.setAttribute("User",userVO.getUsername());
			return "redirect:/tourlandMain";
			
		//아이디가 없는 경우	(직원,회원)
		}else{
			model.addAttribute("error", "아이디가 존재하지 않습니다.");
			return "/user/tourlandLoginForm";
		}
		
	
	}
}
