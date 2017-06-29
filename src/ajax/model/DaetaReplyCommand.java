package ajax.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.DaetaReplyDTO;
import harang.dbcp.DBConnectionMgr;

public class DaetaReplyCommand implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
		
	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList drlist = new ArrayList();
		String d_num = request.getParameter("d_num");
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_daeta_reply WHERE d_num=? ORDER BY dr_regdate DESC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				DaetaReplyDTO dto = new DaetaReplyDTO();
				dto.setDr_num(rs.getString("dr_num"));
				dto.setDr_comment(rs.getString("dr_comment"));
				dto.setDr_regdate(rs.getString("dr_regdate"));
				dto.setD_num(rs.getString("d_num"));
				dto.setM_id(rs.getString("m_id"));
				
				drlist.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("getDaetaReplyList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return drlist;
	}

}
