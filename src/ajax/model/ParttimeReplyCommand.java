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
import parttime.model.CommentBean;
import parttime.model.ParttimeBean;

public class ParttimeReplyCommand implements CommandInterface {
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CommentBean cbean = new CommentBean();
		ParttimeBean pbean = new ParttimeBean();

		String p_num = request.getParameter("p_num");
		ArrayList prlist = cbean.getParttimeReplyList(p_num);
		for(int i=0; i<prlist.size();i++){
			ParttimeReplyDTO dto = (ParttimeReplyDTO)prlist.get(i);
			dto.setM_name((pbean.getMember(dto.getM_id()).getM_name())); //이름저장
		}
		return prlist;
	}

}
