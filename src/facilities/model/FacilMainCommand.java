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

import dto.MemberDTO;
import dto.PgMemberDTO;
import dto.PlaygroundDTO;
import dto.SrMemberDTO;
import harang.dbcp.DBConnectionMgr;
import login.LoginBean;

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
		 * 1.처음 출력시 예약 리스트 출력. 2. 3. 4. 5.
		 */
		String deleteOk = request.getParameter("deleteOk");
		System.out.println(deleteOk);
		
		if (null == deleteOk) {
			loadlist(request);
			System.out.println("시설메인에 1번접근");
		} 
		
		else if ("1".equals(deleteOk)) {
			System.out.println("시설메인에 2번접근");
			
			deletelist(request);
			
			loadlist(request);
		}

		return "/WEB-INF/facil/facilities_main.jsp";
	}

	public void loadlist(HttpServletRequest request) {

		LoginBean login = new LoginBean();
		MemberDTO member = login.getLoginInfo(request);
		String m_id = member.getM_id();

		String pgsql = "SELECT m.pgm_num, m.pg_num, m.m_id, m.pgm_regdate, m.pgm_timecode, p.pg_type, p.pg_name, m.pgm_date, p.pg_point "
				+ "FROM tbl_pg_member m, tbl_playground p WHERE m.pg_num = p.pg_num "
				+ "AND m.m_id=? ORDER BY m.pgm_date ASC";

		String srsql = "SELECT m.srm_num, m.sr_num, m.m_id, m.srm_regdate, m.srm_timecode, s.sr_type, s.sr_name, m.srm_date, s.sr_point "
				+ "FROM tbl_sr_member m, tbl_studyroom s WHERE m.sr_num = s.sr_num "
				+ "AND m.m_id=? ORDER BY m.srm_date ASC";

		ArrayList pgmlist = new ArrayList();
		ArrayList srmlist = new ArrayList();

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(pgsql);
			pstmt.setString(1, m_id);
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

				for (int i = 0; i < timecode.length(); i++) {
					if (timecode.charAt(i) == '1') {
						count++;
					}
					;
				}

				// 지불할 금액
				int payoutpoint = count * pgmdto.getPg_point();

				pgmdto.setPayoutpoint(payoutpoint);

				// 디------버깅
				System.out.println(payoutpoint);

				// 타임코드와 리퀘스트를 같이 보내줌.
				new FacilMainCommand().transCode(timecode, request);

				pgmlist.add(pgmdto);
			}

			pstmt = con.prepareStatement(srsql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				SrMemberDTO srmdto = new SrMemberDTO();

				srmdto.setSrm_num(rs.getString("m.srm_num"));
				srmdto.setSr_type(rs.getString("s.sr_type"));
				srmdto.setSr_name(rs.getString("s.sr_name"));
				srmdto.setSr_point(rs.getInt("s.sr_point"));
				srmdto.setSrm_timecode(rs.getString("m.srm_timecode"));
				srmdto.setSrm_date(rs.getString("m.srm_date"));

				// 시간 코드를 해석해서 지불한 포인트를 확인.
				int count = 0;
				String timecode = srmdto.getSrm_timecode();

				for (int i = 0; i < timecode.length(); i++) {
					if (timecode.charAt(i) == '1') {
						count++;
					}
					;
				}

				// 지불할 금액
				int payoutpoint = count * srmdto.getSr_point();

				srmdto.setPayoutpoint(payoutpoint);

				// 타임코드와 리퀘스트를 같이 보내줌.
				new FacilMainCommand().transCode(timecode, request);

				srmlist.add(srmdto);
			}

		} catch (Exception e) {
			System.out.println("facilities_main.jsp : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		request.setAttribute("pgmlist", pgmlist);
		request.setAttribute("srmlist", srmlist);
	}

	// 예약 삭제 쿼리문.
	private void deletelist(HttpServletRequest request) {

		LoginBean login = new LoginBean();
		MemberDTO member = login.getLoginInfo(request);
		String m_id = member.getM_id();
		
		// 운동장을 예약취소인지, 스터디룸 예약취소인지 체크. mfaciltype 값을 확인한다.
		String sql = null;
		String facilCheck = request.getParameter("mfaciltype");
		
		/*resernum은 예약시설번호로 srm_num 혹은 pgm_num을 가지고 있다.
		 * if문을 통해서 분리후. 보내게된다. 
		 */
		
		String reser_num =  request.getParameter("resernum");
		
		// 운동장일때..
		if("운동장".equals(facilCheck)){
			sql = "DELETE FROM harang.tbl_pg_member WHERE pgm_num =?";
		}
		
		// 스터디룸일때..
		else if("스터디룸".equals(facilCheck)){
			sql = "DELETE FROM harang.tbl_sr_member WHERE srm_num =?";
		}
			
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reser_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("예약삭제 쿼리문 : " + e);

		} finally {
			pool.freeConnection(con, pstmt);
		}
		

	}

	public void transCode(String code, HttpServletRequest req) {
		String timetable[] = { "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20" };

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
