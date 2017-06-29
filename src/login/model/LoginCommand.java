package login.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import message.model.MessageBean;
import myPage.model.PointlistCommand;

public class LoginCommand implements CommandInterface {
	
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
		
		HttpSession session = request.getSession();
		
		String url = "";
		
		pool = DBConnectionMgr.getInstance();
		
		//MemberDto dto = new MemberDto();
		String input_id = request.getParameter("m_id");
		String input_pw = request.getParameter("m_pw");
		
		String sql = "select m_pw, m_name, m_dept, m_mail, m_tel, m_addr, m_point, m_photo, m_fee, m_grade, m_birth, m_regdate "
				+ "from tbl_member where m_id = ?";
		
		MemberDTO mdto = new MemberDTO();
		PointlistCommand point = new PointlistCommand();
		MessageBean messege = new MessageBean();
		// DB 연결 접속
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_id);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String m_pw = rs.getString("m_pw");
			String m_name = rs.getString("m_name");
			String m_dept = rs.getString("m_dept");
			String m_mail = rs.getString("m_mail");
			String m_tel = rs.getString("m_tel");
			String m_addr = rs.getString("m_addr");
			long m_point = rs.getLong("m_point");
			String m_photo = rs.getString("m_photo");
			int m_fee = rs.getInt("m_fee");
			int m_grade = rs.getInt("m_grade");
			String m_birth = rs.getString("m_birth");
			String m_regdate = rs.getString("m_regdate");
			
			mdto.setM_id(input_id);
			mdto.setM_name(m_name);
			mdto.setM_dept(m_dept);
			mdto.setM_mail(m_mail);
			mdto.setM_tel(m_tel);
			mdto.setM_addr(m_addr);
			mdto.setM_point(m_point);
			mdto.setM_photo(m_photo);
			mdto.setM_fee(m_fee);
			mdto.setM_grade(m_grade);
			mdto.setM_birth(m_birth);
			mdto.setM_regdate(m_regdate);
		
			//일반 회원 일때
			if(input_pw.equals(m_pw) && !m_dept.equals("관리자") && !m_mail.isEmpty() && !m_tel.isEmpty() && !m_addr.isEmpty()){
				session.setAttribute("member", mdto);
				session.setAttribute("miniPlistUser", point.pointListHeaderUser(input_id));
				session.setAttribute("head_msg", messege.getGivenMessageListMini(input_id));
				url="/WEB-INF/login/main.jsp";
			}
			//관리자 일때.
			else if(input_pw.equals(m_pw) && m_dept.equals("관리자")){
				session.setAttribute("admin", mdto);
				session.setAttribute("miniPlistAdmin", point.pointListHeaderAdmin(input_id));
				session.setAttribute("head_msg", messege.getGivenMessageListMini(input_id));
				url="/WEB-INF/login/a_main.jsp";
			}
			//신규 회원 일때.
			else if(input_pw.equals(m_pw) && !m_dept.equals("관리자") && m_mail.isEmpty() && m_tel.isEmpty() && m_addr.isEmpty()){
				session.setAttribute("newbee", mdto);
				url="/WEB-INF/login/newbee.jsp";
			}
			//비밀번호가 틀렸을때.
			else if(!input_pw.equals(m_pw)){
				url="/WEB-INF/login/badinfo.jsp";
			}
			
		}catch(Exception err){
			System.out.println( "index.jsp : " + err);
			err.printStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}		
		
		RefreshCommand refresh = new RefreshCommand();
		refresh.timetable(request);
		refresh.recentData(request);
		refresh.point(request,input_id);
		
		return url;
		
	}

}
