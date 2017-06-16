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
		String a = request.getParameter("l_num");
		
		String read = request.getParameter("read");
		System.out.println(a);
		read(request);
		
		
		
		
	
		return "/WEB-INF/imPage/immake.jsp";
	}

	
	


	private void read(HttpServletRequest request) {
		// TODO Auto-generated method stub

		pool = DBConnectionMgr.getInstance();
		String sql;
		Im2DTO dto = new Im2DTO();
		
		
		
		try {
			//sql = "SELECT * FROM tbl_member_lesson where lm_num=?;";
			sql="select tl.l_name,tl.l_teacher from tbl_member_lesson tml, tbl_lesson tl where  tl.l_num=?";
			
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
	
	
	
	
	public void insert(HttpServletRequest request){
		pool = DBConnectionMgr.getInstance();
		String sql;

		// id 세션값 받아오기
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String m_id = member.getM_id();
			
				sql = "INSERT INTO tbl_member_lesson "
						+ "(m_id, l_num, lm_group, lm_year, lm_term, lm_star, lm_hw, lm_attend, lm_comment) "
						+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
				pstmt.setString(1, m_id);
				
				pstmt.setString(2, request.getParameter("l_num"));
				pstmt.setString(3, request.getParameter("lm_group"));
				pstmt.setString(4, request.getParameter("lm_year"));
				pstmt.setString(5, request.getParameter("lm_term"));
				pstmt.setString(6, request.getParameter("lm_star"));
				pstmt.setString(7, request.getParameter("lm_hw"));
				pstmt.setString(8, request.getParameter("lm_attend"));
				pstmt.setString(9, request.getParameter("lm_comment"));
				
				pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt);
		}			
	
				
	}
	

}
