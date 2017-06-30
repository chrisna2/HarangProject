package bamboo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.BambooDTO;
import harang.dbcp.DBConnectionMgr;

/**
 * 
 * 사용자가 대나무숲에 작성한 글을 수정할 때 수정하기 위한 페이지로 이동할 때 필요한 클래스
 * 
 * 
 * @author 김민준 KIM MIN JOON
 *
 */
public class U_Bb_Con_Update_Command implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private DBConnectionMgr pool;
	private ResultSet rs;

	public U_Bb_Con_Update_Command() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DBCP 연결실패 : " + err);
		}
	}

	/**
	 * 
	 * 사용자가 대나무숲에 작성한 긍를 수정할 때 기존에 입력된 글의 내용을 불러오는 메소드
	 * 
	 */
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {

		BambooDTO bbdto = null;

		String bb_num = req.getParameter("bb_num");
		// System.out.println("U_Bb_Content 에서 테스트 bb_num : " + bb_num);

		String sql = null;

		try {
			con = pool.getConnection();

			sql = "select * from tbl_bamboo where bb_num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bb_num);
			rs = pstmt.executeQuery();

			// 본문 불러오기
			if (rs.next()) {
				bbdto = new BambooDTO();
				bbdto.setBb_num(rs.getString("bb_num"));
				bbdto.setM_id(rs.getString("m_id"));
				bbdto.setBb_notice(rs.getString("bb_notice"));
				bbdto.setBb_title(rs.getString("bb_title"));
				bbdto.setBb_content(rs.getString("bb_content"));
				bbdto.setBb_regdate(rs.getDate("bb_regdate"));
				bbdto.setBb_count(rs.getInt("bb_count"));
				bbdto.setBb_nickname(rs.getString("bb_nickname"));

				// System.out.println(rs.getString("b_content"));

			}

			req.setAttribute("bbcon", bbdto);

		} catch (Exception err) {
			System.out.println("U_Bb_Con_Up 에서 에러 ");
			err.printStackTrace();

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return "/WEB-INF/bamboo/u_bb_con_update.jsp";
	}
}
