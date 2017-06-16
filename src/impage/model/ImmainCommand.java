package impage.model;

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
import dto.ImDTO;
import dto.LessonDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import paging.PagingBean;
import paging.dto.PagingDto;

public class ImmainCommand implements CommandInterface {

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
		// TODO Auto-generated method stub
		
		
		imlistCommand(request); // 자신이 수강하고있는 커멘드
		alllistCommand(request); // 전체 리스트
		
		

		
		 
		return "/WEB-INF/imPage/immain.jsp";
	}


	// 전체리스트
	private void alllistCommand(HttpServletRequest request) {
		// TODO Auto-generated method stub
		pool = DBConnectionMgr.getInstance();

		String sql;

		ArrayList list = new ArrayList();

		sql = "select tml.lm_num,tl.l_name,tml.lm_star,tml.lm_year,tml.lm_term,tl.l_teacher,tm.m_name from tbl_member_lesson tml, tbl_lesson tl, tbl_member tm where tml.m_id=tm.m_id and tl.l_num= tml.l_num";

		try {

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// dto에 값 저장
				// LessonDTO dto = new LessonDTO();
				// ImDTO dto2 = new ImDTO();
				// MemberDTO dto3 = new MemberDTO();
				Im2DTO dto = new Im2DTO();
				dto.setLm_num(rs.getString("lm_num"));
				dto.setL_name(rs.getString("l_name"));
				dto.setLm_star(rs.getString("lm_star"));
				dto.setLm_year(rs.getString("lm_year"));
				dto.setLm_term(rs.getString("lm_term"));
				dto.setL_teacher(rs.getString("l_teacher"));
				dto.setM_name(rs.getString("m_name"));
				list.add(dto);

			}
		} catch (Exception err) {
			System.out.println(err);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}

		request.setAttribute("alllist", list);

	}

	// 자신이 수강하고있는 강의 리스트 출력
	private void imlistCommand(HttpServletRequest request) {
		// TODO Auto-generated method stub
		pool = DBConnectionMgr.getInstance();

		// id 세션값 받아오기
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String m_id = member.getM_id();

		String sql;

		ArrayList list = new ArrayList();

		sql = "select l.l_num,l.l_name,l.l_teacher from tbl_timetable t , tbl_lesson l  where t.m_id=? and l.l_num=t.l_num";

		try {

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			// id를 통해 받아와야하기때문에
			pstmt.setString(1, m_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// dto에 값 저장
				LessonDTO dto = new LessonDTO();
				dto.setL_num(rs.getString("l_num"));
				dto.setL_name(rs.getString("l_name"));
				dto.setL_teacher(rs.getString("l_teacher"));

				list.add(dto);

			}
		} catch (Exception err) {
			System.out.println(err);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}

		request.setAttribute("imlist", list);
	}

}
