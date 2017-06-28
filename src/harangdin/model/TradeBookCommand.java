package harangdin.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.BookDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import login.LoginBean;
import point.PointBean;

public class TradeBookCommand implements CommandInterface{

	//DB 커넥션 3 대장
	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;
	//DBCP 사용
	DBConnectionMgr pool;
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String buyerId = maxId(request);
		
		PointBean point = new PointBean();
		//point.tradePoint(r_content, giver_point, r_point, giver_id, haver_id)
		
		
		
		return "/WEB-INF/harangdin/list_selling.jsp";
	}
	
	
	
	
	public String maxId(HttpServletRequest request){
		
		String b_num = request.getParameter("b_num");
		String bh_want = request.getParameter("bh_want");
		
		String m_id = null;
		
		String sql="SELECT m_id FROM tbl_b_hunter where b_num=? and bh_want=?";
		
		pool = DBConnectionMgr.getInstance();
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b_num);
			pstmt.setString(2, bh_want);			
			rs = pstmt.executeQuery();
				
			rs.next();
			m_id = rs.getString("m_id");
			
			
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}
		return m_id;
	}
	
}