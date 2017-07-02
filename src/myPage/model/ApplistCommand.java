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
import util.LoginBean;
import util.PagingBean;
/**
 * 관리자 포인트 관리 페이지 관련 커멘드 클래스
 * @author 나현기
 *
 */
public class ApplistCommand implements CommandInterface {

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
		
		String pointcheck = request.getParameter("check");
		
		prseonInfo(request);
	
			if(!(pointcheck == null)){
				
				if(pointcheck.equals("plus")){
					System.out.println(pointcheck);
					String result = plusPoint(request);
					request.setAttribute("result", result);
					
				}
				else if(pointcheck.equals("minus")){
					System.out.println(pointcheck);
					String result = minusPoint(request);
					request.setAttribute("result", result);
				}
			}
		
		pointList(request);
		
		
		return "/WEB-INF/myPage/a_pplist.jsp";
	}
	
	/**
	 * 학번으로 클릭한 사람 이름 확인
	 * @param request 서블릿 리퀘스트
	 */
	public void prseonInfo(HttpServletRequest request){
		
		String checkid = request.getParameter("check_id");
		String checkName = "";
		int m_point = 0;
		String sql = "select m_name, m_point from tbl_member where m_id = ?";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, checkid);
			rs = pstmt.executeQuery();
			
			rs.next();
			checkName = rs.getString("m_name");
			m_point = rs.getInt("m_point");
		} 
		catch (Exception e) {
			System.out.println( "a_pointcheck.jsp : " + e);
			e.getStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		request.setAttribute("pName",  checkName);
		request.setAttribute("pNum",  checkid);
		request.setAttribute("pPoint",  m_point);
	}
	
	/**
	 * 회원 개인의 거래 기록 검색
	 * @param request 서블릿 리퀘스트
	 */
	public void pointList(HttpServletRequest request){
		
		String checkid = request.getParameter("check_id");
		System.out.println(checkid);
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
			e.getStackTrace();
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
	
	/**
	 * 관리자가 회원에게 포인트를 더해주는 메소드
	 * @param request 서블릿 리퀘스트
	 * @return 출력 결과
	 */
public String plusPoint(HttpServletRequest request){
		
		long m_point = Long.parseLong(request.getParameter("m_point"));
		long a_point = Long.parseLong(request.getParameter("a_point"));
		String r_content = request.getParameter("r_content");
		int r_point = Integer.parseInt(request.getParameter("r_point"));
		String member_id = request.getParameter("member_id");
		String admin_id = request.getParameter("admin_id");
		
		if(a_point < r_point){
			
			return "overpoint";
			
		}
		
		
		//거래 기록 입력 쿼리
		String sql1 = "INSERT INTO tbl_record (r_point, r_content, m_giver, m_haver) VALUES (?, ?, ?, ?)";
		//주는 포인트 빼기
		String sql2 = "UPDATE tbl_member SET m_point= m_point - ? WHERE m_id = ? ";
		//받는 포인트 더하기
		String sql3 = "UPDATE tbl_member SET m_point= m_point + ? WHERE m_id = ? ";

		pool = DBConnectionMgr.getInstance();
		
		try {
			con = pool.getConnection();
			
			//거래기록 입력
			pstmt = con.prepareStatement(sql1);
			pstmt.setInt(1, r_point);
			pstmt.setString(2, r_content);
			pstmt.setString(3, admin_id);
			pstmt.setString(4, member_id);
			pstmt.executeUpdate();
			
			//포인트 빼기
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, r_point);
			pstmt.setString(2, admin_id);
			pstmt.executeUpdate();
			
			//포인트 더하기
			pstmt = con.prepareStatement(sql3);
			pstmt.setInt(1, r_point);
			pstmt.setString(2, member_id);
			pstmt.executeUpdate();
			
		} 
		catch (Exception e) {
			System.out.println( "a_pointcheck.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt);
		}		
		
		return "plusgo";
	}
	
/**
 * 관리자가 회원에게 포인트를 뺐는 메소드
 * @param request 서블릿 리퀘스트
 * @return 출력결과
 */
	public String minusPoint(HttpServletRequest request){
		
		long m_point = Long.parseLong(request.getParameter("m_point"));
		long a_point = Long.parseLong(request.getParameter("a_point"));
		String r_content = request.getParameter("r_content");
		int r_point = Integer.parseInt(request.getParameter("r_point"));
		String member_id = request.getParameter("member_id");
		String admin_id = request.getParameter("admin_id");
		

		if(m_point < r_point){
			
			return "overpoint";
			
		}
		
		
		//거래 기록 입력 쿼리
		String sql1 = "INSERT INTO tbl_record (r_point, r_content, m_giver, m_haver) VALUES (?, ?, ?, ?)";
		//주는 포인트 빼기
		String sql2 = "UPDATE tbl_member SET m_point= m_point - ? WHERE m_id = ? ";
		//받는 포인트 더하기
		String sql3 = "UPDATE tbl_member SET m_point= m_point + ? WHERE m_id = ? ";

		pool = DBConnectionMgr.getInstance();
		
		try {
			con = pool.getConnection();
			//거래기록 입력
			pstmt = con.prepareStatement(sql1);
			pstmt.setInt(1, r_point);
			pstmt.setString(2, r_content);
			pstmt.setString(3, member_id);
			pstmt.setString(4, admin_id);
			pstmt.executeUpdate();
			
			//포인트 빼기
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, r_point);
			pstmt.setString(2, member_id);
			pstmt.executeUpdate();
			
			//포인트 더하기
			pstmt = con.prepareStatement(sql3);
			pstmt.setInt(1, r_point);
			pstmt.setString(2, admin_id);
			pstmt.executeUpdate();
			
		} 
		catch (Exception e) {
			System.out.println( "a_pointcheck.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt);
		}		
		
		return "minusgo";
	}
	
	
	
}
