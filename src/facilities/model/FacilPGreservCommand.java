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

import dto.PgMemberDTO;
import harang.dbcp.DBConnectionMgr;

public class FacilPGreservCommand implements CommandInterface {
	
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs;
	
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
/*		사용자, 운동장 예약 페이지
		 달력을 바탕으로 해당 날짜의 예약 목록을 불러들여온다.
		 
		 날짜를 실제로 받게 되면 추가 될 변수.
		 //String selectDate = request.getParameter("selectDate");
*/		
		
		String selectDate = "2017-06-28";
		loadList(request, selectDate);
		
		
		return "/WEB-INF/facil/facilities_playground.jsp";
	}
	
	public void loadList(HttpServletRequest request, String selectDate){
		
		ArrayList list = new ArrayList();
		String sql = "SELECT pg_type FROM  tbl_playground Group by pg_type";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PgMemberDTO pgdto = new PgMemberDTO();
				pgdto.setPg_type(rs.getString("pg_type"));
				
				list.add(pgdto);
				}

		} catch (Exception e) {
			System.out.println("a_facilities_manager.jsp : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		request.setAttribute("list", list);
		
	}

}
