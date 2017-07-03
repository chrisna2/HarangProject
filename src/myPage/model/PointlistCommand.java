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
 * pointList.jsp 관련 페이지 기능 커멘드 클래스
 * @author 나현기
 *
 */
public class PointlistCommand implements CommandInterface {

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
		
		
		pointList(request);
		
		
		return "/WEB-INF/myPage/pointList.jsp";
	}
	
	/**
	 * 회원 개인의 거래 기록 검색
	 * @param checkid 학번
	 */
	public void pointList(HttpServletRequest request){
		
		MemberDTO member =(MemberDTO)request.getSession().getAttribute("member");
		String checkid = member.getM_id();
		
		ArrayList plist  = new ArrayList();
		
		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");
		
		String sql = null;
				
		if (null == (keyword)) {
			sql  = 	"select r_regdate, r_content, r_point, m_giver, m_haver, "+
					"(select m_name from tbl_member where m_id = m_giver) as m_givername, "+
					"(select m_name from tbl_member where m_id = m_haver) as m_havername  "+
					"from tbl_record where m_giver = ? or  m_haver = ? order by r_regdate desc";
		}
		 else {
			 sql  = "select r_regdate, r_content, r_point, m_giver, m_haver, "+
					"(select m_name from tbl_member where m_id = m_giver) as m_givername, "+
					"(select m_name from tbl_member where m_id = m_haver) as m_havername  "+
					"from tbl_record where (m_giver = ? or  m_haver = ?) and "
					+ keyfield + " like '%" + keyword + "%'"
					+ "order by r_regdate desc";
		 }
		
		
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
		request.setAttribute("keyword", keyword);
		request.setAttribute("keyfield", keyfield);
		
		// 페이징 관련 parameter 받아오기
				int nowPage = 0, nowBlock = 0;
				if (request.getParameter("nowPage") != null) {
					nowPage = Integer.parseInt(request.getParameter("nowPage"));
				}
				if (request.getParameter("nowBlock") != null) {
					nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
				}
				// DB 연동 함수를 쓰기 위해 인스턴스 생성

				PagingBean pbean = new PagingBean();
				// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수!!
				PagingDto paging = pbean.Paging(plist.size(), 10, nowPage, 10, nowBlock);

				request.setAttribute("paging", paging);
		
	}

	
	public ArrayList pointListHeader(String m_id){
		
		
		ArrayList plist  = new ArrayList();
		
		String sql  = "select r_regdate, r_content, r_point, m_giver, m_haver, "+
				"(select m_name from tbl_member where m_id = m_giver) as m_givername, "+
				"(select m_name from tbl_member where m_id = m_haver) as m_havername  "+
				"from tbl_record where m_giver = ? or  m_haver = ? order by r_regdate desc limit 5";
		
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_id);
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
			System.out.println( "header.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
		return plist;
	}
	
	
}
