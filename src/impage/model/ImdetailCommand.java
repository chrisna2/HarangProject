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
 * 강의평가상세보기
 * @author 박주선
 *
 */
public class ImdetailCommand implements CommandInterface {

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
		// TODO Auto-generated method stub
		
		read(request);
		return "/WEB-INF/imPage/imdetail.jsp";
	}
	/**
	 * 강의평가상세보기 메서드
	 * @param request
	 */
	 private void read(HttpServletRequest request) {
		 
			pool = DBConnectionMgr.getInstance();
			String sql;
			Im2DTO dto = new Im2DTO();
			
			// id 세션값 받아오기
			HttpSession session = request.getSession();
			MemberDTO member = (MemberDTO) session.getAttribute("member");
			String m_name = member.getM_name();
			
			try {
				
				sql = "select * from tbl_member_lesson ,tbl_lesson,tbl_member where lm_num=?";
				
				con = pool.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, request.getParameter("lm_num"));
				rs = pstmt.executeQuery();
				
				rs.next();
				dto.setLm_num(request.getParameter("lm_num"));
				dto.setM_name(rs.getString("m_name"));
				dto.setL_teacher(rs.getString("l_teacher"));
				dto.setL_name(rs.getString("l_name"));
				dto.setLm_regdate(rs.getString("lm_regdate"));
				dto.setL_teacher(rs.getString("l_teacher"));
				dto.setLm_attend(rs.getString("lm_attend"));
				dto.setLm_group(rs.getString("lm_group"));
				dto.setLm_hw(rs.getString("lm_hw"));		
				dto.setLm_star(rs.getString("lm_star"));
				dto.setLm_term(rs.getString("lm_term"));
				dto.setLm_year(rs.getString("lm_year"));
				dto.setLm_comment(rs.getString("lm_comment"));
				dto.setM_id(m_name);
				
			} catch (Exception err) {
				System.out.println(err);
			} finally {
				// DBCP 접속해제
				pool.freeConnection(con, pstmt, rs);
			}
			request.setAttribute("read2", dto);
		}
		 
		
		


	
	

}
