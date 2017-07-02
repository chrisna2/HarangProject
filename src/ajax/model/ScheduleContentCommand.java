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
import dto.ScheduleDTO;
import harang.dbcp.DBConnectionMgr;


/**
 * 
 * 사용자가 학사일정 페이지에서 글의 목록을 불러오기 필요한 클래스
 * 
 * @author 김민준 KIM MIN JOON
 *
 */
public class ScheduleContentCommand implements CommandInterface {
	
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
		
		String s_num = request.getParameter("s_num");
		
		String sql = "select *, (select count(m_id) from tbl_schedule_member where s_num = ?) as 'isjoin' from tbl_schedule where s_num = ?;";
		ArrayList schconlist  = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, s_num);
			pstmt.setString(2, s_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				ScheduleDTO sdto = new ScheduleDTO();
				
				sdto.setS_num(rs.getString("s_num"));
				sdto.setS_grade(rs.getString("s_grade"));
				sdto.setS_ispoint(rs.getString("s_ispoint"));
				sdto.setS_title(rs.getString("s_title"));
				sdto.setS_content(rs.getString("s_content"));
				sdto.setS_dstart(rs.getString("s_dstart"));
				sdto.setS_dend(rs.getString("s_dend"));
				sdto.setS_dept(rs.getString("s_dept"));
				sdto.setS_location(rs.getString("s_location"));
				sdto.setS_rstart(rs.getString("s_rstart"));
				sdto.setS_rend(rs.getString("s_rend"));
				sdto.setS_point(rs.getString("s_point"));
				sdto.setIsjoin(rs.getString("isjoin"));
				
				//System.out.println(rs.getString("s_rstart"));
				
				schconlist.add(sdto);
			}
		} 
		catch (Exception e) {
			System.out.println( "menuList.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		return schconlist;
	}

}




	
