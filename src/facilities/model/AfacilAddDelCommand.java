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
import dto.StudyroomDTO;
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

		String delete = request.getParameter("delete");
		String modified = request.getParameter("modified");
		String addfacil = request.getParameter("addfacil");
		
		loadlist(request);
		System.out.println(addfacil);
		
		// 설비 삭제.
		if ("1".equals(delete)) {
			delete(request, delete);
			loadlist(request);
		}

		// 수정.
		else if ("1".equals(modified)) {
			modified(request, modified);
			loadlist(request);
		}
		
		// 설비추가.
		else if ("1".equals(addfacil)){
			System.out.println("설비추가 접근");
			addFacil(request);
			loadlist(request);
		}

		return "/WEB-INF/facil/a_facilities_adddel.jsp";
	}

	// 기본 페이지 출력.
	public void loadlist(HttpServletRequest request) {

		// 검색을 위한 파라미터를 가져온다.
		String keyfield = request.getParameter("keyfield");
		String keyword = request.getParameter("keyword");

		// 기본 쿼리문.
		String pgsql = null;
		String srsql = null;

		ArrayList<Object> pglist = new ArrayList<Object>();
		ArrayList<Object> srlist = new ArrayList<Object>();

		// 검색을 위한 if문.
		if (null != keyfield) {
			pgsql = "SELECT * FROM tbl_playground " + "WHERE " + keyword + " LIKE '%" + keyfield + "%'";

			System.out.println(2);
			System.out.println(pgsql);
		} else {
			// 처음 접속시 불러온 운동장과 스터디룸 쿼리문
			pgsql = "SELECT * FROM tbl_playground";
			srsql = "SELECT * FROM tbl_studyroom";
		}

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(pgsql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				PlaygroundDTO pgdto = new PlaygroundDTO();

				pgdto.setPg_num(rs.getString("pg_num"));
				pgdto.setPg_type(rs.getString("pg_type"));
				pgdto.setPg_name(rs.getString("pg_name"));
				pgdto.setPg_content(rs.getString("pg_content"));
				pgdto.setPg_point(rs.getInt("pg_point"));

				pglist.add(pgdto);

			}

			pstmt = con.prepareStatement(srsql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				StudyroomDTO srdto = new StudyroomDTO();

				srdto.setSr_num(rs.getString("sr_num"));
				srdto.setSr_type(rs.getString("sr_type"));
				srdto.setSr_name(rs.getString("sr_name"));
				srdto.setSr_content(rs.getString("sr_content"));
				srdto.setSr_point(rs.getInt("sr_point"));

				srlist.add(srdto);

			}

		} catch (Exception e) {
			System.out.println("a_facilities_adddel : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		request.setAttribute("pglist", pglist);
		request.setAttribute("srlist", srlist);
		request.setAttribute("keyfield", keyfield);
		request.setAttribute("keyword", keyword);
	}

	// 시설 삭제
	public void delete(HttpServletRequest request, String delete) {
		
		// 어떤 시설을 삭제하는지 분별.
		String delcheck = request.getParameter("checkfacil");
		
		// 삭제할 시설 번호(운동장, 스터디룸 분리없이 넘어온다.)
		String num = request.getParameter("sendnumber");

		PlaygroundDTO pgdto = null;
		StudyroomDTO srdto = null;
		
		// 운동장일때 삭제.
		if ("pg".equals(delcheck)) {
			try {

				String sql = "DELETE FROM tbl_playground WHERE pg_num =?";
				pool = DBConnectionMgr.getInstance();
				con = pool.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, num);
				pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println("a_facilities_adddel : " + e);

			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}
		
		// 스터디룸일때..
		else if ("sr".equals(delcheck)) {
			try {

				String sql = "DELETE FROM tbl_studyroom WHERE sr_num =?";
				pool = DBConnectionMgr.getInstance();
				con = pool.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, num);
				pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println("a_facilities_adddel : " + e);

			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			
		}
	}

	// 시설 내용 수정
	public void modified(HttpServletRequest request, String _modified) {
		String sql = null;
		
		// 운동장, 스터디룸 확인
		String check = request.getParameter("modi_facil");
		String num = request.getParameter("modi_num");
		String type = request.getParameter("modi_type");
		String name = request.getParameter("modi_name");
		String content = request.getParameter("modi_content");
		
		if("운동장".equals(check)){
			try {

				sql = "UPDATE tbl_playground "
					+ "SET pg_type='?', pg_name='?', pg_content='?' "
					+ "WHERE pg_num=?";
				
				pool = DBConnectionMgr.getInstance();
				con = pool.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, type);
				pstmt.setString(2, name);
				pstmt.setString(3, content);
				pstmt.setString(4, num);
				pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println("a_facilities_adddel : " + e);

			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}
		
		else if("스터디룸".equals(check)){
			try {

				sql = "UPDATE tbl_studyroom "
					+ "SET sr_type='?', sr_name='?', sr_content='?' "
					+ "WHERE sr_num=?";
				
				pool = DBConnectionMgr.getInstance();
				con = pool.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, type);
				pstmt.setString(2, name);
				pstmt.setString(3, content);
				pstmt.setString(4, num);
				pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println("a_facilities_adddel : " + e);

			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			
		}
	}

	// 시설추가
	private void addFacil(HttpServletRequest request) {
		
		String sorp = request.getParameter("selectfacil");
		System.out.println(sorp);
		
		// 운동장 추가.
		if("운동장".equals(sorp)){
			String pg_type = request.getParameter("facil_type");
			String pg_name = request.getParameter("facil_name");
			String pg_content = request.getParameter("facil_content");
			
			String sql = 
			"INSERT INTO tbl_playground (pg_type, pg_name, pg_content) VALUES (?,?,?)";
			
			try {
				pool = DBConnectionMgr.getInstance();
				con = pool.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, pg_type);
				pstmt.setString(2, pg_name);
				pstmt.setString(3, pg_content);
				pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println(" : " + e);

			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}
		
		// 스터디룸 추가.
		else if("스터디룸".equals(sorp)){
			String sr_type = request.getParameter("facil_type");
			String sr_name = request.getParameter("facil_name");
			String sr_content = request.getParameter("facil_content");
			
			String sql = 
				"INSERT INTO tbl_studyroom (sr_type, sr_name, sr_content) VALUES (?,?,?)";
			try {
				pool = DBConnectionMgr.getInstance();
				con = pool.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, sr_type);
				pstmt.setString(2, sr_name);
				pstmt.setString(3, sr_content);
				pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println(" : " + e);

			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}
		
	}
}
