package bamboo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.BambooDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;

public class U_Bb_Content_Command implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private DBConnectionMgr pool;
	private ResultSet rs;

	public U_Bb_Content_Command() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DBCP 연결실패 : " + err);
		}
	}

	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {

		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		String m_id = mdto.getM_id();
		
		
		String bb_num = req.getParameter("bb_num");
		System.out.println("U_Bb_Content 에서 테스트 bb_num : " + bb_num);

		String sql = null;
		
		
		
		try {
			con = pool.getConnection();

			sql = "select * from tbl_bamboo where bb_num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bb_num);
			rs = pstmt.executeQuery();
			BambooDTO bbdto = new BambooDTO(); 

			if (rs.next()) {
				bbdto.setBb_num(rs.getString("bb_num"));
				bbdto.setM_id(rs.getString("m_id"));
				bbdto.setBb_notice(rs.getString("bb_notice"));
				bbdto.setBb_title(rs.getString("bb_title"));
				bbdto.setBb_content(rs.getString("bb_content").replace("\n", "<br>"));
				bbdto.setBb_regdate(rs.getDate("bb_regdate"));
				bbdto.setBb_count(rs.getInt("bb_count"));
				bbdto.setBb_nickname(rs.getString("bb_nickname"));

				req.setAttribute("bbcon", bbdto);
				
				// System.out.println(rs.getString("b_content"));

			}
		} catch (Exception err) {
			System.out.println("U_Bb_Content 에서 에러 ");
			err.printStackTrace();

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return "/WEB-INF/bamboo/u_bb_content.jsp";
	}
}
