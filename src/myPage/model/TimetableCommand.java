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
import dto.RecordDTO;
import harang.dbcp.DBConnectionMgr;
import login.LoginBean;
import paging.PagingBean;
import paging.dto.PagingDto;

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
		
		return "/WEB-INF/myPage/timeTable.jsp";
	}
	
	public void defaultTimeTable(HttpServletRequest request){
		
		//로그인 된 세션의 모든 값 불러 오기
				LoginBean login = new LoginBean();
				MemberDTO member = login.getLoginInfo(request);
				
				ArrayList ttlist  = new ArrayList();
				
				//초기 시간표 설정값
				int l_grade = member.getM_grade();
				int l_term = 0;
			
				//현재 학기 구하기
				Calendar cal = Calendar.getInstance();
				int nowMonth = cal.get(Calendar.MONTH) + 1; 
				if(nowMonth>=3&&nowMonth<9){
					l_term = 1;
				}
				else if((nowMonth>=1&&nowMonth<3)||(nowMonth>=9&&nowMonth<=12)){
					l_term = 2;
				}
						
				String sql = "SELECT l.l_num,l.l_time,l.l_day,l_name,l.l_teacher,l.l_grade,l.l_term,l.l_credit,l.l_room,l.l_ismust,l.l_dept,t.m_id "
							+"from tbl_lesson l inner join tbl_timetable t "
							+"on l.l_num = t.l_num "
							+"and t.tt_grade = l.l_grade "
							+"and t.tt_term = l.l_term "
							+"and t.m_id = ? "
							+"and l.l_grade = ? "
							+"and l.l_term = ? ";	
				try {
					
					pool = DBConnectionMgr.getInstance();
					con = pool.getConnection();
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, member.getM_id());
					pstmt.setInt(2, l_grade);
					pstmt.setInt(3, l_term);
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
				request.setAttribute("grade", l_grade);
				request.setAttribute("term", l_term);
				request.setAttribute("ttlist", ttlist);
				request.setAttribute("ttname", l_grade+"학년 "+l_term+"학기");
				//등록 가능한 수업 목록 출력
				userLessonList(request, l_grade, l_term, member.getM_id());
	}
	
	public void timeTableChoice(HttpServletRequest request){
		
		//로그인 된 세션의 모든 값 불러 오기
		LoginBean login = new LoginBean();
		MemberDTO member = login.getLoginInfo(request);
		
		ArrayList ttlist  = new ArrayList();
		
		int l_grade = Integer.parseInt(request.getParameter("grade"));
		int l_term = Integer.parseInt(request.getParameter("term"));
				
		String sql = "SELECT l.l_num,l.l_time,l.l_day,l_name,l.l_teacher,l.l_grade,l.l_term,l.l_credit,l.l_room,l.l_ismust,l.l_dept,t.m_id "
					+"from tbl_lesson l inner join tbl_timetable t "
					+"on l.l_num = t.l_num "
					+"and t.tt_grade = l.l_grade "
					+"and t.tt_term = l.l_term "
					+"and t.m_id = ? "
					+"and l.l_grade = ? "
					+"and l.l_term = ? ";	
		try {
			
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			pstmt.setInt(2, l_grade);
			pstmt.setInt(3, l_term);
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
		request.setAttribute("grade", l_grade);
		request.setAttribute("term", l_term);
		request.setAttribute("ttlist", ttlist);
		request.setAttribute("ttname", l_grade+"학년 "+l_term+"학기");
		
		//등록 가능한 수업 목록 출력
		userLessonList(request, l_grade, l_term, member.getM_id());
		
	}
	
	
	public void userLessonList(HttpServletRequest request, int l_grade, int l_term, String m_id){
		
		
		ArrayList llist  = new ArrayList();
				
		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");
		
		String sql = null;
				
		if (null == (keyword) || "".equals(keyword)) {
			sql  = 	"SELECT l.l_num,l.l_time,l.l_day,l_name,l.l_teacher,l.l_grade,l.l_term,l.l_credit,l.l_room,l.l_ismust,l.l_dept,t.m_id "
						+"from tbl_lesson l left outer join tbl_timetable t "
						+"on l.l_num = t.l_num "
						+"and t.tt_grade = l.l_grade "
						+"and t.tt_term = l.l_term "
						+"and t.m_id = ? " 
						+"where l.l_grade <= ? "
						+"and l.l_term = ?";
		}
		 else {
			 sql  ="SELECT l.l_num,l.l_time,l.l_day,l_name,l.l_teacher,l.l_grade,l.l_term,l.l_credit,l.l_room,l.l_ismust,l.l_dept,t.m_id "
						+"from tbl_lesson l left outer join tbl_timetable t "
						+"on l.l_num = t.l_num "
						+"and t.tt_grade = l.l_grade "
						+"and t.tt_term = l.l_term "
						+"and t.m_id = ? " 
						+"where l.l_grade <= ? "
						+"and l.l_term = ? "
						+"and "+ keyfield + " like '%" + keyword + "%'";
				
		 }
		
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setInt(2, l_grade);
			pstmt.setInt(3, l_term);
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

}
