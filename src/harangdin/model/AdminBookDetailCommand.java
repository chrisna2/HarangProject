package harangdin.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.BookDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import login.LoginBean;

public class AdminBookDetailCommand implements CommandInterface {
	
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
		
		detailpac(request);
				
		point(request);
		
		if(null!=delete_check){
			delete(request);
			request.setAttribute("delete", "delete");
		}
		
		return "/WEB-INF/harangdin/a_book_detailpage.jsp";
		
	}
	
	
	public void detailpac(HttpServletRequest request){
		//로그인하는 개인정보 불러오기
				LoginBean bean = new LoginBean();
				MemberDTO member = bean.getLoginInfo(request);
				
				
				String sql= "SELECT b.b_name, b.b_num, m.m_id, b.b_writer, b.b_pub, b.b_stock, b.b_want, b.b_regdate, b.b_content, b.b_photo"
						+ " FROM tbl_book b, tbl_member m WHERE b.b_num = ? and m.m_id = ?";
				
				String b_num=request.getParameter("b_num");
				
				pool = DBConnectionMgr.getInstance();
				
				BookDTO dto=null;
				try {
					
					con = pool.getConnection();
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, b_num);
					pstmt.setString(2, member.getM_id());			
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
