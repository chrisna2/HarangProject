package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
/**
 * 로그인 정보를 가져오는 클래스.
 * @author 양헤민
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
	 * @param req 
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
	 * @param req
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
			}
			//일반 회원 일때
			else{
				session.setAttribute("member", mdto);
			}
			
		}catch(Exception err){
			System.out.println( "session refresh fail : " + err);
			err.printStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}		
	}
	
	
	
	
}
