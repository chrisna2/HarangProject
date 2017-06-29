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
import login.LoginBean;
import paging.PagingBean;
import paging.dto.PagingDto;

/**
 * 티켓구매 및 환불처리.
 * @author YOO
 *
 */
public class TicketUseCommand implements CommandInterface {
	
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
		
		String m_id = request.getParameter("m_id");
		String f_num = request.getParameter("f_num");
		String check = request.getParameter("check");
		int f_point = Integer.parseInt(request.getParameter("f_point"));
		String f_title = request.getParameter("f_title");
	
		
		if(("use").equals(check)){
			
			request.setAttribute("result", using(f_num, m_id));
		}
		else if(("return").equals(check)){
			request.setAttribute("result", returning(f_num, m_id));
			returnTicket(f_point, f_num, m_id, f_title);
		}
		
		LoginBean refresh = new LoginBean();
		refresh.refreshSession(request);
		
		return "/WEB-INF/food/ticketResult.jsp";
	}

	public String returning(String f_num,String m_id){
		
		String sql = "UPDATE tbl_food_member SET fm_isuse = 'return', fm_usedate = NOW() WHERE m_id = ? and f_num = ?";
		String result = null;
		try {
			
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, f_num);
			pstmt.executeUpdate();
			
			result = "return";
			
		} 
		catch (Exception e) {
			System.out.println("ticketUse.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt);
		}
		return result;
	}
	
	
	public String using(String f_num,String m_id){
		
		String sql = "UPDATE tbl_food_member SET fm_isuse = 'return', fm_usedate = NOW() WHERE m_id = ? and f_num = ?";
		String result = null;
		try {
			
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, f_num);
			pstmt.executeUpdate();
			
			result = "used";
			
		} 
		catch (Exception e) {
			System.out.println("ticketUse.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt);
		}
		return result;
	}
	
	
	public void returnTicket(int f_point,String f_num,String member_id,String f_title){
		
		System.out.println(f_num);
		String r_content = "식권 환불 : "+ f_title;
		String admin_id = "admin01";
		
		//거래 기록 입력 쿼리
		String sql1 = "INSERT INTO tbl_record (r_point, r_content, m_giver, m_haver) VALUES (?, ?, ?, ?)";
		//주는 포인트 빼기
		String sql2 = "UPDATE tbl_member SET m_point= m_point - ? WHERE m_id = ? ";
		//받는 포인트 더하기
		String sql3 = "UPDATE tbl_member SET m_point= m_point + ? WHERE m_id = ? ";

		pool = DBConnectionMgr.getInstance();
		
		try {
			con = pool.getConnection();
			
			//포인트 거래기록 입력
			pstmt = con.prepareStatement(sql1);
			pstmt.setInt(1, f_point);
			pstmt.setString(2, r_content);
			pstmt.setString(3, admin_id);
			pstmt.setString(4, member_id);
			pstmt.executeUpdate();
			
			//관리자의 포인트 빼기
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, f_point);
			pstmt.setString(2, admin_id);
			pstmt.executeUpdate();
			
			//회원 포인트 더하기
			pstmt = con.prepareStatement(sql3);
			pstmt.setInt(1, f_point);
			pstmt.setString(2, member_id);
			pstmt.executeUpdate();
			
					
		} 
		catch (Exception e) {
			System.out.println( "TicketprocCommand.java : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt);
		}	
	}
	
	
}
