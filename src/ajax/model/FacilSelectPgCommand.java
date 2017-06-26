package ajax.model;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.FoodDTO;
import dto.PlaygroundDTO;
import harang.dbcp.DBConnectionMgr;

public class FacilSelectPgCommand implements CommandInterface {

	// DB 커넥션 4 대장
	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;
	// DBCP 사용
	DBConnectionMgr pool;

	@Override
	public ArrayList processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList list = null;
		String check = request.getParameter("check");
		System.out.println(check);

		if (null == check) {
			list = loadList(request);
		}
		
		// JSON으로 넘어올때 String으로 넘어온다. 참고할것.
		else if ("1".equals(check)) {
			list = loadContentPoint(request);
		}

		return list;
	}

	// 처음 셀렉문의 pg_type을 가지고 와서 pg_name을 SQL문으로 검색함.
	public ArrayList loadList(HttpServletRequest request) throws UnsupportedEncodingException {
		// 운동장예약[사용자]
		// pg_type으로 검색함.디버깅을 위해서 임시로 값을 '족구장'으로 설정.
		String pg_type = URLDecoder.decode(request.getParameter("pg_type"), "UTF-8");

		String sql = "SELECT pg_name, pg_num, pg_content, pg_point FROM  tbl_playground WHERE pg_type=?";
		ArrayList pgnList = new ArrayList();

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pg_type);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				PlaygroundDTO pgdto = new PlaygroundDTO();
				pgdto.setPg_name(rs.getString("pg_name"));
				pgdto.setPg_num(rs.getString("pg_num"));
				pgdto.setPg_content(rs.getString("pg_content"));
				pgdto.setPg_point(rs.getInt("pg_point"));
				pgnList.add(pgdto);
			}
		} catch (Exception e) {
			System.out.println("FacilSelectPgCommand : " + e);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		return pgnList;
	}

	
	// 선택한 pg_type 과 pg_name로 검색후 SQL문을 작성해서 pg_content와 pg_point를 가져온다.
	public ArrayList loadContentPoint(HttpServletRequest request) throws UnsupportedEncodingException {
		String pg_type = URLDecoder.decode(request.getParameter("pg_type"), "UTF-8");
		String pg_name = URLDecoder.decode(request.getParameter("pg_name"), "UTF-8");

		String sql = "SELECT pg_name, pg_num, pg_content, pg_point FROM  tbl_playground "
				+ "WHERE pg_type=? AND pg_name=?";
		ArrayList lCPList = new ArrayList();

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pg_type);
			pstmt.setString(2, pg_name);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				PlaygroundDTO pgdto = new PlaygroundDTO();
				pgdto.setPg_name(rs.getString("pg_name"));
				pgdto.setPg_num(rs.getString("pg_num"));
				pgdto.setPg_content(rs.getString("pg_content"));
				pgdto.setPg_point(rs.getInt("pg_point"));
				lCPList.add(pgdto);
			}
		} catch (Exception e) {
			System.out.println("FacilSelectPgCommand : " + e);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		return lCPList;
	}

}
