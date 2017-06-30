package ajax.model;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dto.CalanderDTO;
import dto.LessonDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import login.LoginBean;
/**
 * 시간표 출력 Ajax 클래스
 * @author 나현기
 *
 */
public class FindttCommand implements CommandInterface {
	
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
		
		String check = request.getParameter("check");
		
		ArrayList ttlist = new ArrayList();		
		
		if("teacher".equals(check)){
			ttlist = findTeacherTt(request);
		}
		
		else if("room".equals(check)){
			ttlist = findRoomTt(request);
		}
	
		return ttlist;
	}
	/**
	 * 교수님의 현재 시간표를 출력하는 메소드
	 * @param request
	 * @return ArrayList
	 * @throws UnsupportedEncodingException
	 */
	public ArrayList findTeacherTt(HttpServletRequest request) throws UnsupportedEncodingException{
				
		ArrayList ttlist  = new ArrayList();
		
		String l_teacher = URLDecoder.decode(request.getParameter("l_teacher"), "UTF-8");
		int l_term = Integer.parseInt(request.getParameter("l_term"));
				
		String sql = "SELECT l_time,l_day,l_name,l_teacher,l_room,l_dept "
					+"from tbl_lesson "
					+"where l_teacher = ? "
					+"and l_term = ?";	
		try {
			
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, l_teacher);
			pstmt.setInt(2, l_term);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				LessonDTO ldto = new LessonDTO();
				
				ldto.setL_time(rs.getString("l_time"));
				ldto.setL_day(rs.getString("l_day"));
				ldto.setL_name(rs.getString("l_name"));
				ldto.setL_teacher(rs.getString("l_teacher"));
				ldto.setL_room(rs.getString("l_room"));
				ldto.setL_dept(rs.getString("l_dept"));
				
				ttlist.add(ldto);
				
			}
		} 
		catch (Exception e) {
			System.out.println( "timetable.jsp : " + e);
			e.printStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		return ttlist;
	}
	/**
	 * 수강실의 현재 시간표를 출력 하는 메소드
	 * @param request
	 * @return ArrayList 수강실의 시간표 목록 출력
	 * @throws UnsupportedEncodingException
	 */
	public ArrayList findRoomTt(HttpServletRequest request) throws UnsupportedEncodingException{
		
		ArrayList ttlist  = new ArrayList();
		
		String l_room = URLDecoder.decode(request.getParameter("l_room"), "UTF-8");
		int l_term = Integer.parseInt(request.getParameter("l_term"));
		
		String sql = "SELECT l_time,l_day,l_name,l_teacher,l_room,l_dept "
				+"from tbl_lesson "
				+"where l_room = ? "
				+"and l_term = ?";	
		try {
			
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, l_room);
			pstmt.setInt(2, l_term);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				LessonDTO ldto = new LessonDTO();
				
				ldto.setL_time(rs.getString("l_time"));
				ldto.setL_day(rs.getString("l_day"));
				ldto.setL_name(rs.getString("l_name"));
				ldto.setL_teacher(rs.getString("l_teacher"));
				ldto.setL_room(rs.getString("l_room"));
				ldto.setL_dept(rs.getString("l_dept"));
				
				ttlist.add(ldto);
				
			}
		} 
		catch (Exception e) {
			System.out.println( "timetable.jsp : " + e);
			e.printStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		return ttlist;
	}

}




	
