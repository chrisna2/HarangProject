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
import point.PointBean;

public class OkayCommand implements CommandInterface{
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

		PointBean point = new PointBean();
		
		LoginBean login = new LoginBean();
		MemberDTO member = login.getLoginInfo(request);
		
		String buyer_id = member.getM_id();
		String b_num = request.getParameter("b_num");
		String b_name = request.getParameter("b_name");
		String seller_id = request.getParameter("m_id");
		int bh_want = Integer.parseInt(request.getParameter("bh_want"));
		
		long giver_point = pointRecall();
		
		String r_content = "구매자가 " + b_name + " 수령확인을 하였습니다.";
		
		String result1 = point.tradePoint(r_content, giver_point, bh_want, "admin05", seller_id);
		
		if("complete".equals(result1)){
			String result2 = bookComplete(b_num, buyer_id, bh_want);
			
			if("success".equals(result2)){
				bookComplete2(b_num);
				System.out.println("성공입니다");
			}
			request.setAttribute("result", result2);
					}
		
		return "/WEB-INF/harangdin/tradeComplete.jsp";
	}
	
	public long pointRecall(){
		
		long pointRecall = 0;
		
		String sql="SELECT m_point FROM tbl_member WHERE m_id='admin05'";
		
		pool = DBConnectionMgr.getInstance();
		
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();				
			
			rs.next();
			
			pointRecall = rs.getLong("m_point");
			
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}
		
		return pointRecall;
	}
	
	public String bookComplete(String b_num, String buyer_id, int bh_want){
		String sql="UPDATE tbl_b_hunter SET bh_iscomplete='Y' WHERE m_id=? and bh_want = ? and b_num=?";
		
	
		String msg=null;
		
		pool = DBConnectionMgr.getInstance();
		
		
		System.out.println(buyer_id);
		int check = 0;
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, buyer_id);
			pstmt.setInt(2, bh_want);
			pstmt.setString(3, b_num);
			check = pstmt.executeUpdate();	
			
			if(check==0){
				System.out.println("실패");
				msg="fail";
			}
			else if(check==1){
				System.out.println("성공");
				msg="success";
			}
			
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}
		
		return msg;
	}
	
	public void bookComplete2(String b_num){
		String sql="UPDATE tbl_book SET b_iscomplete='완료' WHERE b_num=?";
		
		pool = DBConnectionMgr.getInstance();
		
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b_num);
			pstmt.executeUpdate();	
			
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}
	}
}
