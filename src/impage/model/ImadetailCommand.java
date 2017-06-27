package impage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dto.Im2DTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;

public class ImadetailCommand implements CommandInterface {

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
		read2(request);
		return "/WEB-INF/imPage/a_imdetail.jsp";
	}
	
	 private void read2(HttpServletRequest request) {
		 pool = DBConnectionMgr.getInstance();
			String sql;
			
			ArrayList list = new ArrayList();
			sql = "select * from tbl_warning where lm_num=?";
			
			try {
				
				
				
				con = pool.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, request.getParameter("lm_num"));
				rs = pstmt.executeQuery();
				
				
				while (rs.next()) {
					Im2DTO dto = new Im2DTO();
				dto.setW_num(rs.getString("w_num"));
				dto.setM_id(rs.getString("m_id"));
				dto.setW_regdate(rs.getString("w_regdate"));
				dto.setW_comment(rs.getString("w_comment"));
				list.add(dto);
				}
				
				
			} catch (Exception err) {
				System.out.println(err);
			} finally {
				// DBCP 접속해제
				pool.freeConnection(con, pstmt, rs);
			}
			request.setAttribute("read4", list);
		}
		 
	

	private void read(HttpServletRequest request) {
		 
			pool = DBConnectionMgr.getInstance();
			String sql;
			Im2DTO dto = new Im2DTO();
			
			
			
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
				
				
			} catch (Exception err) {
				System.out.println(err);
			} finally {
				// DBCP 접속해제
				pool.freeConnection(con, pstmt, rs);
			}
			request.setAttribute("read3", dto);
		}
		 
		
		


	
	

}
