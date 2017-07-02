package impage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import impage.CommandInterface;
/**
 * 강의평가 게시글신고 하기
 * @author 박주선
 *
 */
public class ImwarningCommand implements CommandInterface {
	// DB 커넥션 3 대장
	Connection con;
	PreparedStatement pstmt;
	PreparedStatement pstmt2;
	DataSource ds;
	ResultSet rs;
	// DBCP 사용
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// String a= request.getParameter("l_num");

		insert(request);

		return "/WEB-INF/imPage/imwaring.jsp";
	}
	/**
	 *  신고등록메소드
	 * @param request 서블릿 리퀘스트
	 */
	public void insert(HttpServletRequest request) {
		pool = DBConnectionMgr.getInstance();
		String sql;

		// id 세션값 받아오기
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String m_id = member.getM_id();
		
		sql = "INSERT INTO tbl_warning (lm_num, m_id,w_regdate, w_comment) " + "VALUES(?,?,sysdate(),?)";

		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("lm_num"));
			pstmt.setString(2, m_id);
			pstmt.setString(3, request.getParameter("w_comment"));

			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println(err);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt);
		}

	}

}
