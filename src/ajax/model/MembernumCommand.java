package ajax.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;

public class MembernumCommand implements CommandInterface {
	
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
		
		return num(request);
	}
	
	
	public ArrayList num(HttpServletRequest request){
		pool = DBConnectionMgr.getInstance();
		String sql = null;
	
		MemberDTO dto = new MemberDTO();
			ArrayList list =new ArrayList();
			String num3 =null;
			try {
			
				
			sql="select max(m_id) as num3 from tbl_member where m_id like '%"
					+ request.getParameter("num4")
					+ "%'";
				
				
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			num3 = rs.getString("num3");
			
				
		}catch(Exception err){
			System.out.println(err);
		
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
	}	
			
			String num4=num3.substring(6,9);
			int num6 = Integer.parseInt(num4)+1000+1;
			String num7 = Integer.toString(num6);
			String num8 = num7.substring(1);
			dto.setM_maxnum(num8); 
			list.add(dto);
			return list;
	}

}
