package com.semi.jdgr.user.post.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.jdgr.blog.service.BlogService;
import com.semi.jdgr.page.vo.PageVo;
import com.semi.jdgr.post.service.PostServiceJOJ;
import com.semi.jdgr.post.vo.PostVo;

@WebServlet("/post/list")
public class PostListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			PostServiceJOJ ps = new PostServiceJOJ();
			
			// data
			// 클라이언트로부터 전송된 JSON 데이터 읽기
			String groupNo = req.getParameter("GroupNo");
			String blogUrl = req.getParameter("url");
			String pNo = req.getParameter("pNo");		// null 값으로 들어옴
			System.out.println("cont = " + pNo);
			PostVo postDetailVo = ps.PostDetail(groupNo, blogUrl, pNo); 
			
			// pNo 값으로 들어올 경우 실행
			BlogService bs = new BlogService();
			if( groupNo == null ) {
				groupNo = postDetailVo.getGroupNo();
				req.getRequestDispatcher("/post/detail?url=").forward(req, resp);
			}
			
			int listCount = ps.getPostVoListCount(groupNo); // 전체 포스트 갯수
			String currentPage_ = req.getParameter("pnum");
			System.out.println("페이지넘버" + currentPage_);
			if(currentPage_ == null) {
				currentPage_ = "1";
			}
			int currentPage = Integer.parseInt(currentPage_); // 현재 페이지
			int pageLimit = 10;
			int boardLimit = 5;
			
			// service
			PageVo pvo = new PageVo(listCount, currentPage, pageLimit, boardLimit);
			List<PostVo> postVoList = ps.getPostVoList(groupNo, pvo); // 페이지에 맞는 포스트 List 가져오기
			
			// result
			Gson gson = new Gson();
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("postVoList", postVoList);
			map.put("pvo", pvo);
			map.put("PgroupNo", groupNo);
			map.put("PblogUrl", blogUrl);
			
			resp.setCharacterEncoding("UTF-8");
			PrintWriter out = resp.getWriter();
			
			String str = gson.toJson(map);
			
			out.write(str);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}