package myPage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dto.MemberDTO;
import dto.PagingDto;
import dto.RecordDTO;
import harang.dbcp.DBConnectionMgr;
import myPage.CommandInterface;
import util.PagingBean;

/**
 * 관리자 포인트 조회 페이지
 * @author 나현기
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
		
		
		memList(request);
		
		return "/WEB-INF/myPage/a_pointcheck.jsp";
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
