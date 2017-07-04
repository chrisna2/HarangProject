package harangdin.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.BookDTO;
import dto.MemberDTO;
import dto.PagingDto;
import harang.dbcp.DBConnectionMgr;
import harangdin.CommandInterface;
import util.LoginBean;
import util.PagingBean;

/**
 * 도서 구매자의 판매자선택여부, 포인트지급 여부 등을 알려준다
 * @author 서지윤
 *
 */

public class BookHunterCommand implements CommandInterface {
	
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
		
		LoginBean login = new LoginBean();
		MemberDTO member = login.getLoginInfo(request);
		
		String b_num = request.getParameter("b_num");
		String bh_want = request.getParameter("bh_want");
		
		String sql = "INSERT INTO tbl_b_hunter (b_num, m_id, bh_want, bh_choice, bh_iscomplete, bh_num) VALUES ( ?, ?, ?, 'N', 'N', '')";

		pool = DBConnectionMgr.getInstance();
		
		try{
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b_num);
			pstmt.setString(2, member.getM_id());
			pstmt.setString(3, bh_want);
			pstmt.executeUpdate();
		}
		catch(Exception err){
			err.printStackTrace();
		}
		
		return "/WEB-INF/harangdin/ApplyResult.jsp";
		
	}

}
