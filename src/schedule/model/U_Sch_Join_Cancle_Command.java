package schedule.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import schedule.CommandInterface;


/**
 * 
 * 사용자가 학사일정페이지에서 참가가능한 일정에 참가신청 해 놓은 것을 취소 할 때 필요한 클래스
 * 
 * 
 * @author 김민준 KIM MIN JOON
 *
 */
public class U_Sch_Join_Cancle_Command implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private DBConnectionMgr pool;

	public U_Sch_Join_Cancle_Command() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DBCP 연결실패 : " + err);
		}
	}

	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {

		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		
		

		String m_id = mdto.getM_id();
		String s_num = req.getParameter("s_num");
		String sql = "DELETE FROM tbl_schedule_member WHERE s_num=? and m_id=?";

		
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, s_num);
			pstmt.setString(2, m_id);
			pstmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("U_Sch_Join_Cancle_Command에서 에러 : ");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}

		//System.out.println(req.getParameter("bb_num"));
		
		U_Sch_List_Command goback = new U_Sch_List_Command();		
		String url = goback.processCommand(req, resp);
		
		return url;
	}

}
