package bamboo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.BbreplyDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;

public class U_Br_List_Command implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public U_Br_List_Command() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DBCP 연결실패 : " + err);
		}
	}

	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {

		req.setAttribute("bblist", brlist(req));

		return "/WEB-INF/bamboo/u_bb_list.jsp";
	}

	public ArrayList brlist(HttpServletRequest req) {
		HttpSession session = req.getSession();

		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		String m_id = mdto.getM_id();

		// System.out.println("Bb_List_Command에서 Test : " + m_id);

		ArrayList list = new ArrayList();
		try {
			con = pool.getConnection();

			String sql;
			String bb_num = req.getParameter("bb_num");

			sql = "SELECT * FROM harang.tbl_bbreply where bb_num ='" +bb_num+"'";
			pstmt = con.prepareStatement(sql);
			//System.out.println("U_Br_List_Command에서 테스트. sql : " + sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				BbreplyDTO brdto = new BbreplyDTO();
				brdto.setM_id(rs.getString("m_id"));
				brdto.setBr_num(rs.getString("br_num"));
				brdto.setBb_num(rs.getString("bb_num"));
				brdto.setBr_coment(rs.getString("br_coment"));
				brdto.setBr_nickname(rs.getString("br_nickname"));
				brdto.setBr_regdate(rs.getDate("br_regdate"));

				list.add(brdto);

			}

		} catch (

		Exception err) {
			System.out.println("U_Br_List_Command에서 오류");
			err.printStackTrace();

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return list;
	}

}
