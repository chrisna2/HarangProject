package bamboo.model;


import java.sql.Connection;
import java.sql.PreparedStatement;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;

public class A_Bb_Post_Complete_Command implements CommandInterface {
	
	private Connection con;
	private PreparedStatement pstmt;
	private DBConnectionMgr pool;

	public A_Bb_Post_Complete_Command() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DBCP 연결실패 : " + err);
		}
	}

	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {

		try {
		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("admin");
		String m_id = mdto.getM_id();
		con = pool.getConnection();
		
		System.out.println(m_id);
		
		System.out.println(req.getParameter("gongji"));
		
		String sql = "insert into tbl_bamboo (m_id, bb_notice, bb_title, bb_content, bb_count, bb_nickname) values (?,?,?,?,0,?)";
		
		System.out.println(sql);

		String bb_title = (String)req.getParameter("bb_title");
		String bb_nickname = (String)req.getParameter("bb_nickname");
		String bb_content = (String)req.getParameter("bb_content");
		String bb_notice = "N";

		if (null == req.getParameter("gongji")) {

			bb_notice = "N";
		}
		else if (req.getParameter("gongji").equals("on")) {
			
			bb_notice = "Y";
		}
		
		
		
		/*System.out.println(bb_title);
		System.out.println();
		System.out.println(bb_content);
		System.out.println();
		System.out.println(bb_nickname);*/
		
		
			
			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, bb_notice);
			pstmt.setString(3, bb_title);
			pstmt.setString(4, bb_content);
			pstmt.setString(5, bb_nickname);
			

			
			
			pstmt.executeUpdate();
		
			

		} catch (Exception err) {
			System.out.println("U_Bb_Post_Complete에서 에러");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
			
		}
		
		
		
	 	// 대나무숲 학생측 리스트 페이지(메인페이지) 에서 글쓰기를 눌렀을 때
		// 대나무숲 학생이용자의 글 작성 페이지로 이동.
		A_Bb_List_Command goback = new A_Bb_List_Command();		
		String url = goback.processCommand(req, resp);
		
		
		
		return url;
		//return "/HarangProject/bamboo?cmd=BB_LIST;
				
	}
}
