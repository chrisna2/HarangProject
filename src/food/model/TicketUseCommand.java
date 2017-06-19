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

public class TicketUseCommand implements CommandInterface {
	
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
		
		String m_id = request.getParameter("m_id");
		String f_num = request.getParameter("f_num");
		String check = request.getParameter("check");
		String result = null;
		
		String sql = null;
		
		if(("use").equals(check)){
			
			sql = "UPDATE tbl_food_member SET fm_isuse = 'used', fm_usedate = NOW() WHERE m_id = ? and f_num = ?";
			result = "used";
		}
		else if(("return").equals(check)){
			
			sql = "UPDATE tbl_food_member SET fm_isuse = 'return', fm_usedate = NOW() WHERE m_id = ? and f_num = ?";
			result = "return";
		}
		
		
		try {
			
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, f_num);
			pstmt.executeUpdate();
			
		} 
		catch (Exception e) {
			System.out.println("ticketUse.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt);
		}
		
		request.setAttribute("result", result);
		return "/WEB-INF/food/ticketResult.jsp";
	}

}
