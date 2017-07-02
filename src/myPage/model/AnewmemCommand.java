package myPage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import myPage.CommandInterface;
/**
 * 회원전체리스트 출력 / 회원 상세보기
 * @author 박주선
 *
 */
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
	
		String m_birth=request.getParameter("m_birth");
	
	

	
		
			
			if(null!=m_birth){
				insert(request);
		return "/WEB-INF/myPage/a_newmemComplete.jsp";
		} 
			else
			{
			
				return "/WEB-INF/myPage/a_newMember.jsp";
			}
	}
	/**
	 * 예비회원등록
	 * @param request 서블릿 리퀘스트
	 */
	public void insert(HttpServletRequest request){
		pool = DBConnectionMgr.getInstance();
		String sql = null;
		String mid=request.getParameter("m_id");
			
			String mname=request.getParameter("m_name");
			System.out.println(mid);
			System.out.println(mname);
			if(mid !=null){
				sql = "insert into tbl_member(m_name,m_id,m_dept,m_birth,m_pw) values(?,?,?,?,?)";
			} else {
				System.out.println("mid 없어");
			}
			try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
				
			pstmt.setString(1, mname);
			pstmt.setString(2, mid);
			pstmt.setString(3, request.getParameter("m_dept"));
			pstmt.setString(4, request.getParameter("m_birth"));
			pstmt.setString(5, request.getParameter("m_birth"));
				
			pstmt.executeUpdate();
				
		}catch(Exception err){
			System.out.println(err);
		
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}			
	
				}	
	
	/**
	 * 예비회원등록시 학번마즈막3자리출력
	 * @param request 서블릿 리퀘스트
	 */
	public void num(HttpServletRequest request){
		pool = DBConnectionMgr.getInstance();
		String sql = null;
	
		MemberDTO dto = new MemberDTO();
			
			String num3 =null;
			try {
			
				
			sql="select max(m_id) as num3 from tbl_member where m_id like '%"
					+ request.getParameter("num4")
					+ "%'";
				
				
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			num3 = rs.getString("num3");
			
				
		}catch(Exception err){
			System.out.println(err);
		
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
	}	
			System.out.println(num3);
			request.setAttribute("num3", num3);
	}

}
