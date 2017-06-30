package food.model;

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

import dto.FoodMemberDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import paging.PagingBean;
import paging.dto.PagingDto;

/**
 * 식권을 출력하는 클래스
 * @author 나현기 
 * 
 */
public class PrintTicketCommand implements CommandInterface {
	
	//DB 커넥션 4 대장
	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;
	//DBCP 사용
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		String m_id = mdto.getM_id();
		String f_num = request.getParameter("f_num");
		
		String sql = "SELECT fm.fm_regdate, f.f_selldate, f.f_title, f.f_point, fm.fm_isuse, fm.fm_usedate "
				+ "FROM tbl_food_member fm, tbl_food f "
				+ "where f.f_num = fm.f_num and fm.m_id = ? and f.f_num =?";
		
		FoodMemberDTO fmdto = new FoodMemberDTO();
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, f_num);
			rs = pstmt.executeQuery();
			
			rs.next();
				fmdto.setFm_regdate(rs.getString("fm_regdate"));
				fmdto.setF_selldate(rs.getDate("f_selldate"));
				fmdto.setF_title(rs.getString("f_title"));
				fmdto.setF_point(rs.getInt("f_point"));
				fmdto.setFm_isuse(rs.getString("fm_isuse"));
				fmdto.setFm_usedate(rs.getDate("fm_usedate"));
				fmdto.setF_num(f_num);
				
		} 
		catch (Exception e) {
			System.out.println("ticketlist.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
		
		request.setAttribute("food", fmdto);
		request.setAttribute("thecode", m_id+"@"+f_num);
		
		return "/WEB-INF/food/ticketPrint.jsp";
	}

}
