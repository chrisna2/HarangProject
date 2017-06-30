package schedule.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.BambooDTO;
import dto.ScheduleDTO;
import harang.dbcp.DBConnectionMgr;

public class A_Sch_Con_Update_Command implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private DBConnectionMgr pool;
	private ResultSet rs;

	public A_Sch_Con_Update_Command() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DBCP 연결실패 : " + err);
		}
	}

	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {


		A_Sch_Post_Command aspc = new A_Sch_Post_Command();
		
		aspc.srList(req);
		aspc.pgList(req);
		
		
		
		String s_num = req.getParameter("s_num");
		// System.out.println("U_Bb_Content 에서 테스트 bb_num : " + bb_num);

		String sql = null;

		try {
			con = pool.getConnection();

			sql = "select * from tbl_schedule where s_num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, s_num);
			rs = pstmt.executeQuery();

			// 본문 불러오기
			if (rs.next()) {
				ScheduleDTO schdto = new ScheduleDTO();
				schdto.setS_num(rs.getString("s_num"));
				schdto.setS_grade(rs.getString("s_grade"));
				schdto.setS_ispoint(rs.getString("s_ispoint"));
				schdto.setS_title(rs.getString("s_title"));
				schdto.setS_content(rs.getString("s_content"));
				schdto.setS_dstart(rs.getString("s_dstart"));
				schdto.setS_dend(rs.getString("s_dend"));
				schdto.setS_dept(rs.getString("s_dept"));
				schdto.setS_location(rs.getString("s_location"));
				schdto.setS_rstart(rs.getString("s_rstart"));
				schdto.setS_rend(rs.getString("s_rend"));
				schdto.setS_point(rs.getString("s_point"));

				// System.out.println(rs.getString("b_content"));

				req.setAttribute("schcon", schdto);
			}


		} catch (Exception err) {
			System.out.println("A_Sch_Con_Up 에서 에러 ");
			err.printStackTrace();

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return "/WEB-INF/schedule/a_sch_update.jsp";
	}
}
