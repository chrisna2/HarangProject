package ajax.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.CalanderDTO;
import harang.dbcp.DBConnectionMgr;

public class FoodCommand implements CommandInterface {
	
	//DB 커넥션 4 대장
	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;
	//DBCP 사용
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		return menulist();
	}
	
	public ArrayList menulist(){
		
		String sql = "SELECT f_selldate, f_title, f_num FROM tbl_food where f_selldate > sysdate()";
		ArrayList flist  = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CalanderDTO cdto = new CalanderDTO();
				
				cdto.setStart(rs.getString("f_selldate"));
				cdto.setTitle(rs.getString("f_title"));
				cdto.setId(rs.getString("f_num"));
				cdto.setAllDay(true);
				
				flist.add(cdto);
			}
		} 
		catch (Exception e) {
			System.out.println( "menuList.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		return flist;
	}

}




	
