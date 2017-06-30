package myPage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.CertiDTO;
import harang.dbcp.DBConnectionMgr;
import paging.PagingBean;
import paging.dto.PagingDto;

/**
 * 관리자 자격증 리스트출력,상세보기,자격증추가,수정 
 * @author 박주선
 *
 */
public class AspecListCommand implements CommandInterface {
	
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
//		
		
	String c_num = request.getParameter("c_num");
	String read = request.getParameter("read2");	
	
	
		if(!(c_num == null)){
			read(request);
		}
		
		/*insert(request);
			update(request);
		 */	
		
		// 넘어온 read가 널이 아닐시 
		// 수정 버튼을 클릭시 수정폼을 사라지게 한다.
		if(!(read == null)){
			update(request);
		}
		
			insert(request);
	
		listCommand(request);
		
		
		
		
		
		return "/WEB-INF/myPage/a_specList.jsp";
	}
	
	/**
	 * 자격증 전체목록
	 * @param request
	 */
	public void listCommand(HttpServletRequest request){
		
		pool = DBConnectionMgr.getInstance();
		

		String sql;
		
		ArrayList list = new ArrayList();
		
		
		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");
		
		if (null==(keyfield)) {
		
			sql = "SELECT * FROM tbl_certificate order by c_num";

		} else {
			sql = "SELECT * FROM tbl_certificate where " + keyword + 
					" like '%" + keyfield + "%' order by c_num";
		}
		

		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {	
				CertiDTO dto = new CertiDTO();
				
				dto.setC_num(rs.getString("c_num"));
				dto.setC_name(rs.getString("c_name"));
				dto.setC_agency(rs.getString("c_agency"));
				dto.setC_point(rs.getInt("c_point"));

				
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
		request.setAttribute("aspeclist", list);
		
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
	 * 자격증등록
	 * @param request
	 */
	public void insert(HttpServletRequest request){
		pool = DBConnectionMgr.getInstance();
		String sql;

			
			if(request.getParameter("c_name")!=null){
				sql = "insert into tbl_certificate(c_name,c_agency,c_point) values(?,?,?)";
			try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
		
				pstmt.setString(1, request.getParameter("c_name"));
				pstmt.setString(2, request.getParameter("c_agency"));
				pstmt.setInt(3, Integer.parseInt(request.getParameter("c_point")));
				pstmt.executeUpdate();
				
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}			
	
				}	else{
					
					listCommand(request);
				}
	}
	/**
	 * 자격증상세보기
	 * @param request
	 */
	public void read(HttpServletRequest request){
		pool = DBConnectionMgr.getInstance();
		String sql;
		CertiDTO dto = new CertiDTO();
	
		try {
			sql = "select * from tbl_certificate where c_num=?";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("c_num"));
			rs = pstmt.executeQuery();
			rs.next();
				dto.setC_num(rs.getString("c_num"));
				dto.setC_name(rs.getString("c_name"));
				dto.setC_agency(rs.getString("c_agency"));
				dto.setC_point(rs.getInt("c_point"));
				
			
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}		
		request.setAttribute("read", dto);
		}
	
	/**
	 * 자격증정보수정
	 * @param request
	 */
	public void update(HttpServletRequest request){
		
		pool = DBConnectionMgr.getInstance();
		try{
			String sql="update tbl_certificate set c_name=?, c_agency=?, c_point=? where c_num=?";
		   
			  
			   con = pool.getConnection();
			   pstmt = con.prepareStatement(sql);

			  
				pstmt.setString(1, request.getParameter("c_name"));
				pstmt.setString(2, request.getParameter("c_agency"));
				pstmt.setInt(3, Integer.parseInt(request.getParameter("c_point")));
				pstmt.setString(4, request.getParameter("c_num"));
				pstmt.executeUpdate();
				
		}catch (Exception e) {
			System.out.println("updateBoard()에서 오류 ");
			e.printStackTrace();
		}

		finally {
			pool.freeConnection(con,pstmt,rs);
		}
			
		request.removeAttribute("read");
	}
	
	}
	


