package facilities.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.activation.DataSource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dto.ScheduleDTO;
import dto.SrMemberDTO;
import facilities.CommandInterface;
import harang.dbcp.DBConnectionMgr;


public class AFacilSRCommand implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs;

	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String check = request.getParameter("delete");
		loadList(request);
		
		String check2 = request.getParameter("check");
		
		
		if("1".equals(check)){
			deletefacil(request);
			loadList(request);
		}
		
		else if("faciladd".equals(check2)){
			System.out.println("일정으로 시설추가 도착");
			addDateFacil(request);
			loadList(request);
		}
		
		return "/WEB-INF/facil/a_facilities_sr_schedule.jsp";
	}

	public void loadList(HttpServletRequest request) {


		// 쿼리문을 '학생예약' 외의 작성
		String srsql = "SELECT m.srm_issue, m.srm_num, m.sr_num, "
				+ "m.m_id, m.srm_regdate, m.srm_timecode, s.sr_type, "
				+ "s.sr_name, m.srm_date, s.sr_point "
				+ "FROM tbl_sr_member m, tbl_studyroom s WHERE m.sr_num = s.sr_num "
				+ "AND srm_issue !='학생예약' ORDER BY m.srm_date ASC";
		
		// 스터디룸이 들어있는 목록만 검색
		//String scsql= "SELECT * FROM tbl_schedule WHERE s_location IS NOT NULL";
		String scsql= "SELECT * FROM tbl_schedule WHERE s_location LIKE '%스터디룸%'";
		
		String ajaxsql = "SELECT * FROM tbl_studyroom GROUP BY sr_type ";
		
		ArrayList srlist = new ArrayList();
		ArrayList sclist = new ArrayList();
		ArrayList ajaxlist = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(srsql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SrMemberDTO srmdto = new SrMemberDTO();
				
				srmdto.setSrm_num(rs.getString("m.srm_num"));
				srmdto.setSr_type(rs.getString("s.sr_type"));
				srmdto.setSr_name(rs.getString("s.sr_name"));
				srmdto.setSrm_date(rs.getString("m.srm_date"));
				srmdto.setSrm_issue(rs.getString("m.srm_issue"));
				
				srlist.add(srmdto);	
			}

			pstmt = con.prepareStatement(scsql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ScheduleDTO sdto = new ScheduleDTO();
				
				sdto.setS_dstart(rs.getString("s_dstart"));
				sdto.setS_dend(rs.getString("s_dend"));
				sdto.setS_title(rs.getString("s_title"));
				sdto.setS_location(rs.getString("s_location"));
				
				sclist.add(sdto);
			}
			
			pstmt = con.prepareStatement(ajaxsql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SrMemberDTO srmdto = new SrMemberDTO();
				
				srmdto.setSr_type(rs.getString("sr_type"));
				ajaxlist.add(srmdto);
			
			}

		} catch (Exception e) {
			System.out.println(" : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		request.setAttribute("srlist", srlist);
		request.setAttribute("sclist", sclist);
		request.setAttribute("ajaxlist", ajaxlist);
	}
	
	private void deletefacil(HttpServletRequest request) {
		String srm_num = request.getParameter("srm_num");
		
		String sql = "DELETE FROM tbl_sr_member WHERE srm_num=?";
		
		System.out.println(srm_num);
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, srm_num);
			pstmt.executeUpdate();


		} catch (Exception e) {
			System.out.println(" : " + e);

		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
	
	private void addDateFacil(HttpServletRequest request) {
		
		String sql = "INSERT INTO tbl_sr_member (srm_date, srm_timecode, m_id, sr_num, srm_issue) "
				+ "VALUES (?, ?, ?, ?, ?)";
		
		String srm_date = request.getParameter("addsrm_date");
		
		// 타임코드는 고정(하루전체를 블록 하게된다.)
		String srm_timecode = "A1111111111111";
		
		String sr_num = request.getParameter("addsr_num");
		String srm_issue=request.getParameter("addsrm_issue");
		
		//시설물 관리자 admin03은 고정이나 변경될 수 있으므로 남겨둠.
		String m_id = "admin03";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, srm_date);
			pstmt.setString(2, srm_timecode);
			pstmt.setString(3, m_id);
			pstmt.setString(4, sr_num);
			pstmt.setString(5, srm_issue);
			pstmt.executeUpdate();

			System.out.println("일정추가완료.1");
			
		} catch (Exception e) {
			System.out.println(" : " + e);

		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
}
