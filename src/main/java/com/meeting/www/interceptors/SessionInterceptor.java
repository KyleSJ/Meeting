package com.meeting.www.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.meeting.www.member.constants.Member;

public class SessionInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String contextPath = request.getContextPath();
		
		if(request.getSession().getAttribute(Member.USER) == null) {
			response.sendRedirect( contextPath + "/login");
			return false;
		}
		return true;
	}

}
