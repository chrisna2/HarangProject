package facilities.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.activation.DataSource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PgMemberDTO;
import dto.PlaygroundDTO;
import harang.dbcp.DBConnectionMgr;

public class AfacilAddDelCommand implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs;
	
	DBConnectionMgr pool;
	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 디버깅용.
		
		
		String delete = request.getParameter("delete");
		String modified = request.getParameter("modified");
		String addFacil = request.getParameter("addFacil");
		String deleteOK = request.getParameter("deleteOK");
		
		loadlist(request);
		
		if(null != delete){
			delete(request, delete);
		}
		
		else if(null != modified){
			modified(request, modified);
			}
		
		else if(null != addFacil){
			addFacil(request);
		}
		
		else if(null != deleteOK){
			deleteOK(request, deleteOK);
			
		}
		
		return "/WEB-INF/facil/a_facilities_adddel.jsp";
	}
	


	// 기본 페이지 출력.
	public void loadlist(HttpServletRequest request){
		
		// 검색을 위한 파라미터를 가져온다.
		String keyfield = request.getParameter("keyfield");
		String keyword = request.getParameter("keyword");
		
		// 기본 쿼리문.
		String sql= null;
		ArrayList<Object> list = new ArrayList<Object>();
		
		// 검색을 위한 if문.
		if(null != keyfield){
			sql = "SELECT * FROM tbl_playground "
				+ "WHERE " 
				+ keyword
				+ " LIKE '%" + keyfield + "%'";
			
			System.out.println(2);
			System.out.println(sql);
		}
		else{
			sql = "SELECT * FROM tbl_playground";	
		}
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				
				PlaygroundDTO pgdto = new PlaygroundDTO();

				pgdto.setPg_num(rs.getString("pg_num"));
				pgdto.setPg_type(rs.getString("pg_type"));
				pgdto.setPg_name(rs.getString("pg_name"));
				pgdto.setPg_content(rs.getString("pg_content"));
				pgdto.setPg_point(rs.getInt("pg_point"));

				list.add(pgdto);
				
			}

		} catch (Exception e) {
			System.out.println("a_facilities_adddel : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("keyfield", keyfield);
		request.setAttribute("keyword", keyword);
	}
	
	//시설 삭제
	public void delete(HttpServletRequest request, String delete){
		
		
		String sql = "SELECT * FROM tbl_playground WHERE pg_num=?";
		PlaygroundDTO pgdto = null;
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delete);
			rs = pstmt.executeQuery();
			
			pgdto = new PlaygroundDTO();

			rs.next();
			pgdto.setPg_num(rs.getString("pg_num"));
			pgdto.setPg_type(rs.getString("pg_type"));
			pgdto.setPg_name(rs.getString("pg_name"));
			pgdto.setPg_content(rs.getString("pg_content"));
			pgdto.setPg_point(rs.getInt("pg_point"));

		} catch (Exception e) {
			System.out.println("a_facilities_adddel : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		request.setAttribute("pgdto", pgdto);
		
	}
	
	//시설 내용 수정
	public void modified(HttpServletRequest request, String _modified){
		String sql = null;		
	}
	
	//시설추가
	private void addFacil(HttpServletRequest request){
		String sql = null;
	}
	
	//시설 최종 삭제
	private void deleteOK(HttpServletRequest request, String deleteOK) {
		String sql = null;
		sql = "DELETE FROM tbl_playground WHERE pg_num=?";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, deleteOK);
			pstmt.executeUpdate();	
			
		} 
		catch (Exception e) {
			System.out.println("a_facilities_adddel 삭제실패 : " + e);
			

		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
}


