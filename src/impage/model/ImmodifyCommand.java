package impage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.Im2DTO;
import harang.dbcp.DBConnectionMgr;

public class ImmodifyCommand implements CommandInterface {
	
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
		read(request);
		return "/WEB-INF/imPage/immodify.jsp";
	}

	private void read(HttpServletRequest request) {
		pool = DBConnectionMgr.getInstance();
		String sql;
		Im2DTO dto = new Im2DTO();
		
		
		
		try {
			//sql = "SELECT * FROM tbl_member_lesson where lm_num=?;";
			sql="select tl.l_name,tl.l_teacher,lm.lm_year,lm.lm_term,lm.lm_star,lm.lm_hw,lm.lm_attend,lm.lm_group,lm.lm_comment from tbl_lesson tl,tbl_member_lesson lm where  tl.l_num=? and tl.l_num=lm.l_num";
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("l_num"));
			rs = pstmt.executeQuery();
			
			rs.next();
			
			dto.setL_num(request.getParameter("l_num"));
			dto.setL_name(rs.getString("l_name"));
			dto.setL_teacher(rs.getString("l_teacher"));
			dto.setLm_year(rs.getString("lm_year"));
			dto.setLm_term(rs.getString("lm_term"));
			dto.setLm_star(rs.getString("lm_star"));
			dto.setLm_hw(rs.getString("lm_hw"));
			dto.setLm_attend(rs.getString("lm_attend"));
			dto.setLm_group(rs.getString("lm_group"));
			dto.setLm_comment(rs.getString("lm_comment"));
			
			
		} catch (Exception err) {
			System.out.println(err);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		request.setAttribute("read", dto);
	}
		
	

}
