package myPage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dto.CertiDTO;
import dto.Im2DTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import paging.PagingBean;
import paging.dto.PagingDto;
/**
 * 회원전체리스트 출력 / 회원 상세보기
 * @author 박주선
 *
 */
public class AinformationCommand implements CommandInterface{

	// DB 커넥션 3 대장
		Connection con;
		PreparedStatement pstmt;
		DataSource ds;
		ResultSet rs;
		// DBCP 사용
		DBConnectionMgr pool;
	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String m_id = request.getParameter("m_id");
	
		
		
			if(!(m_id == null)){
				inforread(request);
			}
		
		alllistCommand(request); // 회원전체 리스트
		
		
		

		
		 
		return "/WEB-INF/myPage/a_memList.jsp";
	}

	/**
	 * 회원 전체리스트 
	 * @param request
	 */
	void alllistCommand(HttpServletRequest request) {
		// TODO Auto-generated method stub
		pool = DBConnectionMgr.getInstance();

		String sql;

		ArrayList list = new ArrayList();
		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");
		

		
		
		if (null==(keyfield) || ("").equals(keyfield)) {
			sql = "select * from tbl_member";
			} else {
				
			sql = "select * from tbl_member where "+keyword+" like '%" + keyfield + "%'";
					
				
			}
			
		
		try {

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// dto에 값 저장
				// LessonDTO dto = new LessonDTO();
				// ImDTO dto2 = new ImDTO();
				// MemberDTO dto3 = new MemberDTO();
				MemberDTO dto = new MemberDTO();
				dto.setM_id(rs.getString("m_id"));
				dto.setM_name(rs.getString("m_name"));
				dto.setM_dept(rs.getString("m_dept"));
				dto.setM_grade(rs.getInt("m_grade"));
				dto.setM_point(rs.getInt("m_point"));
				dto.setM_regdate(rs.getString("m_regdate"));
				
				list.add(dto);

			}
		} catch (Exception err) {
			System.out.println(err);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		request.setAttribute("keyword", keyword);
		request.setAttribute("keyfield", keyfield);
	
		request.setAttribute("alllist2", list);
		
		// 페이징 관련 parameter 받아오기
		int nowPage=0, nowBlock=0;
		if(request.getParameter("nowPage") != null){nowPage = Integer.parseInt(request.getParameter("nowPage"));}
		if(request.getParameter("nowBlock") != null){nowBlock = Integer.parseInt(request.getParameter("nowBlock"));}
			// DB 연동 함수를 쓰기 위해 인스턴스 생성
			
			PagingBean pbean = new PagingBean();
			// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수!!
			PagingDto paging = pbean.Paging(list.size(),5, nowPage,10,  nowBlock);
			
			request.setAttribute("paging", paging);
		

	}
	/**
	 * 회원 상세보기
	 * @param request
	 */
	private void inforread(HttpServletRequest request) {
		// TODO Auto-generated method stub

		pool = DBConnectionMgr.getInstance();
		String sql;
		MemberDTO dto = new MemberDTO();
		
		
		
		try {
			//sql = "SELECT * FROM tbl_member_lesson where lm_num=?;";
			sql="select * from tbl_member where m_id=?";
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("m_id"));
			
			
			
			
			rs = pstmt.executeQuery();
			
			rs.next();
			dto.setM_name(rs.getString("m_name"));
			dto.setM_point(rs.getInt("m_point"));
			dto.setM_id(rs.getString("m_id"));
			dto.setM_dept(rs.getString("m_dept"));
			dto.setM_birth(rs.getString("m_birth"));
			dto.setM_mail(rs.getString("m_mail"));
			dto.setM_tel(rs.getString("m_tel"));
			dto.setM_addr(rs.getString("m_addr"));
			dto.setM_photo(rs.getString("m_photo"));
			
			
		} catch (Exception err) {
			System.out.println(err);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		request.setAttribute("read3", dto);
	}

}


