package myPage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.LessonDTO;
import dto.MemberDTO;
import dto.PagingDto;
import dto.RecordDTO;
import harang.dbcp.DBConnectionMgr;
import myPage.CommandInterface;
import util.LoginBean;
import util.PagingBean;

/**
 * 시간표 페이지와 관련한 커맨드 클래스
 * @author 나현기
 *
 */
public class TimetableCommand implements CommandInterface {

	//DB 커넥션 4 대장
	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;
	//DBCP 사용
	DBConnectionMgr pool;

	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String check = request.getParameter("check");
		
		//처음 시간표(기본값)
		if(null == check){
			defaultTimeTable(request);
		}
		//시간표선택시
		else if("findtt".equals(check)){
			timeTableChoice(request);
		}
		//수업 검색시
		else if("search".equals(check)){
			timeTableChoice(request);
		}
		//수업 시간표 등록
		else if("enroll".equals(check)){
			String msg = enrollCheck(request);
			//중복 체크가 완료되면
				if(msg.equals("enroll")){
					enrollLesson(request);
				}
			timeTableChoice(request);
			request.setAttribute("msg", msg);
		}
		//수업 시간표 등록 해제
		else if("delete".equals(check)){
			String msg = deleteCheck(request);
				if(msg.equals("delete")){
					deleteLesson(request);
				}
			timeTableChoice(request);
			request.setAttribute("msg", msg);
		}
		
		return "/WEB-INF/myPage/timeTable.jsp";
	}
	
	/**
	 * 시간표 페이지에 접속시 초기로 표시되는 시간표 출력 메소드.
	 * @param request
	 */
	public void defaultTimeTable(HttpServletRequest request){
		
		//로그인 된 세션의 모든 값 불러 오기
				LoginBean login = new LoginBean();
				MemberDTO member = login.getLoginInfo(request);
				
				ArrayList ttlist  = new ArrayList();
				
				//초기 시간표 설정값
				int tt_grade = member.getM_grade();
				int tt_term = 0;
			
				//현재 학기 구하기
				Calendar cal = Calendar.getInstance();
				int nowMonth = cal.get(Calendar.MONTH) + 1; 
				if(nowMonth>=3&&nowMonth<9){
					tt_term = 1;
				}
				else if((nowMonth>=1&&nowMonth<3)||(nowMonth>=9&&nowMonth<=12)){
					tt_term = 2;
				}
						
				String sql = "SELECT l.l_num,l.l_time,l.l_day,l_name,l.l_teacher,l.l_grade,l.l_term,"
							+"l.l_credit,l.l_room,l.l_ismust,l.l_dept,t.m_id,t.tt_grade "
							+"from tbl_lesson l inner join tbl_timetable t "
							+"on l.l_num = t.l_num "
							+"and t.m_id = ? "
							+"and t.tt_grade = ? "
							+"and t.tt_term = ? ";	
				try {
					
					pool = DBConnectionMgr.getInstance();
					con = pool.getConnection();
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, member.getM_id());
					pstmt.setInt(2, tt_grade);
					pstmt.setInt(3, tt_term);
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						
						LessonDTO ldto = new LessonDTO();
						
						ldto.setL_num(rs.getString("l_num"));
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
						ldto.setM_id(rs.getString("m_id"));
						ldto.setTt_grade(rs.getString("tt_grade"));
						
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
				request.setAttribute("grade", tt_grade);
				request.setAttribute("term", tt_term);
				request.setAttribute("ttlist", ttlist);
				request.setAttribute("ttname", tt_grade+"학년 "+tt_term+"학기");
				//등록 가능한 수업 목록 출력
				userLessonList(request, tt_grade, tt_term, member.getM_id());
	}
	
	/**
	 * 시간표의 학년과 학기를 선택 등록한 시간표를 출력하는 메소드
	 * @param request
	 */
	public void timeTableChoice(HttpServletRequest request){
		
		//로그인 된 세션의 모든 값 불러 오기
		LoginBean login = new LoginBean();
		MemberDTO member = login.getLoginInfo(request);
		
		ArrayList ttlist  = new ArrayList();
		
		int tt_grade = Integer.parseInt(request.getParameter("grade"));
		int tt_term = Integer.parseInt(request.getParameter("term"));
				
		String sql = "SELECT l.l_num,l.l_time,l.l_day,l_name,l.l_teacher,l.l_grade,l.l_term,"
					+"l.l_credit,l.l_room,l.l_ismust,l.l_dept,t.m_id,t.tt_grade "
					+"from tbl_lesson l inner join tbl_timetable t "
					+"on l.l_num = t.l_num "
					+"and t.m_id = ? "
					+"and t.tt_grade = ? "
					+"and t.tt_term = ? ";	
		try {
			
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			pstmt.setInt(2, tt_grade);
			pstmt.setInt(3, tt_term);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				LessonDTO ldto = new LessonDTO();
				
				ldto.setL_num(rs.getString("l_num"));
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
				ldto.setM_id(rs.getString("m_id"));
				ldto.setTt_grade(rs.getString("tt_grade"));
				
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
		request.setAttribute("grade", tt_grade);
		request.setAttribute("term", tt_term);
		request.setAttribute("ttlist", ttlist);
		request.setAttribute("ttname", tt_grade+"학년 "+tt_term+"학기");
		
		//등록 가능한 수업 목록 출력
		userLessonList(request, tt_grade, tt_term, member.getM_id());
		
	}
	/**
	 * 시간표에 등록된 수업 목록을 출력하는 메소드
	 * @param request
	 * @param tt_grade
	 * @param tt_term
	 * @param m_id
	 */
	public void userLessonList(HttpServletRequest request, int tt_grade, int tt_term, String m_id){
		
		
		ArrayList llist  = new ArrayList();
				
		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");
		
		String sql = null;
				
		if (null == (keyword) || "".equals(keyword)) {
			sql  = 	"SELECT l.l_num,l.l_time,l.l_day,l_name,l.l_teacher,l.l_grade,l.l_term,"
					 	+"l.l_credit,l.l_room,l.l_ismust,l.l_dept,t.m_id,t.tt_grade,t.tt_term "
						+"from tbl_lesson l left outer join tbl_timetable t "
						+"on l.l_num = t.l_num "
						+"and t.m_id = ? " 
						+"and t.tt_grade = ? "
						+"where l.l_grade <= ? "
						+"and l.l_term = ?";
		}
		 else {
			 sql  ="SELECT l.l_num,l.l_time,l.l_day,l_name,l.l_teacher,l.l_grade,l.l_term,"
						+"l.l_credit,l.l_room,l.l_ismust,l.l_dept,t.m_id,t.tt_grade "
						+"from tbl_lesson l left outer join tbl_timetable t "
						+"on l.l_num = t.l_num "
						+"and t.m_id = ? " 
						+"and t.tt_grade = ? "
						+"where l.l_grade <= ? "
						+"and l.l_term = ? "
						+"and "+ keyfield + " like '%" + keyword + "%'";
				
		 }
		
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setInt(2, tt_grade);
			pstmt.setInt(3, tt_grade);
			pstmt.setInt(4, tt_term);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				LessonDTO ldto = new LessonDTO();
				
				ldto.setL_num(rs.getString("l_num"));
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
				ldto.setM_id(rs.getString("m_id"));
				ldto.setTt_grade(rs.getString("tt_grade"));
				
				llist.add(ldto);
				
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
		request.setAttribute("llist", llist);
		request.setAttribute("keyword", keyword);
		request.setAttribute("keyfield", keyfield);
		
		// 페이징 관련 parameter 받아오기
				int nowPage = 0, nowBlock = 0;
				if (request.getParameter("nowPage") != null) {
					nowPage = Integer.parseInt(request.getParameter("nowPage"));
				}
				if (request.getParameter("nowBlock") != null) {
					nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
				}
				// DB 연동 함수를 쓰기 위해 인스턴스 생성

				PagingBean pbean = new PagingBean();
				// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수!!
				PagingDto paging = pbean.Paging(llist.size(), 5, nowPage, 10, nowBlock);

				request.setAttribute("paging", paging);		
		
		
	}
	
	/**
	 * 시간표가 중보되었는가 검색하는 메소드
	 * @param request
	 * @return
	 */
	public String enrollCheck(HttpServletRequest request){
		
		//로그인 된 세션의 모든 값 불러 오기
		LoginBean login = new LoginBean();
		MemberDTO member = login.getLoginInfo(request);
		//입력할 값
		int tt_grade = Integer.parseInt(request.getParameter("grade"));
		int tt_term = Integer.parseInt(request.getParameter("term"));
		//비교 대상의 값
		String cl_time = request.getParameter("l_time");
		String cl_day = request.getParameter("l_day");
		
		String sql ="SELECT l.l_day, l.l_time "
				+ "FROM tbl_lesson l, tbl_timetable tt "
				+ "where tt.m_id = ? and tt.tt_grade = ? and tt.tt_term = ? and tt.l_num = l.l_num;";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			pstmt.setInt(2, tt_grade);
			pstmt.setInt(3, tt_term);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				if(cl_day.equals(rs.getString("l_day"))&&cl_time.equals(rs.getString("l_time"))){
					
					return "duplicate";
					
				}
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
		
		return "enroll";
	}
	
	
	/**
	 * 수업 등록 메소드
	 * @param request
	 */
	public void enrollLesson(HttpServletRequest request){
		
		String sql = "INSERT INTO tbl_timetable (tt_grade, tt_term, m_id, l_num, tt_iscomplete) VALUES (?, ?, ?, ?, 'N');";
		
		//로그인 된 세션의 모든 값 불러 오기
			LoginBean login = new LoginBean();
			MemberDTO member = login.getLoginInfo(request);
			//입력할 값
			int tt_grade = Integer.parseInt(request.getParameter("grade"));
			int tt_term = Integer.parseInt(request.getParameter("term"));
			String l_num = request.getParameter("l_num");
			
			try {
				pool = DBConnectionMgr.getInstance();
				con = pool.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, tt_grade);
				pstmt.setInt(2, tt_term);
				pstmt.setString(3, member.getM_id());
				pstmt.setString(4, l_num);
				pstmt.executeUpdate();
			} 
			catch (Exception e) {
				System.out.println( "timetable.jsp : " + e);
				e.printStackTrace();
			}
			finally{
				// DBCP 접속해제
				pool.freeConnection(con, pstmt);
			}
	}
	
	
	/**
	 * 이미 수업 평가가 완료된 수업은 시간표에서 지워지지 않게하는 메소드
	 * @param request
	 * @return
	 */
	public String deleteCheck(HttpServletRequest request){
		
		//로그인 된 세션의 모든 값 불러 오기
		LoginBean login = new LoginBean();
		MemberDTO member = login.getLoginInfo(request);
		//입력할 값
		String l_num = request.getParameter("l_num");
		int tt_grade = Integer.parseInt(request.getParameter("grade"));
		
		String sql = "select tt_iscomplete from tbl_timetable where m_id = ? and l_num = ? and tt_grade = ?";
				
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			pstmt.setString(2, l_num);
			pstmt.setInt(3, tt_grade);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				if("Y".equals(rs.getString("tt_iscomplete"))){
					return "evaluated";
				}
				
				
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
		
		return "delete";
	}
	
	/**
	 * 시간표애서 수업을 지우는 메소드
	 * @param request
	 */
	public void deleteLesson(HttpServletRequest request){
		
		String sql = "DELETE FROM tbl_timetable WHERE l_num = ? and m_id = ? and tt_grade = ?";
		
		//로그인 된 세션의 모든 값 불러 오기
		LoginBean login = new LoginBean();
		MemberDTO member = login.getLoginInfo(request);
		//입력할 값
		String l_num = request.getParameter("l_num");
		int tt_grade = Integer.parseInt(request.getParameter("grade"));
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, l_num);
			pstmt.setString(2, member.getM_id());
			pstmt.setInt(3, tt_grade);
			pstmt.executeUpdate();
		} 
		catch (Exception e) {
			System.out.println( "timetable.jsp : " + e);
			e.printStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt);
		}
		
	}
}
