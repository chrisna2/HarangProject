package myPage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import harang.dbcp.DBConnectionMgr;

public class AnewmemCommand implements CommandInterface {

	
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
			insert(request);
		return "/WEB-INF/myPage/a_newMember.jsp";
	}
	
	public void insert(HttpServletRequest request){
		pool = DBConnectionMgr.getInstance();
		String sql = null;

			String mid=request.getParameter("m_id");
			String mname=request.getParameter("m_name");
			System.out.println(mid);
			System.out.println(mname);
			if(mid !=null){
				sql = "insert into tbl_member(m_name,m_id) values(?,?)";
			} else {
				System.out.println("mid 없어");
			}
			try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
				
			pstmt.setString(1, mname);
			pstmt.setString(2, mid);
				
			pstmt.executeUpdate();
				
		}catch(Exception err){
			System.out.println(err);
		
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}			
	
				}	


}
