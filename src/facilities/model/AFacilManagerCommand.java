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
		System.out.println("facilmanger - loadlist 페이지이동직전");
		return "/WEB-INF/facil/a_facilities_manager.jsp";
	}

	public void loadlist(HttpServletRequest request) {
		String sql = null;

		ArrayList list = new ArrayList();

		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfiled");
		
		
		// 초기 접속시 출력되는 테이블 SQL QUERY
		if (null == (keyfield)) {

			/*sql = "SELECT pgm_num, pg.pgm_regdate, pg.m_id, "
					+ "(SELECT pg_type FROM tbl_playground WHERE pg_num = pg.pg_num) AS pgm_ftype, "
					+ "(SELECT pg_name FROM tbl_playground WHERE pg_num = pg.pg_num) AS pgm_fname, "
					+ "pg.pgm_date, pg.pgm_timecode " 
					+ "FROM tbl_pg_member pg ORDER BY pg.pgm_regdate DESC";*/

			sql = "SELECT m.pgm_num, m.pg_num, m.m_id, m.pgm_regdate, m.pgm_timecode, p.pg_type, p.pg_name, m.pgm_date" 
				  +" FROM tbl_pg_member m, tbl_playground p"
				  +" WHERE m.pg_num = p.pg_num ORDER BY m.pgm_num DESC";
		}


		else {
			//이전 쿼리문
			// 검색 셀렉트 	예약번호, 학번[ID],	시설 종류,	시설명, 호수, 예약날짜
			/*sql = "SELECT pgm_num, pg.pgm_regdate, pg.m_id, "
					+"(SELECT pg_type FROM tbl_playground WHERE pg_num = pg.pg_num) AS pgm_ftype, "
					+"(SELECT pg_name FROM tbl_playground WHERE pg_num = pg.pg_num) AS pgm_fname, "
					+"pg.pgm_date, pg.pgm_timecode " 
					+"FROM tbl_pg_member pg WHERE "
					+keyword
					+" like '%" 
					+keyfield
					+"%' ORDER BY pg.pgm_regdate DESC";*/
			
			// 검색 SQL QUERY
			sql = "SELECT m.pgm_num, m.pg_num, m.m_id, m.pgm_regdate, m.pgm_timecode, p.pg_type, p.pg_name, m.pgm_date" 
			+ " FROM tbl_pg_member m, tbl_playground p"
			+ " WHERE m.pg_num = p.pg_num"
			+ " AND "
			+ keyword
			+ " LIKE '%"
			+ keyfield
			+ "%' ORDER BY m.pgm_num DESC";
			
			System.out.println(sql);
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

}
