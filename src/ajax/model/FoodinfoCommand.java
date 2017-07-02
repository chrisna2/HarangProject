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

import ajax.CommandInterface;
import dto.CalanderDTO;
import dto.FoodDTO;
import harang.dbcp.DBConnectionMgr;

public class FoodinfoCommand implements CommandInterface {
	
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
		
		return menuinfo(request);
	}
	
	public ArrayList menuinfo(HttpServletRequest request){
		
		String f_num = request.getParameter("f_num");
		
		String sql = "SELECT f_selldate, f_title, f_num, f_point, f_content FROM tbl_food where f_num = ?";
		ArrayList flist  = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, f_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				FoodDTO fdto = new FoodDTO();
				
				fdto.setF_num(rs.getString("f_num"));
				fdto.setF_point(rs.getInt("f_point"));
				fdto.setF_selldate(rs.getString("f_selldate"));
				fdto.setF_content(rs.getString("f_content"));
				fdto.setF_title(rs.getString("f_title"));
				
				flist.add(fdto);
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




	
