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
import harang.dbcp.DBConnectionMgr;
import login.LoginBean;
import point.PointBean;

public class FacilPGreservCommand implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs;

	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 작동할 메서드 선택을 위한 변수
		
		String check = request.getParameter("checkout");
		
		
		if( null == check){
			loadList(request);
			System.out.println("운동장예약 처음 접근함.");
		}
		
		else if( null != check){
			LoginBean login = new LoginBean();
			MemberDTO member = login.getLoginInfo(request);
			String m_id = member.getM_id();
			
			long giver_point = member.getM_point();
			System.out.println("내가 가지고 있는 포인트는?" + giver_point);
			
			// 포인트 사용 내역을 넣습니다.
			String r_content = "결제 테스트[시설-운동장]";
			
			// 차감해야될 포인트 
			int r_point = Integer.parseInt(request.getParameter("minuspoint"));
			
			PointBean point = new PointBean();
			String checkOut
			= point.tradePoint(r_content, giver_point, r_point,  member.getM_id(), "admin03");
			
						
			if("complete" == checkOut){
				reserPg(request, m_id);
				loadList(request);
				System.out.println("결제성공");
				request.setAttribute("tradecheck", checkOut);
				
				//회원정보 세션 최신화
				LoginBean update = new LoginBean();
				update.refreshSession(request);
				
				return "/WEB-INF/facil/facilities_playground.jsp";
			}
			else{
				request.setAttribute("tradecheck", checkOut);
				System.out.println("결제오류가 발송하였습니다.");
			}
		}
		return "/WEB-INF/facil/facilities_playground.jsp";
	}
	public void loadList(HttpServletRequest request) {

		ArrayList list = new ArrayList();
		String sql = "SELECT pg_type FROM  tbl_playground Group by pg_type";

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PgMemberDTO pgdto = new PgMemberDTO();
				pgdto.setPg_type(rs.getString("pg_type"));

				list.add(pgdto);
			}

		} catch (Exception e) {
			System.out.println("a_facilities_manager.jsp : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		request.setAttribute("list", list);
	}
	
	private void reserPg(HttpServletRequest request, String m_id) {
		
		/*LoginBean login = new LoginBean();
		MemberDTO member = login.getLoginInfo(request);
		String m_id = member.getM_id();*/
		// SQL완성을 위한 변수.
		String pgm_date = request.getParameter("spgm_date");
		String pg_num = request.getParameter("spg_num");
		String pgm_timecode = request.getParameter("spgm_timecode");
		
		String sql = 
		"INSERT INTO `harang`.`tbl_pg_member` (`pgm_date`, `pgm_timecode`, `m_id`, `pg_num`, `pgm_issue`) "
		+ "VALUES (?, ?, ?, ?, '학생예약')";
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pgm_date);
			pstmt.setString(2, pgm_timecode);
			pstmt.setString(3, m_id);
			pstmt.setString(4, pg_num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(" : " + e);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		//content 거래내용, giver 예약하고자하는 사람의 보유포인트, r 거래하는 포인트양, 
		// giver_id 내아이디, haver_id  admin03;
		// point 거래를 위한 메서드.
		
		
	}

}

