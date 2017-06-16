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

import dto.PlaygroundDTO;
import harang.dbcp.DBConnectionMgr;

public class FacilMainCommand implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs;
	DBConnectionMgr pool;
	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 처음 출력시 예약 리스트 출력.
		 * 
		 * 
		 * 
		 */
		
		// 임시 디버깅용 ID
		String ID = "201705020";
		loadlist(request);
		
		return "/WEB-INF/facil/facilities_main.jsp";
	}
	
	public void loadlist(HttpServletRequest request){
		
		String sql = "SELECT * FROM tbl_pg_memeber WHERE m_id";
		ArrayList list = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				PlaygroundDTO pgdto = new PlaygroundDTO();

				pgdto.setPg_num(rs.getString("pg_num"));
				pgdto.setPg_type(rs.getString("pg_type"));
				pgdto.setPg_name(rs.getString("pg_name"));
				pgdto.setPg_content(rs.getString("pg_content"));
				pgdto.setPg_point(rs.getInt("pg_point"));

				list.add(pgdto);
			}

		} catch (Exception e) {
			System.out.println("facilities_main.jsp : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		request.setAttribute("list", list);
	}

}
