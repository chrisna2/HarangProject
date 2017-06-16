package harangdin.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import harang.dbcp.DBConnectionMgr;
import paging.PagingBean;
import paging.dto.PagingDto;


public class RegistProcCommand implements CommandInterface {
	
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
		
		pool = DBConnectionMgr.getInstance();
		
		String sql="INSERT INTO tbl_book (m_id, b_choice, b_want, b_stock, b_name,  b_writer, b_pub, b_iscomplete) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, '거래')";
		
			try {
			
				
				
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, request.getParameter("m_id"));
			pstmt.setString(2, request.getParameter("b_choice"));
			pstmt.setInt(3, Integer.parseInt(request.getParameter("b_want")));
			pstmt.setInt(4, Integer.parseInt(request.getParameter("b_stock")));
			pstmt.setString(5, request.getParameter("b_name"));
			pstmt.setString(6, request.getParameter("b_writer"));
			pstmt.setString(7, request.getParameter("b_pub"));
			
			pstmt.executeUpdate();

			
			
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt);
		}
			
		HarangdinMainCommand goback = new HarangdinMainCommand();
		String url = (String) goback.processCommand(request, response);
			
		return url;
		//return "/WEB-INF/harangdin/book_regist.jsp";
	}
	
}
