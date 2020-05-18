package com.yi.tourland.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object object = session.getAttribute("Auth");
		if(object == null) {  //로그인 안 한 경우
			response.sendRedirect(request.getContextPath() + "/loginForm");
			return false; //기존 컨트롤러에 진입을 막는다
		}
		return true;
	}
}
