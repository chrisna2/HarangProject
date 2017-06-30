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
/**
 * 강의평가수정
 * @author 박주선
 *
 */
public class Immodify2Command implements CommandInterface {
	// DB 커넥션 3 대장
				Connection con;
				PreparedStatement pstmt;
				DataSource ds;
				ResultSet rs;
				// DBCP 사용
				DBConnectionMgr pool;

		public Object processCommand(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			update(request);
			return "/WEB-INF/imPage/imupdate.jsp";
		}

		/**
		 * 강의평가수정 메서드
		 * @param request
		 */
		private void update(HttpServletRequest request) {
			pool = DBConnectionMgr.getInstance();
			// id 세션값 받아오기
			HttpSession session = request.getSession();
			MemberDTO member = (MemberDTO) session.getAttribute("member");
			String m_id = member.getM_id();
			
			try{
				String sql="update tbl_member_lesson set lm_year=?, lm_term=?, lm_star=?, lm_hw=?,lm_attend=?,lm_group=?,lm_comment=? where l_num=? and m_id=?";
			   
				  
				   con = pool.getConnection();
				   pstmt = con.prepareStatement(sql);
				   System.out.println(request.getParameter("lm_num"));
				   System.out.println(request.getParameter("lm_year"));
				  
					pstmt.setString(1, request.getParameter("lm_year"));
					pstmt.setString(2, request.getParameter("lm_term"));
					pstmt.setString(3, request.getParameter("lm_star"));
					pstmt.setString(4, request.getParameter("lm_hw"));
					pstmt.setString(5, request.getParameter("lm_attend"));
					pstmt.setString(6, request.getParameter("lm_group"));
					pstmt.setString(7, request.getParameter("lm_comment"));
					pstmt.setString(8, request.getParameter("l_num"));
					pstmt.setString(9, m_id);
					pstmt.executeUpdate();
					
			}catch (Exception e) {
				System.out.println("updateBoard()에서 오류 ");
				e.printStackTrace();
			}

			finally {
				pool.freeConnection(con,pstmt,rs);
			}
				
			request.removeAttribute("read");
			
		}

		
			
		

	}

