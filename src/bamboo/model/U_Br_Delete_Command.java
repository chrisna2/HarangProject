package bamboo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bamboo.CommandInterface;
import harang.dbcp.DBConnectionMgr;

/**
 * 
 * 대나무숲 게시판에서 사용자가 자신이 등록한 댓글을 삭제할 때 쓰이는 클래스
 * 
 * @author 김민준 KIM MIN JOON
 *
 */
public class U_Br_Delete_Command implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private DBConnectionMgr pool;

	public U_Br_Delete_Command() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DBCP 연결실패 : " + err);
		}
	}

	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {


		String br_num = req.getParameter("br_num");
		String sql = "delete from harang.tbl_bbreply where br_num = ?";

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, br_num);
			pstmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("U_Br_Delete_Command에서 에러 : ");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}

		//System.out.println(req.getParameter("bb_num"));
		
		U_Bb_Content_Command goback = new U_Bb_Content_Command();		
		String url = goback.processCommand(req, resp);
		
		return url;
	}

}
