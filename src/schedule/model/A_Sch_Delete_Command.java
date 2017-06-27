package schedule.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import harang.dbcp.DBConnectionMgr;

public class A_Sch_Delete_Command implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private DBConnectionMgr pool;

	public A_Sch_Delete_Command() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DBCP 연결실패 : " + err);
		}
	}

	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {


		String s_num = req.getParameter("s_num");
		System.out.println("A_Sch_Delete_Command 에서 테스트 s_num : " + s_num);
		
		String sql = "delete from tbl_schedule where s_num = ?";

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, s_num);
			pstmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("A_Sch_Delete_Command에서 에러 : ");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}

		//System.out.println(req.getParameter("bb_num"));
		
		A_Sch_List_Command goback = new A_Sch_List_Command();		
		String url = goback.processCommand(req, resp);
		
		return url;
	}

}
