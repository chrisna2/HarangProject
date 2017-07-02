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
 * 강의평가작성할때 글정보
 * @author 박주선
 *
 */
public class ImmakeCommand implements CommandInterface {

	// DB 커넥션 3 대장
		Connection con;
		PreparedStatement pstmt;
		DataSource ds;
		ResultSet rs;
		// DBCP 사용
		DBConnectionMgr pool;
	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String a = request.getParameter("l_num");
//		System.out.println(a);
		read(request);
		
		
		
		
	
		return "/WEB-INF/imPage/immake.jsp";
	}

	
	

	/**
	 * 글정보 불러오기
	 * @param request
	 */
	private void read(HttpServletRequest request) {
		// TODO Auto-generated method stub

		pool = DBConnectionMgr.getInstance();
		String sql;
		Im2DTO dto = new Im2DTO();
		
		
		
		try {
			//sql = "SELECT * FROM tbl_member_lesson where lm_num=?;";
			sql="select tl.l_name,tl.l_teacher from tbl_lesson tl where  tl.l_num=?";
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("l_num"));
			rs = pstmt.executeQuery();
			
			rs.next();
			
			dto.setL_num(request.getParameter("l_num"));
			dto.setL_name(rs.getString("l_name"));
			dto.setL_teacher(rs.getString("l_teacher"));
			
		} catch (Exception err) {
			System.out.println(err);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		request.setAttribute("read", dto);
	}
	

}
