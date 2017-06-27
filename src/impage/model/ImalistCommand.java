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

import dto.Im2DTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import paging.PagingBean;
import paging.dto.PagingDto;

public class ImalistCommand implements CommandInterface {

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
			
			
		
			alllistCommand(request); // 전체 리스트
			
			

			
			 
			return "/WEB-INF/imPage/a_imlist.jsp";
		}


		// 전체리스트
		void alllistCommand(HttpServletRequest request) {
			// TODO Auto-generated method stub
			pool = DBConnectionMgr.getInstance();

			String sql;

			ArrayList list = new ArrayList();
			String keyword = request.getParameter("keyword");
			String keyfield = request.getParameter("keyfield");
			

			if (null==(keyfield)) {
			sql = "select lm.lm_num,l.l_name,lm.lm_star,lm.lm_year,lm.lm_term,l.l_teacher,m.m_name, (select count(*) from tbl_warning wt where wt.lm_num = lm.lm_num group by wt.lm_num) as w_count from tbl_member_lesson lm , tbl_lesson l, tbl_member m where l.l_num=lm.l_num and lm.m_id=m.m_id;";
			} else {
				
			sql = "select lm.lm_num,l.l_name,lm.lm_star,lm.lm_year,lm.lm_term,l.l_teacher,m.m_name, (select count(*) from tbl_warning wt where wt.lm_num = lm.lm_num group by wt.lm_num) as w_count from tbl_member_lesson lm , tbl_lesson l, tbl_member m where " + keyword + " like '%" + keyfield + "%' and l.l_num=lm.l_num and lm.m_id=m.m_id;";
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
					Im2DTO dto = new Im2DTO();
					dto.setLm_num(rs.getString("lm_num"));
					dto.setL_name(rs.getString("l_name"));
					dto.setLm_star(rs.getString("lm_star"));
					dto.setLm_year(rs.getString("lm_year"));
					dto.setLm_term(rs.getString("lm_term"));
					dto.setL_teacher(rs.getString("l_teacher"));
					dto.setM_name(rs.getString("m_name"));
					dto.setW_count(rs.getString("w_count"));
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
		
			request.setAttribute("alllist", list);
			
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

		

	}

