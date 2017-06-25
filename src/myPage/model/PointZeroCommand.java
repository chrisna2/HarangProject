package myPage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import login.LoginBean;
import login.model.LoginCommand;
import point.PointBean;
/**
 * pointZero.jsp에 사용되는 클래스
 * @author YOO
 *
 */
public class PointZeroCommand implements CommandInterface {

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
		
		LoginBean login = new LoginBean();
		PointBean point = new PointBean();
		MemberDTO member = login.getLoginInfo(request);
		String check = request.getParameter("check");

		if("pointzero".equals(check)){
			int r_point = Integer.parseInt(request.getParameter("r_point"));
			// 포인트 거래 메소드
			String result = point.tradePoint("[학비 포인트 감면] "+r_point+"원의 학비가 감면 되었습니다.", member.getM_point(), r_point, member.getM_id(), "admin01");
			if("complete".equals(result)){
				//학비 감면 메소드
				pointZero(r_point, member.getM_id());	
				//회원정보 세션 최신화
				LoginBean update = new LoginBean();
				update.refreshSession(request);
			}
			//처리 결과 값 방출
			request.setAttribute("result", result);
		}
		return "/WEB-INF/myPage/pointZero.jsp";
	}

	/**
	 * 학비 감면 메소드
	 * @param r_point 학비 감면에 사용된 포인트
	 * @param m_id 학비 감면 대상의 아이디
	 */
	public void pointZero(int r_point, String m_id){
		
		String sql = "UPDATE tbl_member SET m_fee=m_fee - ? WHERE m_id = ? ";

			pool = DBConnectionMgr.getInstance();
		
		try {
			con = pool.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_point);
			pstmt.setString(2, m_id);
			pstmt.executeUpdate();
			
		} 
		catch (Exception e) {
			System.out.println( "PointZeroCommand.java : " + e);
			e.printStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt);
		}	
		
	}
	
}







