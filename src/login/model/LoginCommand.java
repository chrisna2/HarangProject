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
		
		/*String url = "";
		
		pool = DBConnectionMgr.getInstance();
		
		//MemberDto dto = new MemberDto();
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		
		String sql = "select m_pw from tbl_member where m_id = ?";
		
		// DB 연결 접속
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			if(m_pw.equals(rs.getString(m_pw))){
				System.out.println("login success");
				url="/WEB-INF/login/main.jsp";
			}
			else if(!m_pw.equals(rs.getString(m_pw))){
				
				System.out.println("login failed");
				url="/WEB-INF/login/regform.jsp";
			}
			
		}catch(Exception err){
			System.out.println( "index.jsp : " + err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}			
*/		
		return "/WEB-INF/login/main.jsp";
		
	}

}
