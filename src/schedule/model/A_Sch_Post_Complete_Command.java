package schedule.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDTO;
import dto.PgMemberDTO;
import dto.SrMemberDTO;
import harang.dbcp.DBConnectionMgr;
import schedule.CommandInterface;


/**
 * 
 * 관리자가 학사일정 페이지에서 새로운 글을 작성하고 등록하기 버튼을 눌렀을 때 DB에 기록하기 위한 클래스
 * 
 * 
 * @author 김민준 KIM MIN JOON
 *
 */
public class A_Sch_Post_Complete_Command implements CommandInterface {
	
	private Connection con;
	private PreparedStatement pstmt;
	
	private DBConnectionMgr pool;

	public A_Sch_Post_Complete_Command() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DBCP 연결실패 : " + err);
		}
	}

	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {
		
		
		
		
		
		

		try {
		con = pool.getConnection();
		
		//System.out.println(req.getParameter("point"));
		
		String sql = "insert into tbl_schedule (s_title, s_dept, s_dstart, s_dend, s_rstart, s_rend, s_point, s_content, s_ispoint, s_grade, s_location, s_num ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,'')";
		
		//System.out.println(sql);

		String s_title = req.getParameter("s_title");
		String s_dept = req.getParameter("s_dept");
		String s_dstart = req.getParameter("s_dstart");
		String s_dend = req.getParameter("s_dend");
		String s_rstart = req.getParameter("s_rstart");
		if("".equals(s_rstart)||null==s_rstart){
			s_rstart = null;
		}
		String s_rend = req.getParameter("s_rend");
		if("".equals(s_rend)||null==s_rend){
			s_rend = null;
		}
		String s_point = req.getParameter("s_point");
		String s_content = req.getParameter("s_content");
		String s_ispoint = req.getParameter("point");
		
		if("".equals(s_ispoint)||null==s_ispoint){
			s_ispoint = "N";
		}
		//System.out.println("A_Sch_Post에서 test s_ispoint :" +  s_ispoint);
		
		
		
		
		
		String gr1 = req.getParameter("gr1");
		String gr2 = req.getParameter("gr2");
		String gr3 = req.getParameter("gr3");
		String gr4 = req.getParameter("gr4");	
		
		String s_grade = gr1+gr2+gr3+gr4; 
		
		s_grade = s_grade.replaceAll("null", "");
		
		if("".equals(s_grade)||null==s_grade){
			s_grade = "1234";
		}
		
		String s_location = "[ "+ req.getParameter("fselect")+ " ] [ " + req.getParameter("pg_type") + " ] [ " + req.getParameter("pg_name") + " ]"; 
		
		if("시설을 선택하세요.".equals(req.getParameter("pg_type"))){
			s_location = null;
		}
		
		
		
		
		
		/*System.out.println("A_Sch_Post_Complete에서 테스트");
		System.out.println("제목: " + s_title);
		System.out.println("학과: " + s_dept);
		System.out.println("행사시작일: " + s_dstart);
		System.out.println("행사종료일: " + s_dend);
		System.out.println("신청시작일: " + s_rstart);
		System.out.println("신청종료일: " + s_rend);
		System.out.println("지급포인트: " + s_point);
		System.out.println("본문 : " + s_content);
		System.out.println("포인트 지급: " + s_ispoint);
		System.out.println("해당학년: " + s_grade);
		System.out.println(gr1);
		System.out.println(gr2);
		System.out.println(gr3);
		System.out.println(gr4);
		
		System.out.println("==========================");*/
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
			
			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, s_title);
			pstmt.setString(2, s_dept);
			pstmt.setString(3, s_dstart);
			pstmt.setString(4, s_dend);
			pstmt.setString(5, s_rstart);
			pstmt.setString(6, s_rend);
			pstmt.setString(7, s_point);
			pstmt.setString(8, s_content);
			pstmt.setString(9, s_ispoint);
			pstmt.setString(10, s_grade);
			pstmt.setString(11, s_location);
			

			
			
			pstmt.executeUpdate();
		
			

		} catch (Exception err) {
			System.out.println("A_Sch_Post_Complete에서 에러");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
			
		}
		
		
		
	 	// 대나무숲 학생측 리스트 페이지(메인페이지) 에서 글쓰기를 눌렀을 때
		// 대나무숲 학생이용자의 글 작성 페이지로 이동.
		A_Sch_List_Command goback = new A_Sch_List_Command();		
		String url = goback.processCommand(req, resp);
		
		
		
		return url;
		//return "/HarangProject/bamboo?cmd=BB_LIST;
				
	}
	
	
	
}
