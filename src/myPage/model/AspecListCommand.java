package myPage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.omg.CORBA.Request;

import dto.CertiDTO;
import harang.dbcp.DBConnectionMgr;


public class AspecListCommand implements CommandInterface {
	
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
		
		
		listCommand(request);
		
		insert(request);
		
		return "/WEB-INF/myPage/a_specList.jsp";
	}
	
	
	public void listCommand(HttpServletRequest request){
		
		pool = DBConnectionMgr.getInstance();
		

		String sql;
		
		ArrayList list = new ArrayList();
		
		String keyword = request.getParameter("keyword");
		String keyfiled = request.getParameter("keyfiled");
		if (null==(keyfiled)) {
		
			sql = "SELECT * FROM tbl_certificate order by c_num";

		} else {
			sql = "SELECT * FROM tbl_certificate where " + keyword + 
					" like '%" + keyfiled + "%' order by c_num";
		}
		

		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {	
				CertiDTO dto = new CertiDTO();
				
				dto.setC_num(rs.getString("c_num"));
				dto.setC_name(rs.getString("c_name"));
				dto.setC_agency(rs.getString("c_agency"));
				dto.setC_point(rs.getInt("c_point"));

				
				list.add(dto);


			}
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}		

		request.setAttribute("keyword", keyword);
		request.setAttribute("keyfiled", keyfiled);
		request.setAttribute("aspeclist", list);
		
		
	}
	
	public void insert(HttpServletRequest request){
		pool = DBConnectionMgr.getInstance();
		String sql;
		
		
		
			sql = "insert into tbl_certificate(c_name,c_agency,c_point) values(?,?,?)";
		
			try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
		
				pstmt.setString(1, request.getParameter("c_name"));
				pstmt.setString(2, request.getParameter("c_agency"));
				pstmt.setInt(3, Integer.parseInt(request.getParameter("c_point")));
				pstmt.executeUpdate();
				
				
			
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}			
	}
	
	public void read(HttpServletRequest request){
		pool = DBConnectionMgr.getInstance();
		String sql = null;
		
		

		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			sql = "select * from tbl_certificate where c_num=?";
			pstmt.setString(1,(String) request.getAttribute("c_num"));
		
			
			if (rs.next()) {	
				CertiDTO dto = new CertiDTO();
				dto.setC_num(rs.getString("c_num"));
				dto.setC_name(rs.getString("c_name"));
				dto.setC_agency(rs.getString("c_agency"));
				dto.setC_point(rs.getInt("c_point"));
					
			}
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}		
		request.setAttribute("read", "read");
		
	}
	

}
