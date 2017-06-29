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

	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs;

	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 예약목록중 [삭제] 선택된 예약 .
		String delete = request.getParameter("delete");

		// [삭제] 완료를 위한 변수.
		String deleteOK = request.getParameter("deleteOK");

		loadlist(request);

		if (null != delete) {
			tossConfirm(request, delete);
		}

		if (null != deleteOK) {
			deleteOK(request, deleteOK);
			loadlist(request);
		}

		return "/WEB-INF/facil/a_facilities_manager.jsp";
	}

	public void loadlist(HttpServletRequest request) {
		String sql = null;

		ArrayList list = new ArrayList();

		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");

		// 초기 접속시 출력되는 테이블 SQL QUERY
		if (null == (keyfield)) {
			sql = "SELECT p.pg_point, m.pgm_num, m.pg_num, m.m_id, m.pgm_regdate, m.pgm_timecode, p.pg_type, p.pg_name, m.pgm_date"
					+ " FROM tbl_pg_member m, tbl_playground p" + " WHERE m.pg_num = p.pg_num ORDER BY m.pgm_num DESC";
		}

		else {
			// 검색 SQL QUERY
			sql = "SELECT p.pg_point, m.pgm_num, m.pg_num, m.m_id, m.pgm_regdate, m.pgm_timecode, p.pg_type, p.pg_name, m.pgm_date"
					+ " FROM tbl_pg_member m, tbl_playground p" + " WHERE m.pg_num = p.pg_num" + " AND " + keyword
					+ " LIKE '%" + keyfield + "%' ORDER BY m.pgm_num DESC";

			// System.out.println(sql);
		}

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				PgMemberDTO pgdto = new PgMemberDTO();

				pgdto.setPgm_num(rs.getString("m.pgm_num"));
				pgdto.setPgm_regdate(rs.getString("m.pgm_regdate"));
				pgdto.setM_id(rs.getString("m.m_id"));
				pgdto.setPg_type(rs.getString("p.pg_type"));
				pgdto.setPg_name(rs.getString("p.pg_name"));
				pgdto.setPgm_date(rs.getString("m.pgm_date"));
				pgdto.setPgm_timecode(rs.getString("m.pgm_timecode"));
				pgdto.setPg_point(rs.getInt("p.pg_point"));

				list.add(pgdto);
			}

		} catch (Exception e) {
			System.out.println("a_facilities_manager.jsp : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		request.setAttribute("keyword", keyword);
		request.setAttribute("keyfield", keyfield);
		request.setAttribute("list", list);
	}

	// 리스트에서 '삭제'할 목록을 가져옴.
	public void tossConfirm(HttpServletRequest request, String _delete) {

		String sql = null;
		String pgm_num = _delete;
		PgMemberDTO pgdto = null;
		// System.out.println(r);
		sql = "SELECT p.pg_point, m.pgm_num, m.pg_num, m.m_id, m.pgm_regdate, m.pgm_timecode, p.pg_type, p.pg_name, m.pgm_date "
				+ "FROM tbl_pg_member m, tbl_playground p WHERE m.pg_num = p.pg_num "
				+ "AND m.pgm_num = ? ORDER BY m.pgm_num DESC";

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pgm_num);
			rs = pstmt.executeQuery();

			pgdto = new PgMemberDTO();

			rs.next();
			pgdto.setPgm_num(rs.getString("m.pgm_num"));
			pgdto.setPgm_regdate(rs.getString("m.pgm_regdate"));
			pgdto.setM_id(rs.getString("m.m_id"));
			pgdto.setPg_type(rs.getString("p.pg_type"));
			pgdto.setPg_name(rs.getString("p.pg_name"));
			pgdto.setPgm_date(rs.getString("m.pgm_date"));
			pgdto.setPgm_timecode(rs.getString("m.pgm_timecode"));
			pgdto.setPg_point(rs.getInt("p.pg_point"));

		} catch (Exception e) {
			System.out.println("a_facilities_manager.jsp : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		request.setAttribute("pgdto", pgdto);
	}

	// 삭제 메서드.
	private void deleteOK(HttpServletRequest request, String pgm_num) {
		String sql = null;
		sql = "DELETE FROM tbl_pg_member WHERE pgm_num=?";
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pgm_num);
			
			// DELETE는 executeUpdate. return값은 int.
			pstmt.executeUpdate(); 

		} catch (Exception e) {
			System.out.println("a_facilities_manager.jsp : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

}
