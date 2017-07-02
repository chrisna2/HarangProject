package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dto.MemberDTO;
import dto.MessageDTO;
import dto.RecordDTO;
import harang.dbcp.DBConnectionMgr;
import oracle.net.aso.p;
/**
 * 로그인 정보를 가져오는 클래스.
 * @author 양헤민 , 나현기
 *
 */
public class LoginBean {
	
	//DB 커넥션 3 대장
	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;
	//DBCP 사용
	DBConnectionMgr pool;
	
	/**
	 * 세션에 저장된 로그인 정보를 가져오는 메서드.
	 * @param req  서블릿 리퀘스트
	 * @return MemberDTO 로그인정보 
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
	 * @param m_id 로그인 회원 id
	 * @return true 관리자 || false 일반회원 
	 */
	public Boolean adminCheck(String m_id){
		if(m_id.equals("admin01") || m_id.equals("admin02") || m_id.equals("admin03") 
				|| m_id.equals("admin04") || m_id.equals("admin05") || m_id.equals("admin06") ){
			return true;
		}
		return false;
	}
	
	/**
	 * 자기의 세션을 새로 받는 메소드 
	 * 용도 : 포인트 거래나 새로운 세션의 정보에 변화가 있을 때 페이지에서 최신화하는 용도
	 * DB에서 새로 받기 위한 용도 
	 * @param req 서블릿 리퀘스트
	 */
	public void refreshSession(HttpServletRequest req){
		
		MemberDTO member = getLoginInfo(req);
		String m_id = member.getM_id();
		HttpSession session = req.getSession();
		pool = DBConnectionMgr.getInstance();
		
		String sql = "select m_pw, m_name, m_dept, m_mail, m_tel, m_addr, m_point, m_photo, m_fee, m_grade, m_birth, m_regdate "
				+ "from tbl_member where m_id = ?";
		
		MemberDTO mdto = new MemberDTO();
		
		// DB 연결 접속
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String m_pw = rs.getString("m_pw");
			String m_name = rs.getString("m_name");
			String m_dept = rs.getString("m_dept");
			String m_mail = rs.getString("m_mail");
			String m_tel = rs.getString("m_tel");
			String m_addr = rs.getString("m_addr");
			long m_point = rs.getLong("m_point");
			String m_photo = rs.getString("m_photo");
			int m_fee = rs.getInt("m_fee");
			int m_grade = rs.getInt("m_grade");
			String m_birth = rs.getString("m_birth");
			String m_regdate = rs.getString("m_regdate");
			
			mdto.setM_id(m_id);
			mdto.setM_name(m_name);
			mdto.setM_dept(m_dept);
			mdto.setM_mail(m_mail);
			mdto.setM_tel(m_tel);
			mdto.setM_addr(m_addr);
			mdto.setM_point(m_point);
			mdto.setM_photo(m_photo);
			mdto.setM_fee(m_fee);
			mdto.setM_grade(m_grade);
			mdto.setM_birth(m_birth);
			mdto.setM_regdate(m_regdate);
		
			//관리자 일때.
			if(m_dept.equals("관리자")){
				session.setAttribute("admin", mdto);
				pointRefreshAdmin(m_id, session);
			}
			//일반 회원 일때
			else{
				session.setAttribute("member", mdto);
				pointRefreshUser(m_id, session);
			}
			
		}catch(Exception err){
			System.out.println( "session refresh fail : " + err);
			err.printStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}
		messageRefresh(m_id, session);
	}
	
	/**
	 * 받은 메시지를 새로고침 하는 메서드. into refreshSession
	 * @param m_id 학번
	 * @return 받은 메시지 리스트
	 */
	public void messageRefresh(String m_id,HttpSession session){
		
		ArrayList inboxlist = new ArrayList();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT t_num, t_title, t_send_date, m_sender, "
					+ "(select m_name from tbl_member where m_id = m_sender) as m_sender_name,"
					+ "(select m_photo from tbl_member where m_id = m_sender) as s_photo "
					+ " FROM tbl_text WHERE m_reader=? AND NOT m_sender=? AND t_read_del = 'N' "
					+ "ORDER BY t_send_date DESC limit 5";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MessageDTO msg = new MessageDTO();
				msg.setT_num(rs.getString("t_num"));
				msg.setT_title(rs.getString("t_title"));
				msg.setT_send_date(rs.getString("t_send_date"));
				msg.setM_sender(rs.getString("m_sender"));
				msg.setS_photo(rs.getString("s_photo"));
				msg.setM_sender_name(rs.getString("m_sender_name"));
				
				inboxlist.add(msg);
			}
			
		}catch(Exception err){
			System.out.println("getGivenMessageList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		session.setAttribute("head_msg",inboxlist);
	}
	
	/**
	 * 회원의 포인트를 새로고침 하는 메소드 into refreshSession
	 * @param m_id 학번
	 * @param session 세션
	 */
	public void pointRefreshUser(String m_id,HttpSession session){
		
		ArrayList plist  = new ArrayList();
		
		String sql  = "select r_regdate, r_content, r_point, m_giver, m_haver, "+
				"(select m_name from tbl_member where m_id = m_giver) as m_givername, "+
				"(select m_name from tbl_member where m_id = m_haver) as m_havername  "+
				"from tbl_record where m_giver = ? or  m_haver = ? order by r_regdate desc limit 5";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				RecordDTO rdto = new RecordDTO();
				
				rdto.setR_regdate(rs.getString("r_regdate"));
				rdto.setR_content(rs.getString("r_content"));
				rdto.setR_point(rs.getLong("r_point"));
				rdto.setM_giver(rs.getString("m_giver"));
				rdto.setM_haver(rs.getString("m_haver"));
				rdto.setM_givername(rs.getString("m_givername"));
				rdto.setM_havername(rs.getString("m_havername"));
				
				plist.add(rdto);
			}
		} 
		catch (Exception e) {
			System.out.println( "header.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		session.setAttribute("PLM", plist);
	}

	
	/**
	 * 관리자의 포인트 새로 고침 하는 메소드 into refreshSession
	 * @param m_id 학번 
	 * @param session 세션
	 */
	public void pointRefreshAdmin(String m_id,HttpSession session){
		
		
		ArrayList plist  = new ArrayList();
		
		String sql  = "select r_regdate, r_content, r_point, m_giver, m_haver, "+
				"(select m_name from tbl_member where m_id = m_giver) as m_givername, "+
				"(select m_name from tbl_member where m_id = m_haver) as m_havername  "+
				"from tbl_record where m_giver = ? or  m_haver = ? order by r_regdate desc limit 5";
		
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				RecordDTO rdto = new RecordDTO();
				
				rdto.setR_regdate(rs.getString("r_regdate"));
				rdto.setR_content(rs.getString("r_content"));
				rdto.setR_point(rs.getLong("r_point"));
				rdto.setM_giver(rs.getString("m_giver"));
				rdto.setM_haver(rs.getString("m_haver"));
				rdto.setM_givername(rs.getString("m_givername"));
				rdto.setM_havername(rs.getString("m_havername"));
				
				plist.add(rdto);
			}
		} 
		catch (Exception e) {
			System.out.println( "header.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
		session.setAttribute("PLA", plist);
	}
	
	
}
