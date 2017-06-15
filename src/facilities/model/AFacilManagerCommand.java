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
import harang.dbcp.DBConnectionMgr;

public class AFacilManagerCommand implements CommandInterface {

	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;

	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		loadlist(request);
		return "/WEB-INF/facil/a_facilities_manager.jsp";
	}

	public void loadlist(HttpServletRequest request) {
		String sql = null;

		ArrayList list = new ArrayList();

		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfiled");

		if (null == (keyfield)) {

			sql = "SELECT pgm_num, pg.pgm_regdate, pg.m_id, "
					+ "(SELECT pg_type FROM tbl_playground WHERE pg_num = pg.pg_num) AS pgm_ftype, "
					+ "(SELECT pg_name FROM tbl_playground WHERE pg_num = pg.pg_num) AS pgm_fname, "
					+ "pg.pgm_date, pg.pgm_timecode " + "FROM tbl_pg_member pg ORDER BY pg.pgm_regdate DESC";
		}

		else {
			sql = "SELECT * FROM tbl_certificate where " + keyword + " like '%" + keyfield + "%' order by c_num";
		}

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				PgMemberDTO pgdto = new PgMemberDTO();

				pgdto.setPgm_num(rs.getString("pgm_num"));	
				pgdto.setPgm_regdate(rs.getString("pgm_regdate"));
				pgdto.setM_id(rs.getString("m_id"));
				pgdto.setPgm_ftype(rs.getString("pgm_ftype"));
				pgdto.setPgm_fname(rs.getString("pgm_fname"));
				pgdto.setPgm_date(rs.getString("pgm_date"));
				pgdto.setPgm_timecode(rs.getString("pgm_timecode"));

				list.add(pgdto);
			}

		} catch (Exception e) {
			System.out.println("a_pointcheck.jsp : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		request.setAttribute("list", list);
	}

}
