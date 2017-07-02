package bamboo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bamboo.CommandInterface;
import dto.BambooDTO;
import dto.DlikeDTO;
import dto.LikeDTO;
import dto.MemberDTO;
import dto.PagingDto;
import harang.dbcp.DBConnectionMgr;
import util.PagingBean;

/**
 * 
 * 사용자가 대나무숲 게시판에서 제목을 클릭해서 본문을 확인하려 할 때 대나무숲 게시판의 글의 내용을 불러오는 클래스
 * 
 * @author 김민준 KIM MIN JOON
 *
 */
public class U_Bb_Content_Command implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private DBConnectionMgr pool;
	private ResultSet rs;

	public U_Bb_Content_Command() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DBCP 연결실패 : " + err);
		}
	}

	/**
	 * 
	 * 대나무숲 게시판의 글의 내용을 불러오는 메소드
	 * 
	 */
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {

		// HttpSession session = req.getSession();
		// MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		// String m_id = mdto.getM_id();

		BambooDTO bbdto = null;

		String bb_num = req.getParameter("bb_num");
		// System.out.println("U_Bb_Content 에서 테스트 bb_num : " + bb_num);

		String sql = null;

		Bb_List_Command bb = new Bb_List_Command();
		
		// 페이징 관련 블록
		// 페이징 관련 parameter 받아오기
		int nowPage = 0, nowBlock = 0;
		if (req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		if (req.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}
		PagingBean pbean = new PagingBean();
		// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수!!
		PagingDto paging = pbean.Paging(bb.bblist(req).size(), 20, nowPage, 10, nowBlock);
		// 페이징 정보 보내기
		req.setAttribute("paging", paging);

		try {

			con = pool.getConnection();

			updateCnt(req, con, bb_num);
			req.setAttribute("bblist", bb.bblist(req));
			req.setAttribute("bbnlist", bb.bbnlist(req));

			sql = "select * from tbl_bamboo where bb_num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bb_num);
			rs = pstmt.executeQuery();

			// 본문 불러오기
			if (rs.next()) {
				bbdto = new BambooDTO();
				bbdto.setBb_num(rs.getString("bb_num"));
				bbdto.setM_id(rs.getString("m_id"));
				bbdto.setBb_notice(rs.getString("bb_notice"));
				bbdto.setBb_title(rs.getString("bb_title"));
				bbdto.setBb_content(rs.getString("bb_content"));
				bbdto.setBb_regdate(rs.getDate("bb_regdate"));
				bbdto.setBb_count(rs.getInt("bb_count"));
				bbdto.setBb_nickname(rs.getString("bb_nickname"));

				// System.out.println(rs.getString("b_content"));

			}

			

		} catch (Exception err) {
			System.out.println("U_Bb_Content 에서 에러 ");
			err.printStackTrace();

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		req.setAttribute("bbcon", bbdto);

		

		U_Br_List_Command br = new U_Br_List_Command();
		req.setAttribute("brlist", br.brlist(req));

		req.setAttribute("bblcnt", Bb_Like_Cnt(req));
		req.setAttribute("bbdlcnt", Bb_Dlike_Cnt(req));

		return "/WEB-INF/bamboo/u_bb_content.jsp";
	}

	
	/**
	 * 
	 * 대나무숲 글의 추천 목록을 ArrayList에 담고, 자신이 추천한지를 체크 해 주는 메소드
	 * @param req
	 * @return ArrayList
	 */
	public ArrayList Bb_Like_Cnt(HttpServletRequest req) {

		HttpSession session = req.getSession();

		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		String m_id = mdto.getM_id();

		// System.out.println("Bb_List_Command에서 Test : " + m_id);

		ArrayList list = new ArrayList();
		try {
			con = pool.getConnection();

			String sql;
			String bb_num = req.getParameter("bb_num");

			sql = "SELECT * FROM harang.tbl_like where bb_num ='" + bb_num + "'";
			pstmt = con.prepareStatement(sql);
			// System.out.println("U_Br_List_Command에서 테스트. sql : " + sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				LikeDTO bldto = new LikeDTO();
				bldto.setM_id(rs.getString("m_id"));
				bldto.setBb_num(rs.getString("bb_num"));

				list.add(bldto);

				if (m_id.equals(rs.getString("m_id"))) {

					req.setAttribute("islike", "y");
				}

			}

		} catch (

		Exception err) {
			System.out.println("Bb_Like_Cnt에서 오류");
			err.printStackTrace();

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return list;

	}

	
	/**
	 * 
	 * 대나무숲 글의 비추천 목록을 ArrayList에 담고, 자신이 비추천한지를 체크 해 주는 메소드
	 * @param req
	 * @return ArrayList
	 */
	public ArrayList Bb_Dlike_Cnt(HttpServletRequest req) {

		HttpSession session = req.getSession();

		MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		String m_id = mdto.getM_id();

		// System.out.println("Bb_List_Command에서 Test : " + m_id);

		ArrayList list = new ArrayList();
		try {
			con = pool.getConnection();

			String sql;
			String bb_num = req.getParameter("bb_num");

			sql = "SELECT * FROM harang.tbl_dlike where bb_num ='" + bb_num + "'";
			pstmt = con.prepareStatement(sql);
			// System.out.println("U_Br_List_Command에서 테스트. sql : " + sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				DlikeDTO bdldto = new DlikeDTO();
				bdldto.setM_id(rs.getString("m_id"));
				bdldto.setBb_num(rs.getString("bb_num"));

				list.add(bdldto);

				if (m_id.equals(rs.getString("m_id"))) {

					req.setAttribute("isdlike", "y");
				}

			}

		} catch (

		Exception err) {
			System.out.println("Bb_Dlike_Cnt에서 오류");
			err.printStackTrace();

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return list;

	}

	
	/**
	 * 
	 * 사용자가 대나무숲 게시판의 글을 확인 할 때 조회수를 늘려주는 메소드. 
	 * 이번 접속에서 처음 글을 읽는 경우에는 session 에 값을 넣어주고, 
	 * 이번 접속에서 두번 이상 글을 읽는 경우에는 session에 입력된 값을 통해서 글의 조회수를 늘려주지 않는다. 
	 * @param req
	 * @param con
	 * @param bb_number
	 */
	private void updateCnt(HttpServletRequest req, Connection con, String bb_number) {

		HttpSession session = req.getSession();

		String bb_num = bb_number;

		// System.out.println("updateCnt에서 실험 bb_num :" + bb_num);

		try {

			if (session.getAttribute(bb_num) != "read") {

				String sql = "update tbl_bamboo set bb_count = bb_count+1 where bb_num =? ";

				// System.out.println(sql);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bb_num);

				pstmt.executeUpdate();
				session.setAttribute(bb_num, "read");
			}

		} catch (Exception err) {
			System.out.println("updateCnt에서 에러 :  ");
			err.printStackTrace();
		}

	}

}
