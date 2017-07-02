package schedule.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDTO;
import dto.PagingDto;
import dto.ScheduleDTO;
import harang.dbcp.DBConnectionMgr;
import schedule.CommandInterface;
import util.PagingBean;


/**
 * 
 * 사용자가 학사일정 페이지에서 게시글 목록을 불러올 때 필요한 클래스
 * 
 * @author 김민준
 *
 */
public class U_Sch_List_Command implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public U_Sch_List_Command() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DBCP 연결실패 : " + err);
		}
	}

	public String processCommand(HttpServletRequest req, HttpServletResponse resp) 	 {
		
		req.setAttribute("schlist", schlist(req));
		

		// 페이징 관련 블록
		// 페이징 관련 parameter 받아오기
		int nowPage = 0, nowBlock = 0;
		if (req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		if (req.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}
		PagingBean pbean = new PagingBean();
		// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수!!
		PagingDto paging = pbean.Paging(schlist(req).size(), 20, nowPage, 10, nowBlock);
		// 페이징 정보 보내기
		req.setAttribute("paging", paging);

		return "/WEB-INF/schedule/u_sch_main.jsp";
	}

	public ArrayList schlist(HttpServletRequest req) {

		// MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		// String m_id = mdto.getM_id();

		// System.out.println("Bb_List_Command에서 Test : " + m_id);

		ArrayList list = new ArrayList();
		try {
			
			
			con = pool.getConnection();

			String sql;
			String sOption = req.getParameter("sOption");
			String table_search = req.getParameter("table_search");
			HttpSession session = req.getSession();
			MemberDTO mdto = (MemberDTO)session.getAttribute("member");
			String s_dept = mdto.getM_dept();
			String m_grade = mdto.getM_grade()+"";
			
			

			 System.out.println("U_Sch_List에서 테스트. sOption : " + sOption);
			 System.out.println("U_Sch_List에서 테스트. table_search : " + table_search);
			 System.out.println("U_Sch_List에서 테스트. m_grade : " + m_grade);
			 System.out.println(s_dept);

			if (null == table_search) {

				sql = "select s_num, s_grade, s_ispoint, s_title, s_content, s_dstart, s_dend, s_dept, s_location, s_rstart, s_rend from tbl_schedule where (s_grade like '%"+m_grade+"%' or s_grade = '1234') and (s_dept = '전체' or s_dept = ?) order by s_dstart ";
				System.out.println(sql);
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, s_dept);
				
				// System.out.println(sql);
			}

			else {

				sql = "select s_num, s_grade, s_ispoint, s_title, s_content, s_dstart, s_dend, s_dept, s_location, s_rstart, s_rend from tbl_schedule where " +  sOption + " like '%" + table_search + "%' and (s_grade like '%"+m_grade+"%' or s_grade = '1234') and (s_dept = '전체' or s_dept = ?) order by s_dstart ";
				
				//System.out.println(sql);
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, s_dept);
				
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ScheduleDTO schdto = new ScheduleDTO();
				schdto.setS_num(rs.getString("s_num"));
				schdto.setS_grade(rs.getString("s_grade"));
				schdto.setS_ispoint(rs.getString("s_ispoint"));
				schdto.setS_title(rs.getString("s_title"));
				schdto.setS_content(rs.getString("s_content"));
				schdto.setS_dstart(rs.getString("s_dstart"));
				schdto.setS_dend(rs.getString("s_dend"));
				schdto.setS_dept(rs.getString("s_dept"));
				schdto.setS_location(rs.getString("s_location"));
				schdto.setS_rstart(rs.getString("s_rstart"));
				schdto.setS_rend(rs.getString("s_rend"));

				list.add(schdto);

			}

		} catch (Exception err) {
			System.out.println("U_Sch_List_Command에서 오류");
			err.printStackTrace();

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return list;
	}

	
}
