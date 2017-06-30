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
/**
 * 도/시를 통해 구/군의 목록을 출력하는 ajax 클래스
 * @author 나현기
 *
 */
public class GugunCommand implements CommandInterface {
	
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
		String sql = "SELECT gugun FROM tbl_zip where sido = ? group by gugun";
		ArrayList glist  = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sido);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				ZipDTO gdto = new ZipDTO();
				gdto.setGugun(rs.getString("gugun"));
				glist.add(gdto);
				
			}
		} 
		catch (Exception e) {
			System.out.println( "a_pointcheck.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
		
		return glist;
	}

}
