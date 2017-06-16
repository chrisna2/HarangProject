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

public class FacilMainCommand implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs;
	DBConnectionMgr pool;
	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1.처음 출력시 예약 리스트 출력.
		 * 2.
		 * 3.
		 * 4.
		 * 5.
		 * 
		 */
		String delete = request.getParameter("delete");
		String deleteOK = request.getParameter("deleteOK");
		
		loadlist(request);
		
		return "/WEB-INF/facil/facilities_main.jsp";
	}
	
	public void loadlist(HttpServletRequest request){
		
		// 임시 디버깅용 ID
		String id = "201301001";
		
		String sql = "SELECT m.pgm_num, m.pg_num, m.m_id, m.pgm_regdate, m.pgm_timecode, p.pg_type, p.pg_name, m.pgm_date, p.pg_point "
					+ "FROM tbl_pg_member m, tbl_playground p WHERE m.pg_num = p.pg_num "
					+ "AND m.m_id=? ORDER BY m.pgm_num DESC";
		
		ArrayList list = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				PgMemberDTO pgmdto = new PgMemberDTO();

				pgmdto.setPgm_num(rs.getString("m.pgm_num"));
				pgmdto.setPg_type(rs.getString("p.pg_type"));
				pgmdto.setPg_name(rs.getString("p.pg_name"));
				pgmdto.setPg_point(rs.getInt("p.pg_point"));
				pgmdto.setPgm_timecode(rs.getString("m.pgm_timecode"));
				pgmdto.setPgm_date(rs.getString("m.pgm_date"));

				// 시간 코드를 해석해서 지불한 포인트를 확인.
				int count = 0;
				String timecode = pgmdto.getPgm_timecode(); 
				
				for(int i = 0 ; i < timecode.length() ;i++){
					if( timecode.charAt(i) == '1'){
					count++;
					};
				}
				
				// 지불할 금액
				int payoutpoint = count*pgmdto.getPg_point();
				
				pgmdto.setPayoutpoint(payoutpoint);
				
				// 디------버깅
				System.out.println(payoutpoint);
				
				// 타임코드와 리퀘스트를 같이 보내줌.
				new FacilMainCommand().transCode(timecode,request);
				
				list.add(pgmdto);
			}

		} catch (Exception e) {
			System.out.println("facilities_main.jsp : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		request.setAttribute("list", list);
	}
	
	
	public void transCode(String code, HttpServletRequest req) {
		String timetable[] = 
			{"8","9","10","11","12","13","14","15","16","17","18","19","20"};
		
		// timecode내 첫번째 글자 식별 알파벳 제거. 이걸 왜 넣었지..젠장..
		code = code.substring(1);
		
		// String을 한글자씩 쪼개서 저장
		char[] _timecode = code.toCharArray();

		// char배열을 String배열로 변환
		String[] timecode = new String[13];
		for (int i = 0; i < _timecode.length; i++) {
			timecode[i] = Character.toString(_timecode[i]);
		}

		// parameter 넘기기
		req.setAttribute("timecode", timecode);
		req.setAttribute("timetable", timetable);
	}

}
