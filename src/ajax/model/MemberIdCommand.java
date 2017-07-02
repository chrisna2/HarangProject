package ajax.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import ajax.CommandInterface;
import harang.dbcp.DBConnectionMgr;
import util.MessageBean;

public class MemberIdCommand implements CommandInterface {
	// DB 커넥션 4 대장
	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;
	// DBCP 사용
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String m_name = request.getParameter("m_name");

		MessageBean mbean = new MessageBean();
		String[] idList = mbean.getMember_id(m_name);

		return idList;
	}

}
