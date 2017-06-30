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
import dto.ParttimeReplyDTO;
import harang.dbcp.DBConnectionMgr;
import parttime.model.CommentBean;
import parttime.model.ParttimeBean;

public class DaetaReplyCommand implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
		
	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CommentBean cbean = new CommentBean();
		ParttimeBean pbean = new ParttimeBean();

		String d_num = request.getParameter("d_num");
		ArrayList drlist = cbean.getDaetaReplyList(d_num);
		for(int i=0; i<drlist.size();i++){
			DaetaReplyDTO dto = (DaetaReplyDTO)drlist.get(i);
			dto.setM_name((pbean.getMember(dto.getM_id()).getM_name())); //이름저장
		}
		return drlist;
	}

}
