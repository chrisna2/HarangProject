package schedule.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.activation.DataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PgMemberDTO;
import dto.SrMemberDTO;
import facilities.model.FacilPGreservCommand;
import facilities.model.FacilSRreservCommand;
import harang.dbcp.DBConnectionMgr;

public class A_Sch_Post_Command implements CommandInterface {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DBConnectionMgr pool;
	
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {

		
		
		
		srList(req);
		pgList(req);
		
		
		
		
		return "/WEB-INF/schedule/a_sch_post.jsp";
	}
	
	public void srList(HttpServletRequest request) {

		ArrayList list = new ArrayList();
		String sql = "SELECT sr_type FROM  tbl_studyroom Group by sr_type";

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SrMemberDTO srdto = new SrMemberDTO(); 
				srdto.setSr_type(rs.getString("sr_type"));

				list.add(srdto);
			}

		} catch (Exception e) {
			System.out.println("시설 스터디룸 예약에서 에러. : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		request.setAttribute("srlist", list);
	}
	public void pgList(HttpServletRequest request) {
		
		ArrayList list = new ArrayList();
		String sql = "SELECT pg_type FROM  tbl_playground Group by pg_type";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				PgMemberDTO srdto = new PgMemberDTO(); 
				srdto.setPg_type(rs.getString("pg_type"));
				
				list.add(srdto);
			}
			
		} catch (Exception e) {
			System.out.println("시설 운동장 예약에서 에러. : " + e);
			
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		request.setAttribute("pglist", list);
	}
	
	
}
