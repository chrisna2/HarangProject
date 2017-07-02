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
 * 수업 신규 등록 하는 커멘드 클래스
 * @author 나현기
 *
 */
public class AnewlessonCommand implements CommandInterface {
	

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
		
		roomList(request);
		teacherList(request);
		deptList(request);
				
		return "/WEB-INF/myPage/a_lessonplus.jsp";
	}

	
	/**
	 * 수강실 이름 목록을 출력하는 메소드
	 * @param request
	 */
	public void roomList(HttpServletRequest request){
		
		pool = DBConnectionMgr.getInstance();
		
		String sql ="select l_room from tbl_lesson group by l_room";
		
		ArrayList roomlist = new ArrayList();
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				LessonDTO ldto =new LessonDTO();
				ldto.setL_room(rs.getString("l_room"));
				roomlist.add(ldto);
			}
		} catch (Exception err) {
			System.out.println(err);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		request.setAttribute("rlist", roomlist);
	}
	
	/**
	 * 교수님 목록을 출력하는 메소드
	 * @param request
	 */
	public void teacherList(HttpServletRequest request){
		
		pool = DBConnectionMgr.getInstance();
		
		String sql ="select l_teacher from tbl_lesson group by l_teacher";
		
		ArrayList teacherlist = new ArrayList();
		
		try {

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				LessonDTO ldto =new LessonDTO();
				ldto.setL_teacher(rs.getString("l_teacher"));
				teacherlist.add(ldto);
			}
		} catch (Exception err) {
			System.out.println(err);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		request.setAttribute("tlist", teacherlist);
		
	}
	/**
	 * 수업 학과의 목록을 출력하는 메소드
	 * @param request
	 */
	public void deptList(HttpServletRequest request){
		
		pool = DBConnectionMgr.getInstance();
		
		String sql ="select l_dept from tbl_lesson group by l_dept";
		
		ArrayList deptlist = new ArrayList();
		
		try {

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				LessonDTO ldto =new LessonDTO();
				ldto.setL_dept(rs.getString("l_dept"));
				deptlist.add(ldto);
			}
		} catch (Exception err) {
			System.out.println(err);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		request.setAttribute("dlist", deptlist);
	}
	
	
}
