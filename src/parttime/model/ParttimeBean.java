package parttime.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import harang.dbcp.DBConnectionMgr;
import parttime.dto.ParttimeDto;
/**
 * 
 * @author 양혜민
 * 
 */
public class ParttimeBean {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	/**
	 * 생성자. DBConnectionMgr클래스를 통해 데이터베이스에 연결.
	 */
	public ParttimeBean(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DBCP 인스턴스 참조 실패 : " +err);
		}
	}
	
	/**
	 * 알바 모집 게시판 Getter 메서드.
	 */
	public ArrayList getParttimeList(){
		ArrayList list = new ArrayList();
		
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_parttime ORDER BY p_regdate DESC";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ParttimeDto dto = new ParttimeDto();
				dto.setP_num(rs.getString("p_num"));
				dto.setP_title(rs.getString("p_title"));
				dto.setP_regdate(rs.getDate("p_regdate"));
				dto.setP_deadline(rs.getDate("p_deadline"));
				dto.setP_wage(rs.getInt("p_wage"));
				dto.setP_term(rs.getString("p_term"));
				dto.setP_content(rs.getString("p_content"));
				dto.setP_tel(rs.getString("p_tel"));
				dto.setP_daycode(rs.getString("p_daycode"));
				dto.setP_location(rs.getString("p_location"));
				dto.setP_header(rs.getString("p_header"));
				dto.setP_cnt(rs.getInt("p_cnt"));
				dto.setM_id(rs.getString("m_id"));				
				
				list.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("getParttimeList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return list;
	}
	
	public int getCnt_apply(String p_num){
		int cnt_apply=0;
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT count(m_id) FROM tbl_parttime_member where p_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cnt_apply = rs.getInt("count(m_id)");
			}
			
		}catch(Exception err){
			System.out.println("getParttimeList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return cnt_apply;
	}
}
