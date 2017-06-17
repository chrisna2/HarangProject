package ajax.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.RecordDTO;
import dto.ZipDTO;
import harang.dbcp.DBConnectionMgr;

public class DongCommand implements CommandInterface {
	
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
		
		String sido = URLDecoder.decode(request.getParameter("sido"), "UTF-8" );
			System.out.println(sido);
		String gugun = URLDecoder.decode(request.getParameter("gugun"), "UTF-8" );
			System.out.println(gugun);
		String dong = URLDecoder.decode(request.getParameter("dong"), "UTF-8" );
			System.out.println(dong);
		
		String sql = "SELECT sido, gugun, dong, bunji, zipcode FROM tbl_zip where sido = '"+sido+"' and gugun = '"+gugun+"' and dong like '%"+dong+"%' group by dong";
		ArrayList zlist  = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				ZipDTO zdto = new ZipDTO();
				zdto.setSido(rs.getString("sido"));
				zdto.setGugun(rs.getString("gugun"));
				zdto.setDong(rs.getString("dong"));
				zdto.setBunji(rs.getString("bunji"));
				zdto.setZipcode(rs.getString("zipcode"));
				zlist.add(zdto);
			}
		} 
		catch (Exception e) {
			System.out.println( "a_regform.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
		
		return zlist;
	}

}
