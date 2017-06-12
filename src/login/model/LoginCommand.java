package login.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import harang.dbcp.DBConnectionMgr;

public class LoginCommand implements CommandInterface {
	
	
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
		
		String url = "";
		
		pool = DBConnectionMgr.getInstance();
		
		//MemberDto dto = new MemberDto();
		String input_id = request.getParameter("m_id");
		String input_pw = request.getParameter("m_pw");
		
		String sql = "select m_pw, m_dept, m_mail, m_tel, m_addr from tbl_member where m_id = ?";
		
		
		// DB 연결 접속
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_id);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String m_pw = rs.getString("m_pw");
			String m_dept = rs.getString("m_dept");
			String m_mail = rs.getString("m_mail");
			String m_tel = rs.getString("m_tel");
			String m_addr = rs.getString("m_addr");
			
			//일반 회원 일때
			if(input_pw.equals(m_pw) && !m_dept.equals("관리자") && !m_mail.isEmpty() && !m_tel.isEmpty() && !m_addr.isEmpty()){
				url="/WEB-INF/login/main.jsp";
			}
			//관리자 일때.
			else if(input_pw.equals(m_pw) && m_dept.equals("관리자")){
				url="/WEB-INF/login/a_main.jsp";
			}
			//신규 회원 일때.
			else if(input_pw.equals(m_pw) && !m_dept.equals("관리자") && m_mail.isEmpty() && m_tel.isEmpty() && m_addr.isEmpty()){
				url="/WEB-INF/login/regform.jsp";
			}
			//비밀번호가 틀렸을때.
			else if(!input_pw.equals(m_pw)){
				url="/index.jsp";
			}
			
		}catch(Exception err){
			System.out.println( "index.jsp : " + err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}		
		
		return url;
		
	}

}
