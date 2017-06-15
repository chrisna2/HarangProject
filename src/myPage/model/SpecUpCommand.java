package myPage.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dto.CertiDTO;
import dto.CertiMemberDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import paging.PagingBean;
import paging.dto.PagingDto;

public class SpecUpCommand implements CommandInterface {

	// DB 커넥션 3 대장
	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;
	// DBCP 사용
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String c_num = request.getParameter("c_num");
	
		if (!(c_num == null)) {
			read(request);
			
		}
		read2(request);
		listCommand(request);

		return "/WEB-INF/myPage/specUp.jsp";
	}

	public void listCommand(HttpServletRequest request) {

		pool = DBConnectionMgr.getInstance();

		String sql;

		ArrayList list = new ArrayList();

		String keyword = request.getParameter("keyword");
		String keyfield = request.getParameter("keyfield");

		if (null == (keyfield)) {

			sql = "SELECT * FROM tbl_certificate order by c_num";

		} else {
			sql = "SELECT * FROM tbl_certificate where " + keyword + " like '%" + keyfield + "%' order by c_num";
		}

		try {

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CertiDTO dto = new CertiDTO();

				dto.setC_num(rs.getString("c_num"));
				dto.setC_name(rs.getString("c_name"));
				dto.setC_agency(rs.getString("c_agency"));
				dto.setC_point(rs.getInt("c_point"));
				
				list.add(dto);

			}
		} catch (Exception err) {
			System.out.println(err);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}

		request.setAttribute("keyword", keyword);
		request.setAttribute("keyfield", keyfield);
		request.setAttribute("aspeclist", list);

		// 페이징 관련 parameter 받아오기
		int nowPage = 0, nowBlock = 0;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		if (request.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
		}
		// DB 연동 함수를 쓰기 위해 인스턴스 생성

		PagingBean pbean = new PagingBean();
		// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수!!
		PagingDto paging = pbean.Paging(list.size(), 5, nowPage, 10, nowBlock);

		request.setAttribute("paging", paging);

	}

	public void read(HttpServletRequest request) {
		pool = DBConnectionMgr.getInstance();
		String sql;
		CertiDTO dto = new CertiDTO();

		try {
			sql = "select * from tbl_certificate where c_num=?";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("c_num"));
			rs = pstmt.executeQuery();
			rs.next();
			dto.setC_num(rs.getString("c_num"));
			dto.setC_name(rs.getString("c_name"));
			dto.setC_agency(rs.getString("c_agency"));
			dto.setC_point(rs.getInt("c_point"));

		} catch (Exception err) {
			System.out.println(err);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		request.setAttribute("read", dto);
	}

	public void read2(HttpServletRequest request) {
		pool = DBConnectionMgr.getInstance();

		String sql;

		ArrayList list = new ArrayList();
		
		String list3= null;
				HttpSession session = request.getSession();
				MemberDTO member = (MemberDTO) session.getAttribute("member");
				String m_id = member.getM_id();
		
				System.out.println(m_id);
				System.out.println(request.getParameter("c_num"));
				
		
		try {
			list3 = "suc1";
			sql = "select * from tbl_certi_member where c_num =? and m_id =?";
		
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			pstmt.setString(1, request.getParameter("c_num"));
			pstmt.setString(2, m_id);
			
			while (rs.next()) {
				CertiMemberDTO dto = new CertiMemberDTO();
				dto.setM_id(m_id);
				dto.setC_num(rs.getString("c_num"));
				dto.setCm_image(rs.getString("cm_image"));
				System.out.println(request.getParameter("cm_image"));
				
				list.add(dto);
				//System.out.println(request.getParameter("cm_image"));
			}
		
			//System.out.println(request.getParameter("c_num"));
			//System.out.println(request.getParameter("m_id"));

		} catch (Exception err) {
			System.out.println(err);
		} finally {
			// DBCP 접속해제
			pool.freeConnection(con, pstmt, rs);
		}
		
		request.setAttribute("m_id", m_id);
		request.setAttribute("success", list3);
		request.setAttribute("read2", list);
		
	}

}
