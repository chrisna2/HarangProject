package ajax.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ParttimeReplyDTO;
import harang.dbcp.DBConnectionMgr;

public class ParttimeReplyCommand implements CommandInterface {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList prlist = new ArrayList();
		String p_num = request.getParameter("p_num");
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_parttime_reply WHERE p_num=? ORDER BY pr_regdate DESC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ParttimeReplyDTO dto = new ParttimeReplyDTO();
				dto.setPr_num(rs.getString("pr_num"));
				dto.setPr_comment(rs.getString("pr_comment"));
				dto.setPr_regdate(rs.getString("pr_regdate"));
				dto.setP_num(rs.getString("p_num"));
				dto.setM_id(rs.getString("m_id"));
				
				prlist.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("getParttimeReplyList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return prlist;
	}

}
