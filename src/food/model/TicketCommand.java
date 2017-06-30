package food.model;

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

import dto.FoodMemberDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import paging.PagingBean;
import paging.dto.PagingDto;

/**
 * 식권 목록을 출력하는 커맨드 클래스
 * @author 나현기
 *
 */
public class TicketCommand implements CommandInterface {
	
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
		
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		String m_id = mdto.getM_id();
		
		ArrayList tlist = new ArrayList();
		
		String sql = null;
		
		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");
		

		if(keyword == null || keyword.equals("")){
			
			sql = "SELECT fm.fm_regdate, f.f_selldate, f.f_title, f.f_point, fm.fm_isuse, fm.fm_usedate, f.f_num "
					+ "FROM tbl_food_member fm, tbl_food f "
					+ "where f.f_num = fm.f_num and fm.m_id = ? order by f.f_selldate desc";
			
		}
		else{
			
			sql =  "SELECT fm.fm_regdate, f.f_selldate, f.f_title, f.f_point, fm.fm_isuse, fm.fm_usedate f.f_num "
					+ "FROM tbl_food_member fm, tbl_food f "
					+ "where f.f_num = fm.f_num and fm.m_id = ?"
					+ " and "+ keyfield +" like '%"+keyword+"%' order by f.f_selldate desc";
			
		}
		
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				FoodMemberDTO fmdto = new FoodMemberDTO();
				fmdto.setFm_regdate(rs.getString("fm_regdate"));
				fmdto.setF_selldate(rs.getDate("f_selldate"));
				fmdto.setF_title(rs.getString("f_title"));
				fmdto.setF_point(rs.getInt("f_point"));
				fmdto.setFm_isuse(rs.getString("fm_isuse"));
				fmdto.setFm_usedate(rs.getDate("fm_usedate"));
				fmdto.setF_num(rs.getString("f_num"));
				tlist.add(fmdto);
			}
		} 
		catch (Exception e) {
			System.out.println("ticketlist.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
		request.setAttribute("tlist", tlist);
		request.setAttribute("keyword", keyword);
		request.setAttribute("keyfield", keyfield);
		
		// 페이징 관련 블록
		// 페이징 관련 parameter 받아오기
		int nowPage=0, nowBlock=0;
			if(request.getParameter("nowPage") != null){nowPage = Integer.parseInt(request.getParameter("nowPage"));}
			if(request.getParameter("nowBlock") != null){nowBlock = Integer.parseInt(request.getParameter("nowBlock"));}
		PagingBean pbean = new PagingBean();
		// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수!!
		PagingDto paging = pbean.Paging(tlist.size(), 10, nowPage, 10,  nowBlock);
		//페이징 정보 보내기
		request.setAttribute("paging", paging);
		
		return "/WEB-INF/food/ticketList.jsp";
	}

}
