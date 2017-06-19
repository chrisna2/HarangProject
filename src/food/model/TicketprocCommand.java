package food.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import harang.dbcp.DBConnectionMgr;

public class TicketprocCommand implements CommandInterface {

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
		
		
			int f_point = Integer.parseInt(request.getParameter("f_point"));
			String f_num = request.getParameter("f_num");
			System.out.println(f_num);
			String r_content = "식권 구매 : "+ request.getParameter("f_title") + " | 판매일 : " + request.getParameter("f_selldate");
			String member_id = request.getParameter("member_id");
			String admin_id = "admin01";
			
			
			//거래 기록 입력 쿼리
			String sql1 = "INSERT INTO tbl_record (r_point, r_content, m_giver, m_haver) VALUES (?, ?, ?, ?)";
			//주는 포인트 빼기
			String sql2 = "UPDATE tbl_member SET m_point= m_point - ? WHERE m_id = ? ";
			//받는 포인트 더하기
			String sql3 = "UPDATE tbl_member SET m_point= m_point + ? WHERE m_id = ? ";
			//식권 테이블 기록 
			String sql4 = "INSERT INTO tbl_food_member (m_id, f_num, fm_isuse) VALUES (?, ?, 'unuse')";

			pool = DBConnectionMgr.getInstance();
			
			try {
				con = pool.getConnection();
				
				//포인트 거래기록 입력
				pstmt = con.prepareStatement(sql1);
				pstmt.setInt(1, f_point);
				pstmt.setString(2, r_content);
				pstmt.setString(3, member_id);
				pstmt.setString(4, admin_id);
				pstmt.executeUpdate();
				
				//회원의 포인트 빼기
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, f_point);
				pstmt.setString(2, member_id);
				pstmt.executeUpdate();
				
				//관리자 포인트 더하기
				pstmt = con.prepareStatement(sql3);
				pstmt.setInt(1, f_point);
				pstmt.setString(2, admin_id);
				pstmt.executeUpdate();
				
				//식권에 기록 입력
				pstmt = con.prepareStatement(sql4);
				pstmt.setString(1, member_id);
				pstmt.setString(2, f_num);
				pstmt.executeUpdate();
				
			} 
			catch (Exception e) {
				System.out.println( "TicketprocCommand.java : " + e);
			}
			finally{
				// DBCP 접속해제
				pool.freeConnection(con, pstmt);
			}		
		
		
		return "/WEB-INF/food/buyComplete.jsp";
	}

}
