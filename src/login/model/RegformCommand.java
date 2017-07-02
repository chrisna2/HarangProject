package login.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.ZipDTO;
import harang.dbcp.DBConnectionMgr;
import login.CommandInterface;


/**
 * 회원 등록 폼으로 이동하는 메소드
 * @author 나현기
 *
 */
public class RegformCommand implements CommandInterface {
	
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
		
		getSido(request);
		
		return"/WEB-INF/login/regform.jsp";
	}
	
	/**
	 * 초기 시/도의 목록을 불러오는 메소드
	 * @param request
	 */
	public void getSido(HttpServletRequest request){

		String sql = "SELECT sido FROM tbl_zip group by sido";
		ArrayList sidolist = new ArrayList();
		pool = DBConnectionMgr.getInstance();
		
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				ZipDTO dto = new ZipDTO();
				dto.setSido(rs.getString("sido"));
				sidolist.add(dto);
			}
			
		}catch(Exception err){
			
			System.out.println( "regform.jsp : " + err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}	
		request.setAttribute("sido", sidolist);
	}

}
