package facilities.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.activation.DataSource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
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

		loadList(request);

		return "/WEB-INF/facil/a_facilities_pg_schedule.jsp";
	}

	public void loadList(HttpServletRequest request) {

		String sql = "SELECT * FROM tbl_sr_member WHERE srm_issue !='학생예약'";

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SrMemberDTO srmdto = new SrMemberDTO();
				
			}

		} catch (Exception e) {
			System.out.println(" : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	};
}
