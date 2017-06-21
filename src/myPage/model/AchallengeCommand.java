package myPage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.CertiMemberDTO;
import harang.dbcp.DBConnectionMgr;

public class AchallengeCommand implements CommandInterface {
	
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
		
		ArrayList cmlist  = new ArrayList();
		
		String sql = "SELECT m.m_id, m.m_name, m.m_dept, c.c_name, c.c_point, cm.cm_regdate, "
				+ "cm.cm_image, cm.cm_iscomplete, cm.cm_completedate "
				+ "from tbl_certificate c, tbl_certi_member cm, tbl_member m "
				+ "where c.c_num = cm.c_num and cm.m_id = m.m_id order by cm.cm_regdate desc";
		
		try {
			
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				CertiMemberDTO cmdto = new CertiMemberDTO();
				
				cmdto.setM_id(rs.getString("m_id"));
				cmdto.setM_name(rs.getString("m_name"));
				cmdto.setM_dept(rs.getString("m_dept"));
				cmdto.setC_name(rs.getString("c_name"));
				cmdto.setC_point(rs.getInt("c_point"));
				cmdto.setCm_regdate(rs.getString("cm_regdate"));
				cmdto.setCm_image(rs.getString("cm_image"));
				cmdto.setCm_iscomplete(rs.getString("cm_iscomplete"));
				cmdto.setCm_completedate(rs.getString("cm_completedate"));
				
				cmlist.add(cmdto);
				
				
			}
		} 
		catch (Exception e) {
			System.out.println( "a_challenge.jsp : " + e);
			e.getStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
		request.setAttribute("cmlist", cmlist);
		
		return "/WEB-INF/myPage/a_challenge.jsp";
	}

}
