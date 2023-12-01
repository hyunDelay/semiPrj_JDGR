package com.semi.jdgr.user.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.jdgr.user.member.service.MemberService;
import com.semi.jdgr.user.member.vo.MemberVo;

@WebServlet("/member/login")
public class MemberLoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/user/member/login.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			// data
			String memberId = req.getParameter("memberId");
			String memberPwd = req.getParameter("memberPwd");
			
			MemberVo vo = new MemberVo();
			vo.setMemId(memberId);
			vo.setMemPwd(memberPwd);
			
			// service
			MemberService ms = new MemberService();
			MemberVo loginMember = ms.login(vo);

			HttpSession session = req.getSession();
			// result (==view)
			if(loginMember == null) {
				session.setAttribute("alertMsg", "아이디 또는 비밀번호가 틀렸습니다.");
				throw new Exception("로그인 실패 ...");
			}
			
			session.setAttribute("loginMember", loginMember);
			resp.sendRedirect("/jdgr/home"); 
			
		}catch(Exception e) {
			e.printStackTrace();
			
			resp.sendRedirect("/jdgr/member/login"); 
			
		}
		
	}
}
