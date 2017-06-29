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

import dto.CertiMemberDTO;
import harang.dbcp.DBConnectionMgr;
import login.LoginBean;
import paging.PagingBean;
import paging.dto.PagingDto;
/**
 * 괸리자 스펙 포인트 지급 및 거부 
 * @author 나현기
 *
 */
public class AchallengeCommand implements CommandInterface {
	
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
		
		System.out.println(pointcheck);
		
		if(!(pointcheck == null)){
			
			if(pointcheck.equals("complete")){
				String result = challengeComplete(request);
				System.out.println(result);
				request.setAttribute("result", result);
				
			}
			else if(pointcheck.equals("return")){
				System.out.println("worng");
				String result = challengeReturn(request);
				request.setAttribute("result", result);
			}
		}
		
		challengeList(request);
		
		LoginBean login = new LoginBean();
		login.refreshSession(request);
		
		return "/WEB-INF/myPage/a_challenge.jsp";
	}
	
	/**
	 * 도전에 등록한 목록 출력
	 * @param request
	 */
	public void challengeList(HttpServletRequest request){
		
		ArrayList cmlist  = new ArrayList();
		
		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");
		
		String sql = null;
		
		if (null == (keyword)) {
			sql = "SELECT m.m_id, m.m_name, m.m_dept, c.c_name, c.c_point, cm.cm_regdate, "
				+ "cm.cm_image, cm.cm_iscomplete, cm.cm_completedate, cm.c_num "
				+ "from tbl_certificate c, tbl_certi_member cm, tbl_member m "
				+ "where c.c_num = cm.c_num and cm.m_id = m.m_id order by cm.cm_regdate desc";
		}
		 else {
			 sql = "SELECT m.m_id, m.m_name, m.m_dept, c.c_name, c.c_point, cm.cm_regdate, "
				 + "cm.cm_image, cm.cm_iscomplete, cm.cm_completedate, cm.c_num "
				 + "from tbl_certificate c, tbl_certi_member cm, tbl_member m "
				 + "where c.c_num = cm.c_num and cm.m_id = m.m_id and "
				 + keyfield + " like '%" + keyword + "%'"
				 + "order by cm.cm_regdate desc"; 
		 }
		
		try {
			
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				CertiMemberDTO cmdto = new CertiMemberDTO();
				
				cmdto.setM_id(rs.getString("m_id"));
				cmdto.setM_name(rs.getString("m_name"));
				cmdto.setM_dept(rs.getString("m_dept"));
				cmdto.setC_name(rs.getString("c_name"));
				cmdto.setC_num(rs.getString("c_num"));
				cmdto.setC_point(rs.getInt("c_point"));
				cmdto.setCm_regdate(rs.getString("cm_regdate"));
				cmdto.setCm_image(rs.getString("cm_image"));
				cmdto.setCm_iscomplete(rs.getString("cm_iscomplete"));
				cmdto.setCm_completedate(rs.getString("cm_completedate"));
				
				cmlist.add(cmdto);
				
				
			}
		} 
		catch (Exception e) {
			System.out.println( "a_challenge.jsp : " + e);
			e.getStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
		request.setAttribute("cmlist", cmlist);
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
		PagingDto paging = pbean.Paging(cmlist.size(), 10, nowPage, 10, nowBlock);

		request.setAttribute("paging", paging);
	}
	/**
	 * 스펙등록시 포인트 지급
	 * @param request
	 * @return
	 */
	public String challengeComplete(HttpServletRequest request){
		
		String r_content = "[스펙 업 성공!] "+ request.getParameter("c_name") +" : "
						+ request.getParameter("c_point") + " 포인트 지급";
		int c_point = Integer.parseInt(request.getParameter("c_point"));
		String member_id = request.getParameter("m_id");
		String admin_id = request.getParameter("admin_id");
		String c_num = request.getParameter("c_num");
		
		//거래 기록 입력 쿼리
		String sql1 = "INSERT INTO tbl_record (r_point, r_content, m_giver, m_haver) VALUES (?, ?, ?, ?)";
		//주는 포인트 빼기
		String sql2 = "UPDATE tbl_member SET m_point= m_point - ? WHERE m_id = ? ";
		//받는 포인트 더하기
		String sql3 = "UPDATE tbl_member SET m_point= m_point + ? WHERE m_id = ? ";
		//등록한 스펙 성공 기록
		String sql4 = "UPDATE tbl_certi_member SET cm_iscomplete = 'complete', cm_completedate = NOW() WHERE c_num = ? and m_id = ?";
		
		pool = DBConnectionMgr.getInstance();
		
		try {
			con = pool.getConnection();
			
			//거래기록 입력
			pstmt = con.prepareStatement(sql1);
			pstmt.setInt(1, c_point);
			pstmt.setString(2, r_content);
			pstmt.setString(3, admin_id);
			pstmt.setString(4, member_id);
			pstmt.executeUpdate();
			System.out.println(sql1);

			//등록한 스펙 성공 기록
			pstmt = con.prepareStatement(sql4);
			pstmt.setString(1, c_num);
			pstmt.setString(2, member_id);
			pstmt.executeUpdate();
			System.out.println(sql4);
			
			//포인트 빼기
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, c_point);
			pstmt.setString(2, admin_id);
			pstmt.executeUpdate();
			System.out.println(sql2);
			
			//포인트 더하기
			pstmt = con.prepareStatement(sql3);
			pstmt.setInt(1, c_point);
			pstmt.setString(2, member_id);
			pstmt.executeUpdate();
			System.out.println(sql3);
			
		} 
		catch (Exception e) {
			System.out.println( "a_challenge.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt);
		}		
		
		return "complete";
	}
	
	public String challengeReturn(HttpServletRequest request){
		
		String member_id = request.getParameter("m_id");
		String admin_id = request.getParameter("admin_id");
		String c_num = request.getParameter("c_num");
		
		//등록한 스펙 거부 기록
		String sql1 = "UPDATE tbl_certi_member SET cm_iscomplete = 'return', cm_completedate = NOW() WHERE c_num = ? and m_id = ?";
		
		pool = DBConnectionMgr.getInstance();
		
		try {
			con = pool.getConnection();
			
			//등록한 스펙 거부 기록
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, c_num);
			pstmt.setString(2, member_id);
			pstmt.executeUpdate();
			System.out.println(sql1);
			
		} 
		catch (Exception e) {
			System.out.println( "a_challenge.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt);
		}	
		
		
		return "return";
	}
	

}
