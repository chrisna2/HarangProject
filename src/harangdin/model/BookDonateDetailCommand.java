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

import com.mysql.fabric.xmlrpc.base.Member;

import dto.BookDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import login.LoginBean;
import paging.PagingBean;
import paging.dto.PagingDto;
import point.PointBean;

public class BookDonateDetailCommand implements CommandInterface {
	
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
				
		String check = request.getParameter("check");
		
		detailpac(request);
				
		point(request);
		
		if("donate".equals(check)){
			String result = donate(request);
			
			if(result.equals("success")){
				PointBean point = new PointBean();
							
				String r_content = "[도서기부]" + request.getParameter("b_name") + " " + request.getParameter("b_regdate");
				LoginBean login = new LoginBean();
				MemberDTO admin = login.getLoginInfo(request);
				String haver_id = request.getParameter("m_id");
													
				String result2 = point.tradePoint(r_content, admin.getM_point(), 5000, admin.getM_id(), haver_id);
				
				if(result2.equals("complete")){
					String result3 = completeMessage(request);
					request.setAttribute("result", result3);
				}
				
			}
			else if(result.equals("fail")){
				request.setAttribute("result", "donate fail");
			}
		}
		
		return "/WEB-INF/harangdin/a_book_donatedetailpage.jsp";
		
	}
	
	
	public void detailpac(HttpServletRequest request){
		//로그인하는 개인정보 불러오기
			
				
				String sql= "SELECT b_name, b_num, b_writer, m_id, b_pub,b_stock,b_want, b_regdate, b_content, b_photo, b_iscomplete FROM tbl_book WHERE b_num = ?";
				
				String b_num=request.getParameter("b_num");
				
				pool = DBConnectionMgr.getInstance();
				
				BookDTO dto=null;
				try {
					
					con = pool.getConnection();
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, b_num);
					rs = pstmt.executeQuery();
					
					
					rs.next();

						dto = new BookDTO();
						
						dto.setB_name(rs.getString("b_name"));
						dto.setB_num(rs.getString("b_num"));
						dto.setM_id(rs.getString("m_id"));
						dto.setB_writer(rs.getString("b_writer"));
						dto.setB_pub(rs.getString("b_pub"));
						dto.setB_stock(rs.getInt("b_stock"));
						dto.setB_want(rs.getInt("b_want"));
						dto.setB_regdate(rs.getString("b_regdate"));
						dto.setB_content(rs.getString("b_content"));
						dto.setB_photo(rs.getString("b_photo"));
						dto.setB_iscomplete(rs.getString("b_iscomplete"));
					
					
				}catch(Exception err){
					System.out.println(err);
				}
				finally{
					// DBCP 접속해제
					pool.freeConnection(con,pstmt,rs);
				}
				
				request.setAttribute("i", dto);
	}
	
	public void point(HttpServletRequest request){
		
		String sql="select max(bh_want) as max_point from tbl_b_hunter where b_num=?;";
		
		String b_num=request.getParameter("b_num");
		
		pool = DBConnectionMgr.getInstance();
		
		String max_point = null;
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b_num);		
			rs = pstmt.executeQuery();
						
			rs.next();
			max_point = rs.getString("max_point");
			
	
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}
		
		request.setAttribute("max_point", max_point);
	}
	
	
	
	public String donate(HttpServletRequest request){
		
		String result = null;
		
		String sql="INSERT INTO tbl_b_hunter (b_num, m_id, bh_want, bh_choice, bh_iscomplete) VALUES (?, 'admin05', '5000', 'Y', 'Y')";
		
		String b_num=request.getParameter("b_num");
		
		pool = DBConnectionMgr.getInstance();
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b_num);		
			int check = pstmt.executeUpdate();
		
			if(check==0){
				result="fail";
			}
			else{
				result="success";
			}
	
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt);
		}
		
		return result;
	}
	
	
	
	public String completeMessage(HttpServletRequest request){
		
		String result = null;
		
		String sql = "UPDATE tbl_book SET b_iscomplete='기부완료' WHERE b_num=?";
		String b_num = request.getParameter("b_num");

		pool = DBConnectionMgr.getInstance();
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b_num);		
			int check = pstmt.executeUpdate();
		
			if(check==0){
				result="donate fail";
			}
			else{
				result="donate success";
			}
	
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt);
		}
		
		return result;
	}
}
