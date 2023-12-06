package com.semi.jdgr.csboard.dao;

import java.sql.*;
import java.util.*;

import com.semi.jdgr.csboard.vo.CsboardVo;
import com.semi.jdgr.page.vo.PageVo;
import com.semi.jdgr.util.JDBCTemplate;

public class CsboardDao {
	//상위 5개 게시글 조회
	public List<CsboardVo> selectCsboardTopList(Connection conn) throws SQLException {
		
		//sql
		String sql = "SELECT * FROM (SELECT * FROM CUSTOMER_CENTER WHERE DEL_YN ='N'ORDER BY Q_NO DESC) WHERE ROWNUM <=5";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		List<CsboardVo> csboardVoList = new ArrayList<CsboardVo>();
		//rs
		while(rs.next()) {
			CsboardVo vo = new CsboardVo();
			vo.setqNo(rs.getString("Q_NO"));
			vo.setAdminNo(rs.getString("ADMIN_NO"));
			vo.setMemNo(rs.getString("MEM_NO"));
			vo.setqTit(rs.getString("Q_TIT"));
			vo.setqCon((rs.getString("Q_CON")));
			vo.setqWriteDate(rs.getString("Q_WRITE_DATE"));
			vo.setAnsewr(rs.getString("ANSEWR"));
			vo.setAnsewrDate(rs.getString("ANSEWR_DATE"));
			vo.setUpdateDate(rs.getString("UPDATE_DATE"));
			vo.setDelYn(rs.getString("DEL_YN"));
			vo.setQuestionCategory(rs.getString("QUESTION_CATEGORY"));
			
			csboardVoList.add(vo);
		}
		
		//close
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		
		return csboardVoList;
	}
	//게시글 전체 조회
	public List<CsboardVo> selectCsboardList(Connection conn, PageVo pvo) throws SQLException {
		
		//sql
		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, CSBOARD.* FROM ( SELECT * FROM CUSTOMER_CENTER WHERE DEL_YN = 'N' ORDER BY Q_NO DESC) CSBOARD) WHERE RNUM BETWEEN ? AND ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pvo.getStartRow());
		pstmt.setInt(2, pvo.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		List<CsboardVo> csboardVoList = new ArrayList<CsboardVo>();
		
		//rs
		while(rs.next()) {
			CsboardVo vo = new CsboardVo();
			vo.setqNo(rs.getString("Q_NO"));
			vo.setAdminNo(rs.getString("ADMIN_NO"));
			vo.setMemNo(rs.getString("MEM_NO"));
			vo.setqTit(rs.getString("Q_TIT"));
			vo.setqCon((rs.getString("Q_CON")));
			vo.setqWriteDate(rs.getString("Q_WRITE_DATE"));
			vo.setAnsewr(rs.getString("ANSEWR"));
			vo.setAnsewrDate(rs.getString("ANSEWR_DATE"));
			vo.setUpdateDate(rs.getString("UPDATE_DATE"));
			vo.setDelYn(rs.getString("DEL_YN"));
			vo.setQuestionCategory(rs.getString("QUESTION_CATEGORY"));
			
			csboardVoList.add(vo);
		}
		
		//close
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		//close
		
		return csboardVoList;
	}
	//전체 게시글 갯수 확인
	public int selectCsboardCount(Connection conn) throws SQLException {
		//sql
		String sql ="SELECT COUNT(*) FROM CUSTOMER_CENTER WHERE DEL_YN= 'N'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int cnt = 0;
		
		//rs
		while(rs.next()) {
			cnt = rs.getInt(1);
		}
		
		//close
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return cnt;
	}
	//전체 검색 게시글 갯수 확인
	public int selectSearchCsboardCount(Connection conn, String searchValue) throws SQLException {
		
		String sql ="SELECT COUNT(*) FROM CUSTOMER_CENTER WHERE Q_TIT LIKE '%'||?||'%' OR Q_CON LIKE '%'||?||'%' AND DEL_YN= 'N'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchValue);
		pstmt.setString(2, searchValue);
		ResultSet rs = pstmt.executeQuery();
		int cnt = 0;
		while(rs.next()) {
			cnt = rs.getInt(1);
		}
		return cnt;
	}
	
	//검색 게시글 조회
	public List<CsboardVo> search(Connection conn, String searchValue, PageVo pvo) throws SQLException {
		
		//sql
		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, N.* FROM (SELECT * FROM CUSTOMER_CENTER WHERE Q_TIT LIKE '%'||?||'%' OR Q_CON LIKE '%'||?||'%'  AND DEL_YN = 'N' ORDER BY Q_NO DESC)N )WHERE RNUM BETWEEN ? AND ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchValue);
		pstmt.setString(2, searchValue);
		pstmt.setInt(3, pvo.getStartRow());
		pstmt.setInt(4, pvo.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		List<CsboardVo> csboardVoList = new ArrayList<CsboardVo>();
		
		//rs
		while(rs.next()) {
			CsboardVo vo = new CsboardVo();
			vo.setqNo(rs.getString("Q_NO"));
			vo.setAdminNo(rs.getString("ADMIN_NO"));
			vo.setMemNo(rs.getString("MEM_NO"));
			vo.setqTit(rs.getString("Q_TIT"));
			vo.setqCon((rs.getString("Q_CON")));
			vo.setqWriteDate(rs.getString("Q_WRITE_DATE"));
			vo.setAnsewr(rs.getString("ANSEWR"));
			vo.setAnsewrDate(rs.getString("ANSEWR_DATE"));
			vo.setUpdateDate(rs.getString("UPDATE_DATE"));
			vo.setDelYn(rs.getString("DEL_YN"));
			vo.setQuestionCategory(rs.getString("QUESTION_CATEGORY"));
			
			csboardVoList.add(vo);
		}
		//close
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return csboardVoList;
	}
	//1:1문의 1개 상세 조회
	public CsboardVo csboardDetail(Connection conn, String board) throws SQLException {
		
		//sql
		String sql = "SELECT * FROM CUSTOMER_CENTER WHERE DEL_YN= 'N' AND Q_NO = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, board);
		ResultSet rs = pstmt.executeQuery();
		CsboardVo vo = null;
		
		//rs
		if(rs.next()) {
			vo = new CsboardVo();
			vo.setqNo(rs.getString("Q_NO"));
			vo.setAdminNo(rs.getString("ADMIN_NO"));
			vo.setMemNo(rs.getString("MEM_NO"));
			vo.setqTit(rs.getString("Q_TIT"));
			vo.setqCon((rs.getString("Q_CON")));
			vo.setqWriteDate(rs.getString("Q_WRITE_DATE"));
			vo.setAnsewr(rs.getString("ANSEWR"));
			vo.setAnsewrDate(rs.getString("ANSEWR_DATE"));
			vo.setUpdateDate(rs.getString("UPDATE_DATE"));
			vo.setDelYn(rs.getString("DEL_YN"));
			vo.setQuestionCategory(rs.getString("QUESTION_CATEGORY"));
			
		}
		//close
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return vo;
	}
	//1:1 문의글 작성 
	public int CsboardWrite(Connection conn, CsboardVo vo) throws SQLException {
		
		//sql
		String sql = "INSERT INTO CUSTOMER_CENTER(Q_NO,MEM_NO,Q_TIT,Q_CON,QUESTION_CATEGORY) VALUES (SEQ_CUSTOMER_CENTER.NEXTVAL,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getMemNo());
		pstmt.setString(2, vo.getqTit());
		pstmt.setString(3, vo.getqCon());
		pstmt.setString(4, vo.getQuestionCategory());
		int result = pstmt.executeUpdate();
		
		//close
		JDBCTemplate.close(pstmt);
		
		return result;
	}

}