package harangdin.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.BookDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import login.LoginBean;
import paging.PagingBean;
import paging.dto.PagingDto;

/**
 * 나의 도서 판매 목록
 * @author 서지윤
 *
 */

public class SellingCommand implements CommandInterface {
	
	//DB 커넥션 3 대장
	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;
	//DBCP 사용
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		list(request);
		
		return "/WEB-INF/harangdin/list_selling.jsp";
		
	}
	
	/**
	 * 자신이 판매하는 도서 목록 리스트
	 * @param request
	 */
	
	public void list(HttpServletRequest request){
		
		LoginBean login = new LoginBean();
		MemberDTO member = login.getLoginInfo(request);
		
		String sql;
		
		ArrayList list = new ArrayList();
		
		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");
		
		System.out.println(keyword +"." + keyfield);
		
		
		if(keyword == null || keyword.equals("")){
			sql ="select b.b_num,b.b_name,h.m_id,h.bh_regdate,h.bh_want, h.bh_choice, h.bh_iscomplete from tbl_b_hunter h, tbl_book b where h.b_num = b.b_num and b.m_id =?";
		}
		else{
			sql ="select b.b_num,b.b_name,h.m_id,h.bh_regdate,h.bh_want, h.bh_choice, h.bh_iscomplete from tbl_b_hunter h, tbl_book b where h.b_num = b.b_num and b.m_id =? and "
					+ keyfield + " like '%" + keyword + "%' order by b_regdate desc";
		}
		
		pool = DBConnectionMgr.getInstance();
		
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {

				
				BookDTO dto = new BookDTO();
				
				dto.setB_num(rs.getString("b_num"));
				dto.setB_name(rs.getString("b_name"));
				dto.setM_id(rs.getString("m_id"));
				dto.setBh_regdate(rs.getString("bh_regdate"));
				dto.setBh_want(rs.getInt("bh_want"));
				dto.setBh_choice(rs.getString("bh_choice"));
				dto.setBh_iscomplete(rs.getString("bh_iscomplete"));
				
				list.add(dto);
				
			}
			
			
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}
		request.setAttribute("keyword", keyword);
		request.setAttribute("keyfield", keyfield);
		request.setAttribute("harangdinmain", list);
		
		//페이징 관련 parameter 받아오기
		int nowPage=0, nowBlock=0;
		if(request.getParameter("nowPage") != null){nowPage = Integer.parseInt(request.getParameter("nowPage"));}
		if(request.getParameter("nowBlock") != null){nowBlock = Integer.parseInt(request.getParameter("nowBlock"));}

		// DB 연동 함수를 쓰기 위해 인스턴스 생성
		PagingBean pbean = new PagingBean();
						
		// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수!!
		PagingDto paging = pbean.Paging(list.size(),5, nowPage,10, nowBlock);
								
		// parameter 보내기
		request.setAttribute("paging", paging);
	}

}
