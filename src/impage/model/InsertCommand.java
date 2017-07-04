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

import dto.LessonDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import impage.CommandInterface;
/**
 * 강의평가 작성
 * @author 박주선
 *
 */
public class InsertCommand implements CommandInterface {
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
	//	String a= request.getParameter("l_num");
				
		insert(request);
		
		return "/WEB-INF/imPage/imcomplete.jsp";
	}
	
	/**
	 *  강의평가등록 and 등록시 tt_iscomplete 값 Y로 수정
	 * @param request 서블릿 리퀘스트
	 */
	public void insert(HttpServletRequest request){
		pool = DBConnectionMgr.getInstance();
		String sql;

		// id 세션값 받아오기
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String m_id = member.getM_id();
		
		
	
	
				sql = "INSERT INTO tbl_member_lesson "
						+ "(m_id, l_num, lm_group, lm_year, lm_term, lm_star, lm_hw, lm_attend, lm_comment, lm_num) "
						+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, '')";
			String sql2= "UPDATE tbl_timetable SET tt_iscomplete='Y' WHERE m_id=? and l_num=?";
			try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt2 = con.prepareStatement(sql2);
			pstmt2.setString(1, m_id);
			System.out.println(request.getParameter("l_num"));
			pstmt2.setString(2, request.getParameter("l_num"));
				
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
				pstmt2.executeUpdate();
				System.out.println(request.getParameter("l_num"));
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt);
		}			
			
	}

}
