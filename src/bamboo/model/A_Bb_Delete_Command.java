package bamboo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import harang.dbcp.DBConnectionMgr;

/**
 * 
 * 관리자가 대나무숲 게시판의 글을 지울때를 위한 클래스
 * 
 * @author 김민준 KIM MIN JOON
 *
 */
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
	
	/**
	 * 관리자가 대나무숲 게시판의 글을 지울때 사용되는 메소드
	 */
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
