package com.fpj.trendeater.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.fpj.trendeater.admin.model.vo.Admin;

public class AdminInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Admin adminUser = (Admin)session.getAttribute("adminUser");
		
	
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		if(adminUser == null) {
			//response.sendRedirect("admin"); 
			//session.setAttribute("msg", "관리자 로그인 후 이용하세요");
			PrintWriter printwriter = response.getWriter();
			printwriter.print("<script>alert('관리자 로그인 후 이용 가능합니다.');location.href ='../admin';</script>");
			printwriter.flush();
			printwriter.close();
			return false;
		} 
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
