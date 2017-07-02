package myPage.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.LessonDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import login.model.RegformCommand;
import myPage.CommandInterface;

/**
 * 수업 등록 업데이트 확인
 * @author 나현기
 *
 */
public class AnewLessonUpdateCommand implements CommandInterface {
	

	// DB 커넥션 3 대장
		Connection con;
		PreparedStatement pstmt;
		DataSource ds;
		ResultSet rs;
		// DBCP 사용
		DBConnectionMgr pool;
	
	

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException{
		
		String check = request.getParameter("check");
		String result = null;
		
		if("insert".equals(check)){
			result = lessonInsert(request);
			request.setAttribute("result", result);
		}
		else if("update".equals(check)){
			result = lessonUpdate(request);
			request.setAttribute("result", result);
		}
		
		AlessonCommand lPage = new AlessonCommand();
		lPage.adminLessonList(request);
				
		return "/WEB-INF/myPage/a_lessonList.jsp";
	}
	
	
	/**
	 * 수업 신규 등록 메소드
	 * @param request
	 * @return
	 */
	public String lessonInsert(HttpServletRequest request){
		
		String result = "";
		
		String sql = "INSERT INTO tbl_lesson "
				+ "(l_time, l_day, l_name, l_teacher, l_dept, l_ismust, l_grade, l_term, l_credit, l_room) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("l_time"));
			pstmt.setString(2, request.getParameter("l_day"));
			pstmt.setString(3, request.getParameter("l_name"));
			pstmt.setString(4, request.getParameter("l_teacher"));
			pstmt.setString(5, request.getParameter("l_dept"));
			pstmt.setString(6, request.getParameter("l_ismust"));
			pstmt.setString(7, request.getParameter("l_grade"));
			pstmt.setString(8, request.getParameter("l_term"));
			pstmt.setString(9, request.getParameter("l_credit"));
			pstmt.setString(10, request.getParameter("l_room"));
			
			int check = pstmt.executeUpdate();
			
			if(check == 1){
				result = "insert_complete";
			}
			else{
				result = "insert_fail";
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
		System.out.println(result);
		return result;
		
	}
	
	/**
	 * 수업 업데이트 메소드
	 * @param request
	 * @return 출력 결과 메세지
	 */
	public String lessonUpdate(HttpServletRequest request){
		
		String l_num = request.getParameter("l_num");
		
		String result = "";
		
		String sql ="UPDATE tbl_lesson "
				+ "SET l_time=?, l_day=?, l_name=?, "
				+ "l_teacher=?, l_dept=?, l_ismust=?, "
				+ "l_grade=?, l_term=?, l_credit=?, l_room=? "
				+ "WHERE l_num=?";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("l_time"));
			pstmt.setString(2, request.getParameter("l_day"));
			pstmt.setString(3, request.getParameter("l_name"));
			pstmt.setString(4, request.getParameter("l_teacher"));
			pstmt.setString(5, request.getParameter("l_dept"));
			pstmt.setString(6, request.getParameter("l_ismust"));
			pstmt.setString(7, request.getParameter("l_grade"));
			pstmt.setString(8, request.getParameter("l_term"));
			pstmt.setString(9, request.getParameter("l_credit"));
			pstmt.setString(10, request.getParameter("l_room"));
			pstmt.setString(11, request.getParameter("l_num"));
			int check = pstmt.executeUpdate();
			
			if(check == 1){
				result = "update_complete";
			}
			else{
				result = "update_fail";
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
		System.out.println(result);
		return result;
		
	}

}
