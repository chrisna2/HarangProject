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

import dto.CalanderDTO;
import dto.RecordDTO;
import dto.ZipDTO;
import harang.dbcp.DBConnectionMgr;

public class ScheduleCommand implements CommandInterface {
	
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
		
		//String sido = URLDecoder.decode(request.getParameter("sido"), "UTF-8" );
		//System.out.println(sido);
		
		String sql = "select s_num, s_title, s_dstart, s_dend from tbl_schedule where s_dept = '전체' ";
		ArrayList slist  = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				CalanderDTO cdto = new CalanderDTO();
				
				cdto.setId(rs.getString("s_num"));
				cdto.setStart(rs.getString("s_dstart"));
				cdto.setTitle(rs.getString("s_title"));
				cdto.setEnd(rs.getString("s_dend"));
				cdto.setColor("#E4FFB7");
				cdto.setAllDay(true);
				
				slist.add(cdto);
			}
		} 
		catch (Exception e) {
			System.out.println( "a_pointcheck.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
		
		return slist;
	}

}
