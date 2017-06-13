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

import dto.BookDTO;
import harang.dbcp.DBConnectionMgr;

public class mainCommand implements CommandInterface {
	
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
		
		request.setAttribute("harangdinmain", list());
		
		return "/WEB-INF/harangdin/harangdin_main.jsp";
		
	}
	
	public ArrayList list(){
		
		ArrayList list = new ArrayList();
		pool = DBConnectionMgr.getInstance();
		
		String sql ="SELECT b_num, b_name, b_writer, b_pub, b_want from tbl_book";
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {

				
				BookDTO dto = new BookDTO();
				
				dto.setB_num(rs.getString("b_num"));
				dto.setB_name(rs.getString("b_name"));
				dto.setB_writer(rs.getString("b_writer"));
				dto.setB_pub(rs.getString("b_pub"));
				dto.setB_want(rs.getInt("b_want"));
				
				list.add(dto);
				
			}
			
			
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}
		return list;	
	}

}
