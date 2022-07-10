package com.fpj.trendeater.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.fpj.trendeater.member.model.vo.Member;

public class MemberInterceptor implements  HandlerInterceptor  {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		if(loginUser == null) {
			/* response.sendRedirect("loginform.me"); */
			//request.setAttribute("msg","로그인 후 이용하세요");
			PrintWriter printwriter = response.getWriter();
			printwriter.print("<script>alert('로그인 후 이용해주세요');location.href = 'loginform.me';</script>");
			printwriter.flush();
			printwriter.close();
		
			return false;
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
