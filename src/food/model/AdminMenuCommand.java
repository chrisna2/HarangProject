package food.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.FoodMemberDTO;
import harang.dbcp.DBConnectionMgr;

/**
 * 관리자 학식 메뉴 등록 수정 페이지 기능 클래스
 * @author 나현기
 *
 */
public class AdminMenuCommand implements CommandInterface {

	//DB 커넥션 4 대장
	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;
	//DBCP 사용
	DBConnectionMgr pool;
	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String check = request.getParameter("check");
		
		System.out.println(check);
		
		if("update".equals(check)){
			
			updateFood(request);
			
		}
		else if("delete".equals(check)){
			
			deleteFood(request);
			
		}
		else if("insert".equals(check)){
			
			insertFood(request);
			
		}
		return "/WEB-INF/food/a_menuList.jsp";
	}
	
	/**
	 * 신규 메뉴 수정 메소드
	 * @param request
	 */
	public void updateFood(HttpServletRequest request){
		
		String sql = "UPDATE tbl_food SET f_point = ?, f_title = ?, f_content = ? "
				+ "WHERE f_num = ?";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(request.getParameter("f_point")));
			pstmt.setString(2, request.getParameter("f_title"));
			pstmt.setString(3, request.getParameter("f_content"));
			pstmt.setString(4, request.getParameter("f_num"));
			
			pstmt.executeUpdate();
			
		} 
		catch (Exception e) {
			System.out.println("a_menulist.jsp : " + e);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt);
		}
		
		request.setAttribute("result", "update");
		
	}
	/**
	 * 신규 메뉴 등록 메소드
	 * @param request
	 */
	public void insertFood(HttpServletRequest request){
		
		String sql = "INSERT INTO tbl_food (f_point, f_title, f_content, f_selldate) VALUES (?, ?, ?, ?);";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(request.getParameter("f_point")));
			pstmt.setString(2, request.getParameter("f_title"));
			pstmt.setString(3, request.getParameter("f_content"));
			pstmt.setString(4, request.getParameter("f_selldate"));
			
			pstmt.executeUpdate();
			
		} 
		catch (Exception e) {
			System.out.println("a_menulist.jsp : " + e);
			e.getStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt);
		}
		
		request.setAttribute("result", "insert");
		
	}

	/**
	 * 기존 메뉴 삭제 메소드
	 * @param request
	 */
	public void deleteFood(HttpServletRequest request){
		
		String sql = "DELETE FROM tbl_food WHERE f_num=?";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("f_num"));			
			pstmt.executeUpdate();
			
		} 
		catch (Exception e) {
			System.out.println("a_menulist.jsp : " + e);
			e.getStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt);
		}
		
		request.setAttribute("result", "delete");
		
		
	}
	
	
}
