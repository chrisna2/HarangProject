package bamboo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import harang.dbcp.DBConnectionMgr;
import mycompany.dto.Board;

public class Bb_List_Command implements CommandInterface 
{
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	
	
	public Bb_List_Command() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DBCP 인스턴스 참조 실패 : " + err);
		}
	}
	
	
	
	
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) 
	{
		HttpSession session = req.getSession();
		
		try {

			String sql = "select * from tbl_bamboo order by bb_num asc";

			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				Board dto = new Board();
				dto.setB_num(rs.getInt("b_num"));
				dto.setB_subject(rs.getString("b_subject"));
				dto.setB_name(rs.getString("b_name"));
				dto.setB_regdate(rs.getString("b_regdate"));
				dto.setB_count(rs.getInt("b_count"));
				dto.setB_depth(rs.getInt("b_depth"));

				list.add(dto);

			}

		} catch (Exception err) {
			System.out.println("getBoardList()에서 오류");
			err.printStackTrace();

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return list;
		
		



 

			return "/WEB-INF/bamboo/u_bb_list.jsp";

	}
}
