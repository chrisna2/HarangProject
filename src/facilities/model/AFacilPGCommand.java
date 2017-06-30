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

import dto.MemberDTO;
import dto.PgMemberDTO;
import dto.PlaygroundDTO;
import dto.ScheduleDTO;
import dto.SrMemberDTO;
import dto.StudyroomDTO;
import harang.dbcp.DBConnectionMgr;
import login.LoginBean;
import point.PointBean;

public class AFacilPGCommand implements CommandInterface {

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
			addDateFacil(request);
		}
		
		return "/WEB-INF/facil/a_facilities_pg_schedule.jsp";
	}

	public void loadList(HttpServletRequest request) {


		// 쿼리문을 '학생예약' 외의 작성
		String pgsql = "SELECT m.pgm_issue, m.pgm_num, m.pg_num, m.m_id, m.pgm_regdate, m.pgm_timecode, p.pg_type, p.pg_name, m.pgm_date, p.pg_point "
				+ "FROM tbl_pg_member m, tbl_playground p WHERE m.pg_num = p.pg_num "
				+ "AND pgm_issue !='학생예약' ORDER BY m.pgm_date ASC";
		
		String scsql= "SELECT * FROM tbl_schedule WHERE s_location IS NOT NULL;";
		String ajaxsql = "SELECT * FROM tbl_playground GROUP BY pg_type ";
		
		ArrayList pglist = new ArrayList();
		ArrayList sclist = new ArrayList();
		ArrayList ajaxlist = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(pgsql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PgMemberDTO pgmdto = new PgMemberDTO();
				
				pgmdto.setPgm_num(rs.getString("m.pgm_num"));
				pgmdto.setPg_type(rs.getString("p.pg_type"));
				pgmdto.setPg_name(rs.getString("p.pg_name"));
				pgmdto.setPgm_date(rs.getString("m.pgm_date"));
				pgmdto.setPgm_issue(rs.getString("m.pgm_issue"));
				
				pglist.add(pgmdto);	
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
				PlaygroundDTO pgdto = new PlaygroundDTO();
				
				pgdto.setPg_type(rs.getString("pg_type"));
				ajaxlist.add(pgdto);
			
			}

		} catch (Exception e) {
			System.out.println(" : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		request.setAttribute("pglist", pglist);
		request.setAttribute("sclist", sclist);
		request.setAttribute("ajaxlist", ajaxlist);
	}
	
	private void deletefacil(HttpServletRequest request) {
		String pgm_num = request.getParameter("pgm_num");
		
		String sql = "DELETE FROM tbl_pg_member WHERE pgm_num=?";
		
		System.out.println(pgm_num);
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pgm_num);
			pstmt.executeUpdate();


		} catch (Exception e) {
			System.out.println(" : " + e);

		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
	
	private void addDateFacil(HttpServletRequest request) {
		String sql = null;
		String a = "INSERT INTO tbl_pg_member (pgm_date, pgm_timecode, m_id, pg_num, pgm_issue) "
				+ "VALUES (?, ?, ?, ?, ?)";
		
		String pgm_date = request.getParameter("addpgm_date");
		
		// 타임코드는 고정(하루전체를 블록 하게된다.)
		String pgm_timecode = "A1111111111111";
		
		String pg_num = "";
		String pgm_issue=request.getParameter("pgm_issue");
		
		//시설물 관리자 admin03은 고정이나 변경될 수 있으므로 남겨둠.
		String m_id = "admin03";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pgm_date);
			pstmt.setString(2, pgm_timecode);
			pstmt.setString(3, m_id);
			pstmt.setString(4, pg_num);
			pstmt.setString(5, pgm_issue);
			pstmt.executeUpdate();


		} catch (Exception e) {
			System.out.println(" : " + e);

		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
}
