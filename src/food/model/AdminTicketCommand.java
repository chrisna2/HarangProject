package food.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.FoodMemberDTO;
import harang.dbcp.DBConnectionMgr;
import paging.PagingBean;
import paging.dto.PagingDto;

/**
 * 식권의 판매 목록 출력 클래스
 * @author 나현기
 *
 */
public class AdminTicketCommand implements CommandInterface {

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
		
		String sql = null;
		
		ArrayList fmlist = new ArrayList();
		
		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");
		

		if(keyword == null || keyword.equals("")){
			
			sql ="select f.f_title, f.f_selldate, f.f_point, count(fm.f_num) as fm_sellcount "
					+ "from tbl_food_member fm, tbl_food f "
					+ "where fm.f_num=f.f_num and fm.fm_isuse != 'return' "
					+ "group by fm.f_num order by f.f_selldate desc";
			
		}
		else{
			
			sql = "select f.f_title, f.f_selldate, f.f_point, count(fm.f_num) as fm_sellcount "
					+ "from tbl_food_member fm, tbl_food f "
					+ "where fm.f_num=f.f_num and fm.fm_isuse != 'return' "
					+ " and "+ keyfield +" like '%"+keyword+"%' "
					+ "group by fm.f_num order by f.f_selldate desc";
		}
		
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				FoodMemberDTO fmdto = new FoodMemberDTO();
				
				fmdto.setF_title(rs.getString("f_title"));
				fmdto.setF_selldate(rs.getDate("f_selldate"));
				fmdto.setF_point(rs.getInt("f_point"));
				fmdto.setFm_sellcount(rs.getInt("fm_sellcount"));
				
				fmlist.add(fmdto);
				
			}
		} 
		catch (Exception e) {
			System.out.println("ticketlist.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
	
		request.setAttribute("fmlist", fmlist);
		request.setAttribute("keyword", keyword);
		request.setAttribute("keyfield", keyfield);
		
		// 페이징 관련 블록
		// 페이징 관련 parameter 받아오기
		int nowPage=0, nowBlock=0;
			if(request.getParameter("nowPage") != null){nowPage = Integer.parseInt(request.getParameter("nowPage"));}
			if(request.getParameter("nowBlock") != null){nowBlock = Integer.parseInt(request.getParameter("nowBlock"));}
		PagingBean pbean = new PagingBean();
		// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수!!
		PagingDto paging = pbean.Paging(fmlist.size(), 10, nowPage, 10,  nowBlock);
		//페이징 정보 보내기
		request.setAttribute("paging", paging);
		
		return "/WEB-INF/food/a_ticketList.jsp";
	}

}
