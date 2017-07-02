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
 * 관리자 기부목록 페이지
 * @author 서지윤
 *
 */

public class AdminDonateCommand implements CommandInterface {
	
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
		
		return "/WEB-INF/harangdin/a_harangdin_donate.jsp";
		
	}

	/**
	 * 학생들의 도서 기부목록
	 * @param request 서블릿 리퀘스트
	 */
	public void list(HttpServletRequest request){
		
		
		String sql;
		
		ArrayList list = new ArrayList();
		
		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");
		
		//System.out.println(keyword +"." + keyfield);
		
		if(keyword == null || keyword.equals("")){
			sql = "SELECT b.b_num, b.b_name, b.b_writer, b.b_pub, m.m_id, m.m_name from tbl_book b, tbl_member m "
					+ "where m.m_id=b.m_id and b.b_choice='기부' order by b.b_regdate desc";			
		}
		else{
			sql ="SELECT b.b_num, b.b_name, b.b_writer, b.b_pub, m.m_id, m.m_name, from tbl_book b, tbl_member m"
					+ " where m.m_id=b.m_id and b.b_choice='기부' and " + keyfield + " like '%" + keyword + "%' order by b.b_regdate desc";
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
				dto.setM_id(rs.getString("m_id"));
				dto.setM_name(rs.getString("m_name"));
				
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
		request.setAttribute("dlist", list);
		
		//페이징 관련 parameter 받아오기
		int nowPage=0, nowBlock=0;
		if(request.getParameter("nowPage") != null){nowPage = Integer.parseInt(request.getParameter("nowPage"));}
		if(request.getParameter("nowBlock") != null){nowBlock = Integer.parseInt(request.getParameter("nowBlock"));}

		// DB 연동 함수를 쓰기 위해 인스턴스 생성
		PagingBean pbean = new PagingBean();
				
		// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수!!
		PagingDto paging = pbean.Paging(list.size(),5, nowPage, 3, nowBlock);
						
		// parameter 보내기
		request.setAttribute("paging", paging);
		
	}
	
	/**
	 * 관리자의 기부 도서 목록 삭제
	 * @param request 서블릿 리퀘스트
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
