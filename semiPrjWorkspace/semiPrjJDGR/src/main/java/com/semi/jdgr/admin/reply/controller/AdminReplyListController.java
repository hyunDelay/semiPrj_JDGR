package com.semi.jdgr.admin.reply.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.jdgr.admin.reply.service.AdminReplyService;
import com.semi.jdgr.page.vo.PageVo;

@WebServlet("/admin/reply/reply_list")
public class AdminReplyListController extends HttpServlet{

	//댓글 조회 화면
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			AdminReplyService ars = new AdminReplyService();
			
			//data
			int listCount = ars.selectReplyCount();	//전체 댓글 갯수
			String currentPage = req.getParameter("pno");
			if(currentPage_ == null) {
				currentPage_ = "1";
			}
			int currentPage = Integer.parseInt(currentPage_);	//현재 페이지
			int pageLimit = 5;
			int replyLimit = 10;
			PageVo pvo = new PageVo(listCount, currentPage, pageLimit, replyLimit);
			
			// service
			List<ReplyVo> boardVoList = ars.selectReplyList(pvo);
			
			// result (==view)
			req.setAttribute("replyVoList", boardVoList);
			req.setAttribute("pvo" , pvo);
			req.getRequestDispatcher("/WEB-INF/views/reply/reply_list.jsp").forward(req, resp);
		
		
		
	}catch(Exception e) {
		System.out.println("[ERROR-B001]댓글 목록 조회 중 에러 발생 ...");
		e.printStackTrace();
		req.setAttribute("errorMsg", "댓글 목록 조회 에러");
		req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		
		//service
		
		//result(==view)
	
		
	}
	}
	
	//댓글 조회 로직
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
	}

}
