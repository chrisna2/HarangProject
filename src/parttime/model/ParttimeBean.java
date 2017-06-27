package parttime.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import dto.D_ApplyDTO;
import dto.DaetaDTO;
import dto.MemberDTO;
import dto.P_ApplyDTO;
import dto.ParttimeDTO;
import harang.dbcp.DBConnectionMgr;
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
	 * 세션에 저장된 로그인 정보를 가져오는 메서드.
	 * @param req
	 * @return
	 */
	public MemberDTO getLoginInfo(HttpServletRequest req){
		MemberDTO login = null;
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("member");
		MemberDTO admin = (MemberDTO)req.getSession().getAttribute("admin");
		
		if (admin != null){ 
			login = admin;
		}else{ 
			login = member;
		}
		
		return login;
	}
	
	/**
	 * 관리자인지 아닌지 체크하는 메서드.
	 * @param m_id
	 * @return true || false
	 */
	public Boolean adminCheck(String m_id){
		if(m_id.equals("admin01") || m_id.equals("admin02") || m_id.equals("admin03") 
				|| m_id.equals("admin04") || m_id.equals("admin05") || m_id.equals("admin06") ){
			return true;
		}
		return false;
	}
	
	/**
	 * DB에서 알바 모집 게시판의 모든 글 정보를 검색하는 메서드
	 */
	public ArrayList getParttimeList(){
		ArrayList list = new ArrayList();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_parttime ORDER BY p_regdate DESC";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ParttimeDTO dto = new ParttimeDTO();
				dto.setP_num(rs.getString("p_num"));
				dto.setP_title(rs.getString("p_title"));
				dto.setP_regdate(rs.getString("p_regdate"));
				dto.setP_deadline(rs.getString("p_deadline"));
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
	 * DB에서 알바 모집 게시판의 모든 글 정보를 검색하는 메서드
	 */
	public ArrayList getParttimeList(String keyField, String keyword){
		ArrayList list = new ArrayList();
		String sql=null;
		
		if(keyField.equals("제목")){
			sql = "SELECT * FROM tbl_parttime WHERE p_title like '%"+keyword+"%' ORDER BY p_regdate DESC";
		}else if(keyField.equals("시급")){
			sql = "SELECT * FROM tbl_parttime WHERE p_wage > "+keyword+" ORDER BY p_regdate DESC";
		}
		
		try{
			con = pool.getConnection();
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ParttimeDTO dto = new ParttimeDTO();
				dto.setP_num(rs.getString("p_num"));
				dto.setP_title(rs.getString("p_title"));
				dto.setP_regdate(rs.getString("p_regdate"));
				dto.setP_deadline(rs.getString("p_deadline"));
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
	 * DB에서 알바 모집 게시판의 내가 쓴 글 정보를 검색하는 메서드
	 */
	public ArrayList getMyParttimeList(String m_id){
		ArrayList list = new ArrayList();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_parttime WHERE m_id = ? ORDER BY p_regdate DESC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ParttimeDTO dto = new ParttimeDTO();
				dto.setP_num(rs.getString("p_num"));
				dto.setP_title(rs.getString("p_title"));
				dto.setP_regdate(rs.getString("p_regdate"));
				dto.setP_deadline(rs.getString("p_deadline"));
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
			System.out.println("getMyParttimeList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return list;
	}
	
	/**
	 * DB에서 대타 모집 게시판의 모든 글 정보를 검색하는 메서드
	 */
	public ArrayList getDaetaList(){
		ArrayList list = new ArrayList();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_daeta ORDER BY d_regdate DESC";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				DaetaDTO dto = new DaetaDTO();
				dto.setD_num(rs.getString("d_num"));
				dto.setD_title(rs.getString("d_title"));
				dto.setD_regdate(rs.getString("d_regdate"));
				dto.setD_deadline(rs.getString("d_deadline"));
				dto.setD_wage(rs.getInt("d_wage"));
				dto.setD_date(rs.getString("d_date"));
				dto.setD_content(rs.getString("d_content"));
				dto.setD_tel(rs.getString("d_tel"));
				dto.setD_deposit(rs.getInt("d_deposit"));
				dto.setD_location(rs.getString("d_location"));
				dto.setD_header(rs.getString("d_header"));
				dto.setD_cnt(rs.getInt("d_cnt"));
				dto.setM_id(rs.getString("m_id"));				
				
				list.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("getDaetaList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return list;
	}
	
	/**
	 * DB에서 대타 모집 게시판의 내가 쓴 글 정보를 검색하는 메서드
	 */
	public ArrayList getMyDaetaList(String m_id){
		ArrayList list = new ArrayList();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_daeta WHERE m_id = ? ORDER BY d_regdate DESC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				DaetaDTO dto = new DaetaDTO();
				dto.setD_num(rs.getString("d_num"));
				dto.setD_title(rs.getString("d_title"));
				dto.setD_regdate(rs.getString("d_regdate"));
				dto.setD_deadline(rs.getString("d_deadline"));
				dto.setD_wage(rs.getInt("d_wage"));
				dto.setD_date(rs.getString("d_date"));
				dto.setD_content(rs.getString("d_content"));
				dto.setD_tel(rs.getString("d_tel"));
				dto.setD_deposit(rs.getInt("d_deposit"));
				dto.setD_location(rs.getString("d_location"));
				dto.setD_header(rs.getString("d_header"));
				dto.setD_cnt(rs.getInt("d_cnt"));
				dto.setM_id(rs.getString("m_id"));				
				
				list.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("getMyDaetaList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return list;
	}
	
	/**
	 * 알바 모집 게시판에서 해당 글에 지원한 지원자 수를 검색하는 메서드.
	 * @param p_num  글번호
	 * @return 지원자수 
	 */
	public int getParttimeCnt_apply(String p_num){
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
			System.out.println("getParttimeCnt_apply() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return cnt_apply;
	}
	
	/**
	 * 대타 모집 게시판에서 해당 글에 지원한 지원자 수를 검색하는 메서드.
	 * @param p_num  글번호
	 * @return 지원자수 
	 */
	public int getDaetaCnt_apply(String p_num){
		int cnt_apply=0;
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT count(m_id) FROM tbl_daeta_member where d_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cnt_apply = rs.getInt("count(m_id)");
			}
			
		}catch(Exception err){
			System.out.println("getDaetaCnt_apply() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return cnt_apply;
	}
	
	/**
	 * 해당 알바 모집 글의 모든 정보를 검색하는 메서드.
	 * @param p_num 글번호
	 * @return 해당 글의 모든 정보(dto)
	 */
	public ParttimeDTO getParttime(String p_num){
		ParttimeDTO dto = new ParttimeDTO();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_parttime where p_num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setP_num(rs.getString("p_num"));
				dto.setP_title(rs.getString("p_title"));
				dto.setP_regdate(rs.getString("p_regdate"));
				dto.setP_deadline(rs.getString("p_deadline"));
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
	 * 해당 대타 모집 글의 모든 정보를 검색하는 메서드.
	 * @param p_num 글번호
	 * @return 해당 글의 모든 정보(dto)
	 */
	public DaetaDTO getDaeta(String d_num){
		DaetaDTO dto = new DaetaDTO();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_daeta where d_num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setD_num(rs.getString("d_num"));
				dto.setD_title(rs.getString("d_title"));
				dto.setD_regdate(rs.getString("d_regdate"));
				dto.setD_deadline(rs.getString("d_deadline"));
				dto.setD_wage(rs.getInt("d_wage"));
				dto.setD_date(rs.getString("d_date"));
				dto.setD_content(rs.getString("d_content"));
				dto.setD_tel(rs.getString("d_tel"));
				dto.setD_deposit(rs.getInt("d_deposit"));
				dto.setD_location(rs.getString("d_location"));
				dto.setD_header(rs.getString("d_header"));
				dto.setD_cnt(rs.getInt("d_cnt"));
				dto.setM_id(rs.getString("m_id"));		
			}
			
		}catch(Exception err){
			System.out.println("getDaeta() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		return dto;
	}

	/**
	 * 조회 수를 1 증가시키는 메서드.
	 * @param p_num 
	 */
	public void counterUp(String pORd, String pORd_num){
		try{
			con = pool.getConnection();
			
			String sql="UPDATE tbl_parttime SET p_cnt = p_cnt+1 WHERE p_num=?";
			
			if (pORd.equals("d")){ // 대타 모집 글 조회수
				sql = "UPDATE tbl_daeta SET d_cnt = d_cnt+1 WHERE d_num=?";
			}
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pORd_num);
			pstmt.executeUpdate();
		
		}catch(Exception err){
			System.out.println("counterUp() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}

	/**
	 * 회원 정보를 검색하는 메서드.
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
			
		}catch(Exception err){
			System.out.println("getMember() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return mdto;
	}
	
	/**
	 * 알바 지원 이력서를 DB에 삽입하는 메서드.
	 * @param p_num 
	 * @param m_id 
	 * @param pm_reason 
	 * @param pm_career
	 * @param pm_wanttime
	 */
	public void createParttimeResume(String p_num, String m_id, 
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
			System.out.println("createParttimeResume() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 대타 지원 이력서를 DB에 삽입하는 메서드.
	 * @param p_num 
	 * @param m_id 
	 * @param pm_reason 
	 * @param pm_career
	 * @param pm_wanttime
	 */
	public void createDaetaResume(String d_num, String m_id, String dm_reason){
		try{
			con = pool.getConnection();
			
			String sql="INSERT INTO tbl_daeta_member(d_num, m_id, dm_reason, "
					+ " dm_choice, dm_report) VALUES(?,?,?,'N','N')";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d_num);
			pstmt.setString(2, m_id);
			pstmt.setString(3, dm_reason);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("createDaetaResume() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}

	/**
	 * 게시글을 삭제하는 메서드
	 * @param p_num
	 */
	public void deleteParttime(String p_num){
		try{
			// 게시글에 지원한 지원자들을 먼저 삭제한다.
			deleteParttimeApply(p_num);
			
			// 그 다음에 게시글을 삭제할 수 있다.
			String sql="DELETE FROM tbl_parttime WHERE p_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_num);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("deleteParttime() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 게시글을 삭제하는 메서드
	 * @param p_num
	 */
	public void deleteDaeta(String d_num){
		try{
			// 게시글에 지원한 지원자들을 먼저 삭제한다.
			deleteDaetaApply(d_num);
			
			// 그 다음에 게시글을 삭제할 수 있다.
			String sql="DELETE FROM tbl_daeta WHERE d_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d_num);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("deleteDaeta() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 게시글을 지우기 이전에 게시글에 지원한 지원자들을 먼저 삭제하는 메서드.
	 * @param p_num
	 */
	public void deleteParttimeApply(String p_num){
		try{
			con = pool.getConnection();
			
			String sql="DELETE FROM tbl_parttime_member WHERE p_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_num);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("deleteParttimeApply() : " + err);
			err.printStackTrace();
		}
	}
	
	/**
	 * 게시글을 지우기 이전에 게시글에 지원한 지원자들을 먼저 삭제하는 메서드.
	 * @param p_num
	 */
	public void deleteDaetaApply(String d_num){
		try{
			con = pool.getConnection();
			
			String sql="DELETE FROM tbl_daeta_member WHERE d_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d_num);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("deleteDaetaApply() : " + err);
			err.printStackTrace();
		}
	}

	/**
	 * 알바 모집 게시글에 지원한 지원자 목록을 검색하는 메서드.
	 * @param p_num
	 * @return 지원자 목록
	 */
	public ArrayList getParttimeApplyList(String p_num){
		ArrayList applyList = new ArrayList();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_parttime_member WHERE p_num = ? ORDER BY pm_regdate ASC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				P_ApplyDTO dto = new P_ApplyDTO();
				
				dto.setP_num(rs.getString("p_num"));
				dto.setM_id(rs.getString("m_id"));
				dto.setPm_reason(rs.getString("pm_reason"));
				dto.setPm_career(rs.getString("pm_wanttime"));
				dto.setPm_regdate(rs.getString("pm_regdate"));
				dto.setPm_choice(rs.getString("pm_choice"));
				
				applyList.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("getParttimeApplyList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return applyList;
	}
	
	/**
	 * 내가 알바 모집 게시글에 지원한 목록을 검색하는 메서드.
	 * @param m_id
	 * @return 글 목록
	 */
	public ArrayList getMyParttimeApplyList(String m_id){
		ArrayList applyList = new ArrayList();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_parttime_member WHERE m_id = ? ORDER BY pm_regdate DESC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				P_ApplyDTO dto = new P_ApplyDTO();
				
				dto.setP_num(rs.getString("p_num"));
				dto.setM_id(rs.getString("m_id"));
				dto.setPm_reason(rs.getString("pm_reason"));
				dto.setPm_career(rs.getString("pm_wanttime"));
				dto.setPm_regdate(rs.getString("pm_regdate"));
				dto.setPm_choice(rs.getString("pm_choice"));
				
				applyList.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("getMyParttimeApplyList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return applyList;
	}
	
	/**
	 * 대타 모집 게시글에 지원한 지원자 목록을 검색하는 메서드.
	 * @param p_num
	 * @return 지원자 목록
	 */
	public ArrayList getDaetaApplyList(String d_num){
		ArrayList applyList = new ArrayList();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_daeta_member WHERE d_num = ? ORDER BY dm_regdate ASC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				D_ApplyDTO dto = new D_ApplyDTO();
				
				dto.setD_num(rs.getString("d_num"));
				dto.setM_id(rs.getString("m_id"));
				dto.setDm_reason(rs.getString("dm_reason"));
				dto.setDm_iscomplete(rs.getString("dm_iscomplete"));
				dto.setDm_regdate(rs.getString("dm_regdate"));
				dto.setDm_choice(rs.getString("dm_choice"));
				dto.setDm_report(rs.getString("dm_report"));
				
				applyList.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("getDaetaApplyList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return applyList;
	}
	
	/**
	 * 내가 대타 모집 게시글에 지원한 목록을 검색하는 메서드.
	 * @param m_id
	 * @return 글 목록
	 */
	public ArrayList getMyDaetaApplyList(String m_id){
		ArrayList applyList = new ArrayList();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_daeta_member WHERE m_id = ? ORDER BY dm_regdate DESC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				D_ApplyDTO dto = new D_ApplyDTO();
				
				dto.setD_num(rs.getString("d_num"));
				dto.setM_id(rs.getString("m_id"));
				dto.setDm_reason(rs.getString("dm_reason"));
				dto.setDm_iscomplete(rs.getString("dm_iscomplete"));
				dto.setDm_regdate(rs.getString("dm_regdate"));
				dto.setDm_choice(rs.getString("dm_choice"));
				dto.setDm_report(rs.getString("dm_report"));
				
				applyList.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("getMyDaetaApplyList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return applyList;
	}
	
	/**
	 * 해당 게시글에 지원한 지원자의 이력서 정보를 검색하는 메서드.
	 * @param m_id
	 * @param p_num
	 * @return 지원자의 이력서 폼
	 */
	public P_ApplyDTO getParttimeApply(String m_id, String p_num){
		P_ApplyDTO dto = new P_ApplyDTO();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_parttime_member WHERE p_num = ? AND m_id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_num);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				dto.setP_num(rs.getString("p_num"));
				dto.setM_id(rs.getString("m_id"));
				dto.setPm_reason(rs.getString("pm_reason"));
				dto.setPm_career(rs.getString("pm_wanttime"));
				dto.setPm_regdate(rs.getString("pm_regdate"));
				dto.setPm_choice(rs.getString("pm_choice"));
			}
			
		}catch(Exception err){
			System.out.println("getParttimeApply() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return dto;
	}
	
	/**
	 * 해당 게시글에 지원한 지원자의 이력서 정보를 검색하는 메서드.
	 * @param m_id
	 * @param d_num
	 * @return 지원자의 이력서 폼
	 */
	public D_ApplyDTO getDaetaApply(String m_id, String d_num){
		D_ApplyDTO dto = new D_ApplyDTO();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_daeta_member WHERE d_num = ? AND m_id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d_num);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				dto.setD_num(rs.getString("d_num"));
				dto.setM_id(rs.getString("m_id"));
				dto.setDm_reason(rs.getString("dm_reason"));
				dto.setDm_regdate(rs.getString("dm_regdate"));
				dto.setDm_choice(rs.getString("dm_choice"));
				dto.setDm_iscomplete(rs.getString("dm_iscomplete"));
				dto.setDm_report(rs.getString("dm_report"));
			}
			
		}catch(Exception err){
			System.out.println("getDaetaApply() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return dto;
	}

	/**
	 * 채용 버튼을 누를 시 DB에 채용여부를 저장하는 메서드.
	 * @param m_id
	 * @param p_num
	 */
	public void updateParttimeChoice(String m_id, String p_num){
		
		try{
			con = pool.getConnection();
			
			String sql="UPDATE tbl_parttime_member SET pm_choice = 'Y' WHERE p_num = ? AND m_id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_num);
			pstmt.setString(2, m_id);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("updateParttimeChoice() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 채용 버튼을 누를 시 DB에 채용여부를 저장하는 메서드.
	 * @param m_id
	 * @param p_num
	 */
	public void updateDaetaChoice(String m_id, String d_num){
		
		try{
			con = pool.getConnection();
			
			String sql="UPDATE tbl_daeta_member SET dm_choice = 'Y' WHERE d_num = ? AND m_id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d_num);
			pstmt.setString(2, m_id);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("updateDaetaChoice() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 지원 취소한 경우 DB에서 지원 내역 삭제하는 메서드.
	 * @param m_id
	 * @param p_num
	 */
	public void deleteParttimeApply(String m_id, String p_num){
		try{
			con = pool.getConnection();
			
			String sql="DELETE FROM tbl_parttime_member WHERE p_num = ? AND m_id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_num);
			pstmt.setString(2, m_id);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("deleteApply() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 지원 취소한 경우 DB에서 지원 내역 삭제하는 메서드.
	 * @param m_id
	 * @param d_num
	 */
	public void deleteDaetaApply(String m_id, String d_num){
		try{
			con = pool.getConnection();
			
			String sql="DELETE FROM tbl_daeta_member WHERE d_num = ? AND m_id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d_num);
			pstmt.setString(2, m_id);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("deleteDaetaApply() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}

	/**
	 * 알바 모집 게시판에 글을 추가하는 메서드.
	 * @param dto
	 */
	public void insertParttime(ParttimeDTO dto){
		try{
			con = pool.getConnection();
			
			String sql="INSERT INTO tbl_parttime(p_title, p_deadline, p_wage, p_term, p_content, p_tel, p_daycode, p_location, p_header, m_id) "
					+ "VALUES (?,?,?,?,?,?,?,?,?,?) ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getP_title());
			pstmt.setString(2, dto.getP_deadline());
			pstmt.setInt(3, dto.getP_wage());
			pstmt.setString(4, dto.getP_term());
			pstmt.setString(5, dto.getP_content());
			pstmt.setString(6, dto.getP_tel());
			pstmt.setString(7, dto.getP_daycode());
			pstmt.setString(8, dto.getP_location());
			pstmt.setString(9, dto.getP_header());
			pstmt.setString(10, dto.getM_id());			
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("insertParttime() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 대타 모집 게시판에 글을 추가하는 메서드.
	 * @param dto
	 */
	public void insertDaeta(DaetaDTO dto){
		try{
			con = pool.getConnection();
			
			String sql="INSERT INTO tbl_daeta(d_title, d_deadline, d_wage, d_date, d_content, d_tel, d_deposit, d_location, d_header, m_id) "
					+ "VALUES (?,?,?,?,?,?,?,?,?,?) ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getD_title());
			pstmt.setString(2, dto.getD_deadline());
			pstmt.setInt(3, dto.getD_wage());
			pstmt.setString(4, dto.getD_date());
			pstmt.setString(5, dto.getD_content());
			pstmt.setString(6, dto.getD_tel());
			pstmt.setInt(7, dto.getD_deposit());
			pstmt.setString(8, dto.getD_location());
			pstmt.setString(9, dto.getD_header());
			pstmt.setString(10, dto.getM_id());			
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("insertDaeta() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 알바 모집 글을 수정하는 메서드.
	 * @param dto
	 */
	public void updateParttime(ParttimeDTO dto){
		try{
			con = pool.getConnection();
			
			String sql="UPDATE tbl_parttime SET p_title = ?, p_deadline =? , p_wage =? , "
					+ "p_term=?, p_content=?, p_tel=?, p_daycode=?, p_location=?, p_header=? "
					+ "WHERE p_num = ? ";
					
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getP_title());
			pstmt.setString(2, dto.getP_deadline());
			pstmt.setInt(3, dto.getP_wage());
			pstmt.setString(4, dto.getP_term());
			pstmt.setString(5, dto.getP_content());
			pstmt.setString(6, dto.getP_tel());
			pstmt.setString(7, dto.getP_daycode());
			pstmt.setString(8, dto.getP_location());
			pstmt.setString(9, dto.getP_header());
			pstmt.setString(10, dto.getP_num());
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("updateParttime() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 대타 모집 글을 수정하는 메서드.
	 * @param dto
	 */
	public void updateDaeta(DaetaDTO dto){
		try{
			con = pool.getConnection();
			
			String sql="UPDATE tbl_daeta SET d_title=?, d_deadline=?, d_wage=?, d_date=?, d_content=?, "
					+ "d_tel=?, d_deposit=?, d_location=?, d_header=? WHERE d_num = ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getD_title());
			pstmt.setString(2, dto.getD_deadline());
			pstmt.setInt(3, dto.getD_wage());
			pstmt.setString(4, dto.getD_date());
			pstmt.setString(5, dto.getD_content());
			pstmt.setString(6, dto.getD_tel());
			pstmt.setInt(7, dto.getD_deposit());
			pstmt.setString(8, dto.getD_location());
			pstmt.setString(9, dto.getD_header());
			pstmt.setString(10, dto.getD_num());			
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("updateDaeta() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}

	/**
	 * 해당글의 대타로 선택된 사람을 검색하는 메서드.
	 * @param d_num
	 * @return
	 */
	public String getPicked(String d_num){
		String m_id = null;
		try{
			con = pool.getConnection();
			
			String sql="SELECT m_id FROM tbl_daeta_member WHERE d_num=? AND dm_choice='Y' ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				m_id = rs.getString("m_id");
			}
			
		}catch(Exception err){
			System.out.println("getPicked() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		return m_id;
	}

	public void updateDaetaMember(D_ApplyDTO dto){
		try{
			con = pool.getConnection();
			
			String sql="UPDATE tbl_daeta_member SET dm_iscomplete=? WHERE m_id=? AND d_num=?";
					
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getDm_iscomplete());
			pstmt.setString(2, dto.getM_id());
			pstmt.setString(3, dto.getD_num());
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("updateDaetaMember() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
}
