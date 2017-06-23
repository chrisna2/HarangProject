package ajax.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dto.CalanderDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;

public class FoodCommand implements CommandInterface {
	
	//DB 커넥션 4 대장
	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;
	//DBCP 사용
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		String check = request.getParameter("check");
		ArrayList mlist = new ArrayList();		
		
		if("umenu".equals(check)){
			
			mlist = menulist(request);
		}
		else if("amenu".equals(check)){
			
			mlist = Amenulist(request);
		}
		return mlist;
	}
	
	public ArrayList menulist(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		String m_id = mdto.getM_id();
		
		String sql = "SELECT f.f_selldate, f.f_content, f.f_num, fm.fm_isuse "
				+ "FROM tbl_food f left join tbl_food_member fm "
				+ "on f.f_num = fm.f_num and fm.m_id = ? "
				+ "where f_selldate > sysdate()";
		
		ArrayList flist  = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CalanderDTO cdto = new CalanderDTO();
				
				cdto.setStart(rs.getString("f_selldate"));
				cdto.setTitle(rs.getString("f_content"));
				cdto.setId(rs.getString("f_num"));
				cdto.setIsuse(rs.getString("fm_isuse"));
				cdto.setAllDay(true);
				   if(("used").equals(rs.getString("fm_isuse"))){
	                   cdto.setColor("#616872");
	               }
	               else if(("return").equals(rs.getString("fm_isuse"))){
	                   cdto.setColor("#ff7f9d");
	               }
	               else if(("unuse").equals(rs.getString("fm_isuse"))){
	                   cdto.setColor("#7793ff");
	               }
	               else{
	            	   cdto.setColor("#F9FFAB");
	               }
				flist.add(cdto);
			}
		} 
		catch (Exception e) {
			System.out.println( "menuList.jsp : " + e);
			e.printStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		return flist;
	}
	
	public ArrayList Amenulist(HttpServletRequest request){
		
		Date now = new Date();		
		
		String sql = "SELECT f_selldate, f_content, f_num FROM tbl_food where f_selldate > sysdate()";
		
		ArrayList flist  = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				CalanderDTO cdto = new CalanderDTO();
				
				cdto.setStart(rs.getString("f_selldate"));
				cdto.setTitle(rs.getString("f_content"));
				cdto.setId(rs.getString("f_num"));
				cdto.setAllDay(true);
				   
				flist.add(cdto);
			}
		} 
		catch (Exception e) {
			System.out.println( "AmenuList.jsp : " + e);
			e.printStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		return flist;
	}

}




	
