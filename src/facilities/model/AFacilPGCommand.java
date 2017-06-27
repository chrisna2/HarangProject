package facilities.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.activation.DataSource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import login.LoginBean;
import point.PointBean;

public class AFacilPGCommand implements CommandInterface {
	
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs;
	
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		LoginBean login = new LoginBean();
		MemberDTO member = login.getLoginInfo(request);
		
		 
		 PointBean point = new PointBean();
		 
		 String r_content = null;
		 long giver_point = 0;
		 int r_point = 0;
		 
		 tradeBookPg(request);
		 
		 // content 거래내용, giver 예약하고자하는 사람의 보유포인트, r 거래하는 포인트양, 
		 // giver_id 내아이디, haver_id  admin03;
		 point.tradePoint(r_content, giver_point, r_point,  member.getM_id(), "admin03");

		return "/WEB-INF/facil/a_facilities_pg_schedule.jsp";
	}

	public void tradeBookPg(HttpServletRequest request){
		//거래 기록.
		String sql = null;
	}
}
