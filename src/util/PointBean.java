package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import harang.dbcp.DBConnectionMgr;

/**
 * 포인트 거래 관련 메소드 빈
 * @author 나현기
 */
public class PointBean {
	
	//DB 커넥션 4 대장
	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;
	//DBCP 사용
	DBConnectionMgr pool;

	/**
	 * 포인트 거래 메소드 
	 * @param r_content 포인트 거래 내용
	 * @param giver_point 포인트 전송자의 보유 포인트
	 * @param r_point 포인트 거래량
	 * @param giver_id 포인트 전송자 아이디	
	 * @param haver_id 포인트 수신자 아이디
	 * @return 거래 완료 메세지 또는 오류 메세지 출력
	 */
	public String tradePoint(String r_content,long giver_point,int r_point,String giver_id,String haver_id){
		
		
		if(giver_point < r_point){
			System.out.println("보유 포인트 보다 전송 포인트가 더 많습니다.");
			return "overpoint";
		}
		
		//거래 기록 입력 쿼리
		String sql1 = "INSERT INTO tbl_record (r_point, r_content, m_giver, m_haver) VALUES (?, ?, ?, ?)";
		//주는 포인트 빼기
		String sql2 = "UPDATE tbl_member SET m_point= m_point - ? WHERE m_id = ? ";
		//받는 포인트 더하기
		String sql3 = "UPDATE tbl_member SET m_point= m_point + ? WHERE m_id = ? ";

		pool = DBConnectionMgr.getInstance();
		
		try {
			con = pool.getConnection();
			
			//거래기록 입력
			pstmt = con.prepareStatement(sql1);
			pstmt.setInt(1, r_point);
			pstmt.setString(2, r_content);
			pstmt.setString(3, giver_id);
			pstmt.setString(4, haver_id);
			pstmt.executeUpdate();
			
			//포인트 빼기
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, r_point);
			pstmt.setString(2, giver_id);
			pstmt.executeUpdate();
			
			//포인트 더하기
			pstmt = con.prepareStatement(sql3);
			pstmt.setInt(1, r_point);
			pstmt.setString(2, haver_id);
			pstmt.executeUpdate();
			
		} 
		catch (Exception e) {
			System.out.println( "PointBean : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt);
		}	
		//거래 완료 메세지
		return "complete";
	}
	
	/**
	 * 학번으로 사람의 보유 포인트 출력
	 * @param m_id 학번
	 * @return 학번이 가지고 있는 포인트 총량
	 */
	public long pointInfo(String m_id){
		
		long m_point = 0;
		String sql = "select m_point from tbl_member where m_id = ?";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			rs.next();
			m_point = rs.getLong("m_point");
		} 
		catch (Exception e) {
			System.out.println( "a_pointcheck.jsp : " + e);
			e.getStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
		return m_point;
	}

}
