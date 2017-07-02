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
 * 관리자 수업 수정 커멘드 클래스
 * @author 나현기
 *
 */
public class AupdatelessonCommand implements CommandInterface {
	

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
		lessonInfo(request);
				
		return "/WEB-INF/myPage/a_lessonupdate.jsp";
	}

	
	/**
	 * 수업 목록 출력 하는 메소드
	 * @param request 서블릿 리퀘스트
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
	 * @param request 서블릿 리퀘스트
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
	 * 학과의 목록을 출력하는 메소드
	 * @param request 서블릿 리퀘스트
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
	/**
	 * 수업의 정보를 출력해오는  메소드
	 * @param request 서블릿 리퀘스트
	 */
	public void lessonInfo(HttpServletRequest request){
		
		String l_num = request.getParameter("l_num");		
		
		String sql = "SELECT l_time,l_day,l_name,l_teacher,l_grade,l_term,"
			 	+"l_credit,l_room,l_ismust,l_dept "
				+"from tbl_lesson where l_num = ?";
		
		LessonDTO ldto =new LessonDTO();
		
		try {

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, l_num);
			rs = pstmt.executeQuery();
			rs.next();
			
			ldto.setL_time(rs.getString("l_time"));
			ldto.setL_day(rs.getString("l_day"));
			ldto.setL_name(rs.getString("l_name"));
			ldto.setL_teacher(rs.getString("l_teacher"));
			ldto.setL_grade(rs.getString("l_grade"));
			ldto.setL_term(rs.getString("l_term"));
			ldto.setL_credit(rs.getInt("l_credit"));
			ldto.setL_room(rs.getString("l_room"));
			ldto.setL_ismust(rs.getString("l_ismust"));
			ldto.setL_dept(rs.getString("l_dept"));
			ldto.setL_num(l_num);
			
		
			
		} catch (Exception err) {
			System.out.println(err);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		request.setAttribute("dinfo", ldto);
		
	}
	
	
}
