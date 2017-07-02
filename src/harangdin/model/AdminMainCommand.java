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
import dto.PagingDto;
import harang.dbcp.DBConnectionMgr;
import harangdin.CommandInterface;
import util.PagingBean;

/**
 * 관리자 하랑딘 메인 페이지
 * @author 서지윤
 *
 */

public class AdminMainCommand implements CommandInterface {
	
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

		String delete_check = request.getParameter("delete_check");
		if(null!=delete_check){
			delete(request);			
			
		}
		list(request);
		
		return "/WEB-INF/harangdin/a_harangdin_main.jsp";
		
	}

	/**
	 * 메인페이지에 도서리스트
	 * @param request
	 */
	public void list(HttpServletRequest request){
		
		
		String sql;
		
		ArrayList list = new ArrayList();
		
		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");
		
		//System.out.println(keyword +"." + keyfield);
		
		if(keyword == null || keyword.equals("")){
			sql = "SELECT b_num, b_name, b_writer, b_pub, b_want from tbl_book where b_choice='판매' order by b_regdate desc";			
		}
		else{
			sql ="SELECT b_num, b_name, b_writer, b_pub, b_want from tbl_book where b_choice='판매' and "
					+ keyfield + " like '%" + keyword + "%' order by b_regdate desc";
		}
		
		pool = DBConnectionMgr.getInstance();
		
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				
				BookDTO dto = new BookDTO();
				
				dto.setB_num(rs.getString("b_num"));
				dto.setB_name(rs.getString("b_name"));
				dto.setB_writer(rs.getString("b_writer"));
				dto.setB_pub(rs.getString("b_pub"));
				dto.setB_want(rs.getInt("b_want"));
				
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
		request.setAttribute("mharangdinmain", list);
		
		//페이징 관련 parameter 받아오기
		int nowPage=0, nowBlock=0;
		if(request.getParameter("nowPage") != null){nowPage = Integer.parseInt(request.getParameter("nowPage"));}
		if(request.getParameter("nowBlock") != null){nowBlock = Integer.parseInt(request.getParameter("nowBlock"));}

		// DB 연동 함수를 쓰기 위해 인스턴스 생성
		PagingBean pbean = new PagingBean();
				
		// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수!!
		PagingDto paging = pbean.Paging(list.size(),10, nowPage, 10, nowBlock);
						
		// parameter 보내기
		request.setAttribute("paging", paging);
		
	}
	
	/**
	 * 관리자의 리스트 삭제기능
	 * @param request
	 */
	
	public void delete(HttpServletRequest request){
		
		pool = DBConnectionMgr.getInstance();
		
		String b_num = request.getParameter("b_num");
				
			try{
				con = pool.getConnection();
				
				String sql="DELETE FROM tbl_book WHERE b_num=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, b_num);
				pstmt.executeUpdate();
				
			}catch(Exception err){
				System.out.println("delete() : " + err);
				err.printStackTrace();
			}finally{
				pool.freeConnection(con,pstmt);
			}
	}
}
