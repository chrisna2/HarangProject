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
import dto.PgMemberDTO;
import dto.PlaygroundDTO;
import dto.SrMemberDTO;
import dto.StudyroomDTO;
import harang.dbcp.DBConnectionMgr;

public class FacilSelectSrCommand implements CommandInterface {

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
		System.out.println("도착");

		if (null == check) {
			list = loadList(request);
		}

		// JSON으로 넘어올때 String으로 넘어온다. 참고할것.
		else if ("1".equals(check)) {
			list = loadContentPoint(request);
		}
		
		else if ("2".equals(check)) {
			list = getTimecode(request);
		}

		return list;
	}

	// 처음 셀렉문의 sr_type을 가지고 와서 sr_name을 SQL문으로 검색함.
	public ArrayList loadList(HttpServletRequest request) throws UnsupportedEncodingException {
		// 스터디룸예약[사용자]
		// sr_type으로 검색함.
		String sr_type = URLDecoder.decode(request.getParameter("sr_type"), "UTF-8");

		String sql = "SELECT sr_name, sr_num, sr_content, sr_point FROM  tbl_studyroom WHERE sr_type=?";
		ArrayList srnList = new ArrayList();

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sr_type);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				StudyroomDTO srdto = new StudyroomDTO();
				srdto.setSr_name(rs.getString("sr_name"));
				srdto.setSr_num(rs.getString("sr_num"));
				srdto.setSr_content(rs.getString("sr_content"));
				srdto.setSr_point(rs.getInt("sr_point"));
				srnList.add(srdto);
			}
		} catch (Exception e) {
			System.out.println("FacilSelectSrCommand : " + e);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		return srnList;
	}

	// 선택한 pg_type 과 pg_name로 검색후 SQL문을 작성해서 pg_content와 pg_point를 가져온다.
	public ArrayList loadContentPoint(HttpServletRequest request) throws UnsupportedEncodingException {
		String sr_type = URLDecoder.decode(request.getParameter("sr_type"), "UTF-8");
		String sr_name = URLDecoder.decode(request.getParameter("sr_name"), "UTF-8");

		ArrayList lCPList = new ArrayList();
		
		String sql = "SELECT sr_name, sr_num, sr_content, sr_point FROM  tbl_studyroom "
				+ "WHERE sr_type=? AND sr_name=?";

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sr_type);
			pstmt.setString(2, sr_name);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				StudyroomDTO srdto = new StudyroomDTO();
				srdto.setSr_name(rs.getString("sr_name"));
				srdto.setSr_num(rs.getString("sr_num"));
				srdto.setSr_content(rs.getString("sr_content"));
				srdto.setSr_point(rs.getInt("sr_point"));
				lCPList.add(srdto);
			}
		} catch (Exception e) {
			System.out.println("FacilSelectSrCommand : " + e);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		return lCPList;
	}
	
	public ArrayList getTimecode(HttpServletRequest request) throws UnsupportedEncodingException{
		
		String srm_date = URLDecoder.decode(request.getParameter("srm_date"), "UTF-8");
		String sr_num = URLDecoder.decode(request.getParameter("sr_num"), "UTF-8");
		
		String sql = "SELECT srm_timecode FROM tbl_sr_member WHERE srm_date=? AND sr_num=?"; 
		
		System.out.println("쿼리옴?");
		
		String[] a = null;
		ArrayList list = new ArrayList();
		ArrayList codetrans = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, srm_date);
			pstmt.setString(2, sr_num);
			rs = pstmt.executeQuery();
			
			 
			while (rs.next()) {
				
					list.add(rs.getString("srm_timecode"));
				}
		} catch (Exception e) {
			System.out.println("FacilSelectPgCommand : " + e);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
		String timecode = transCode(list);
		
		SrMemberDTO dto = new SrMemberDTO();
		dto.setSrm_timecode(timecode);
		codetrans.add(dto);
		
		return codetrans;
	}
	
	public String transCode(ArrayList timecode) {
		
		String result = null;
		long basic = 10000000000000L;
		
		for (int i = 0; i < timecode.size(); i++) {
			String cutA = (timecode.get(i).toString()).substring(1);
			System.out.println("나옴" + cutA);
			long b = Long.parseLong(cutA);
			basic += b;
		}

		String a = Long.toString(basic);
		result = a.substring(1);
		System.out.println(result);
		return result;
	}

}
