package bamboo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import harang.dbcp.DBConnectionMgr;

public class A_Bb_Delete_Command implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private DBConnectionMgr pool;

	public A_Bb_Delete_Command() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DBCP 연결실패 : " + err);
		}
	}

	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {


		String bb_num = req.getParameter("bb_num");
		System.out.println(bb_num);
		System.out.println(req.getParameter("m_id"));
		
		String sql = "delete from harang.tbl_bamboo where bb_num = ?";

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bb_num);
			pstmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("A_Bb_Delete_Command에서 에러 : ");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}

		//System.out.println(req.getParameter("bb_num"));
		
		A_Bb_List_Command goback = new A_Bb_List_Command();		
		String url = goback.processCommand(req, resp);
		
		return url;
	}

}
