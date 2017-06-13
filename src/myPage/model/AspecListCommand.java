package myPage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.CertiDTO;
import harang.dbcp.DBConnectionMgr;


public class AspecListCommand implements CommandInterface {
	
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
		
		
		ArrayList list = new ArrayList();
		pool = DBConnectionMgr.getInstance();
		
		String sql ="SELECT * FROM tbl_certificate;";
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {

				
				CertiDTO dto = new CertiDTO();
				
				dto.setC_num(rs.getString("c_num"));
				dto.setC_name(rs.getString("c_name"));
				dto.setC_agency(rs.getString("c_agency"));
				dto.setC_point(rs.getInt("c_point"));
				
				list.add(dto);

				
				
			}
			
			
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}		
		request.setAttribute("aspeclist", list);
		return "/WEB-INF/myPage/a_specList.jsp";
	}

}
