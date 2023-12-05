package com.semi.jdgr.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/notice/detail")
public class AdminNoticeDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//data
		String no = req.getParameter("no");
		//service
		
		//view
		
		req.getRequestDispatcher("/WEB-INF/views/admin/notice/noticeDetail.jsp").forward(req, resp);
	}
}
