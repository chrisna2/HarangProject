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

import dto.Im2DTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import impage.CommandInterface;
/**
 * 강의평가삭제(+신고리스트) 
 * @author 박주선
 *
 */
public class ImadeleteCommand implements CommandInterface {

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
		// TODO Auto-generated method stub
		System.out.println(request.getParameter("lm_num"));
		delete(request);
		return "/WEB-INF/imPage/imdcomplete.jsp";
	}
	/**
	 * 강의평가 삭제
	 * @param request
	 */
	private void delete(HttpServletRequest request) {

		pool = DBConnectionMgr.getInstance();
		String sql, sql2;
		

	
		try {
			con = pool.getConnection();
			sql = "delete from tbl_warning where lm_num=?";

			pstmt = con.prepareStatement(sql);
			
			System.out.println(request.getParameter("lm_num"));
			pstmt.setString(1, request.getParameter("lm_num"));

			

			sql2 = "delete from tbl_member_lesson where lm_num=?";

			pstmt2 = con.prepareStatement(sql2);
			

			pstmt2.setString(1, request.getParameter("lm_num"));

			pstmt.executeUpdate();
			pstmt2.executeUpdate();
		} catch (Exception err) {
			System.out.println(err);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
	}

}
