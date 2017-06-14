package myPage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.MemberDTO;
import dto.RecordDTO;
import harang.dbcp.DBConnectionMgr;
import paging.PagingBean;
import paging.dto.PagingDto;

/**
 * 관리자 포인트 조회 페이지
 * @author YOO
 */
public class ApointCommand implements CommandInterface {
	
	
	//DB 커넥션 4 대장
	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;
	//DBCP 사용
	DBConnectionMgr pool;
	

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String checkid = request.getParameter("check_id");
		
		if(!(checkid == null)){
			prseonName(request);
			personList(request);
		}
		
		memList(request);
		
		return "/WEB-INF/myPage/a_pointcheck.jsp";
	}
	
	
	/**
	 * 학번으로 클릭한 사람 이름 확인
	 * @param checkid
	 * @return
	 */
	public void prseonName(HttpServletRequest request){
		
		String checkid = request.getParameter("check_id");
		String checkName = "";
		String sql = "select m_name from tbl_member where m_id = ?";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, checkid);
			rs = pstmt.executeQuery();
			
			rs.next();
			checkName = rs.getString("m_name");
		} 
		catch (Exception e) {
			System.out.println( "a_pointcheck.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
		request.setAttribute("pName",  checkName);
	}
	
	
	/**
	 * 회원 개인의 거래 기록 검색
	 * @param checkid 학번
	 * @return
	 */
	public void personList(HttpServletRequest request){
		
		String checkid = request.getParameter("check_id");
		
		ArrayList plist  = new ArrayList();
		
		String sql = "select r_regdate, r_content, r_point, m_giver, m_haver, "+
				"(select m_name from tbl_member where m_id = m_giver) as m_givername, "+
				"(select m_name from tbl_member where m_id = m_haver) as m_havername  "+
				"from tbl_record where m_giver = ? or  m_haver = ? ";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, checkid);
			pstmt.setString(2, checkid);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				RecordDTO rdto = new RecordDTO();
				
				rdto.setR_regdate(rs.getString("r_regdate"));
				rdto.setR_content(rs.getString("r_content"));
				rdto.setR_point(rs.getLong("r_point"));
				rdto.setM_giver(rs.getString("m_giver"));
				rdto.setM_haver(rs.getString("m_haver"));
				rdto.setM_givername(rs.getString("m_givername"));
				rdto.setM_havername(rs.getString("m_havername"));
				
				plist.add(rdto);
			}
		} 
		catch (Exception e) {
			System.out.println( "a_pointcheck.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
		request.setAttribute("pList", plist);
		request.setAttribute("checkid", checkid);
		
	}
	
	/**
	 * 리스트 페이징 검색 기능이 구현된 페이지
	 * @return
	 */
	public void memList(HttpServletRequest request){

		String sql;
		
		ArrayList mlist  = new ArrayList();
		
		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");
		

		if(keyword == null || keyword.equals("")){
			
			sql = "select m_id, m_name, m_dept, m_grade, m_point from tbl_member order by m_id desc";
			
		}
		else{
			
			sql = "select m_id, m_name, m_dept, m_grade, m_point from tbl_member "
					+ " where "+ keyfield +" like '%"+keyword+"%' order by m_id desc";
			
		}
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				MemberDTO mdto = new MemberDTO();
				
				mdto.setM_id(rs.getString("m_id"));
				mdto.setM_name(rs.getString("m_name"));
				mdto.setM_dept(rs.getString("m_dept"));
				mdto.setM_grade(rs.getInt("m_grade"));
				mdto.setM_point(rs.getLong("m_point"));
								
				mlist.add(mdto);
			}
		} 
		catch (Exception e) {
			System.out.println( "a_pointcheck.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("keyfield", keyfield);
		request.setAttribute("mList",  mlist);
		
		// 페이징 관련 블록
		// 페이징 관련 parameter 받아오기
		int nowPage=0, nowBlock=0;
			if(request.getParameter("nowPage") != null){nowPage = Integer.parseInt(request.getParameter("nowPage"));}
			if(request.getParameter("nowBlock") != null){nowBlock = Integer.parseInt(request.getParameter("nowBlock"));}
		PagingBean pbean = new PagingBean();
		// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수!!
		PagingDto paging = pbean.Paging(mlist.size(),10, nowPage,10,  nowBlock);
		//페이징 정보 보내기
		request.setAttribute("paging", paging);
	}

}
