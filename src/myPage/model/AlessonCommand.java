package myPage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.LessonDTO;
import harang.dbcp.DBConnectionMgr;
import paging.PagingBean;
import paging.dto.PagingDto;

public class AlessonCommand implements CommandInterface {
	
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
		
		adminLessonList(request);
		
		
		return "/WEB-INF/myPage/a_lessonList.jsp";
	}

	
public void adminLessonList(HttpServletRequest request){
		
		ArrayList llist  = new ArrayList();
				
		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");
		
		String sql = null;
				
		if (null == (keyword) || "".equals(keyword)) {
			sql  = 	"SELECT l_num,l_time,l_day,l_name,l_teacher,l_grade,l_term,"
					 	+"l_credit,l_room,l_ismust,l_dept "
						+"from tbl_lesson ";
					
		}
		 else {
			 sql  ="SELECT l_num,l_time,l_day,l_name,l_teacher,l_grade,l_term,"
						+"l_credit,l_room,l_ismust,l_dept "
						+"from tbl_lesson "
						+"where "+ keyfield + " like '%" + keyword + "%'";
				
		 }
		
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
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
