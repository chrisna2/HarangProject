package parttime.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import parttime.dto.ParttimeDto;
/**
 * 알바 지원 메뉴에서 필요한 DB연결 함수들을 모아놓은 클래스
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
	 * DB에서 알바 모집 게시판의 모든 글 정보를 검색하는 함수
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
	
	/**
	 * 해당 글에 지원한 지원자 수를 검색하는 함수.
	 * @param p_num  글번호
	 * @return 지원자수 
	 */
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
			System.out.println("getCnt_apply() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return cnt_apply;
	}
	
	/**
	 * 해당 글의 모든 정보를 검색하는 함수.
	 * @param p_num 글번호
	 * @return 해당 글의 모든 정보(dto)
	 */
	public ParttimeDto getParttime(String p_num){
		ParttimeDto dto = new ParttimeDto();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_parttime where p_num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
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
				dto.setM_id(rs.getString("m_id"));
				dto.setP_cnt(rs.getInt("p_cnt"));
			}
			
		}catch(Exception err){
			System.out.println("getParttime() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		return dto;
	}

	/**
	 * 조회 수를 1 증가시키는 함수.
	 * @param p_num 
	 */
	public void counterUp(String p_num){
		try{
			con = pool.getConnection();
			
			String sql="UPDATE tbl_parttime SET p_cnt = p_cnt+1 WHERE p_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_num);
			pstmt.executeUpdate();
		
		}catch(Exception err){
			System.out.println("counterUp() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}

	/**
	 * 회원 정보를 검색하는 함수.
	 * @param m_id 회원id
	 * @return 회원정보
	 */
	public MemberDTO getMember(String m_id){
		MemberDTO mdto = new MemberDTO();
		
		try{
			con = pool.getConnection();
			
			String sql="select * from tbl_member where m_id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				mdto.setM_id(rs.getString("m_id"));
				mdto.setM_name(rs.getString("m_name"));
				mdto.setM_dept(rs.getString("m_dept"));
				mdto.setM_mail(rs.getString("m_mail"));
				mdto.setM_tel(rs.getString("m_tel"));
				mdto.setM_addr(rs.getString("m_addr"));
				mdto.setM_point(rs.getLong("m_point"));
				mdto.setM_photo(rs.getString("m_photo"));
				mdto.setM_fee(rs.getInt("m_fee"));
				mdto.setM_grade(rs.getInt("m_grade"));
				mdto.setM_birth(rs.getString("m_birth"));
				mdto.setM_regdate(rs.getString("m_regdate"));
			}
			
			System.out.println("bean : " + mdto.getM_name());
		}catch(Exception err){
			System.out.println("getMember() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return mdto;
	}
	
	/**
	 * 이력서를 DB에 삽입하는 함수.
	 * @param p_num 
	 * @param m_id 
	 * @param pm_reason 
	 * @param pm_career
	 * @param pm_wanttime
	 */
	public void createResume(String p_num, String m_id, 
			String pm_reason, String pm_career, String pm_wanttime){
		try{
			con = pool.getConnection();
			
			String sql="INSERT INTO tbl_parttime_member(p_num, m_id, pm_reason, "
					+ "pm_career, pm_wanttime, pm_choice) "
					+ "VALUES(?,?,?,?,?,'N')";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_num);
			pstmt.setString(2, m_id);
			pstmt.setString(3, pm_reason);
			pstmt.setString(4, pm_career);
			pstmt.setString(5, pm_wanttime);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("createResume() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
}
