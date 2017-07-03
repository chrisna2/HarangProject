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
 * 관리자가 대나무숲 글 리스트에서 제목을 클릭해서 해당 글의 내용을 볼 수 있게 해 주는 클래스
 * 
 * @author 김민준 KIM MIN JOON
 *
 */
public class A_Bb_Content_Command implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private DBConnectionMgr pool;
	private ResultSet rs;

	public A_Bb_Content_Command() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DBCP 연결실패 : " + err);
		}
	}

	/**
	 * 글의 내용을 불러 와서 HttpServletRequest에 담는 메소드
	 */
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {

		// HttpSession session = req.getSession();
		// MemberDTO mdto = (MemberDTO) session.getAttribute("member");
		// String m_id = mdto.getM_id();

		BambooDTO bbdto = null;

		String bb_num = req.getParameter("bb_num");
		// System.out.println("U_Bb_Content 에서 테스트 bb_num : " + bb_num);

		String sql = null;

		A_Bb_List_Command abb = new A_Bb_List_Command();
		
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
		PagingDto paging = pbean.Paging(abb.bblist(req).size(), 20, nowPage, 10, nowBlock);
		// 페이징 정보 보내기
		req.setAttribute("paging", paging);

		try {

			con = pool.getConnection();

			updateCnt(req, bb_num);
			req.setAttribute("bblist", abb.bblist(req));
			req.setAttribute("bbnlist", abb.bbnlist(req));

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
			System.out.println("A_Bb_Content 에서 에러 ");
			err.printStackTrace();

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		req.setAttribute("bbcon", bbdto);

		

		A_Br_List_Command abr = new A_Br_List_Command();
		req.setAttribute("brlist", abr.brlist(req));

		req.setAttribute("bblcnt", Bb_Like_Cnt(req));
		req.setAttribute("bbdlcnt", Bb_Dlike_Cnt(req));

		return "/WEB-INF/bamboo/a_bb_content.jsp";
	}

	/**
	 * 대나무숲의 글의 내용을 불러 올 때 해당 글에 달린 '추천'의 목록을 ArrayList에 담아주고, 
	 * 접속한 사람이 좋아요 버튼을 눌렀는지를 체크 해 주는 메소드
	 * 
	 * @param req 서블릿 리퀘스트
	 * @return ArrayList 추천 수
	 */
	public ArrayList Bb_Like_Cnt(HttpServletRequest req) {

		HttpSession session = req.getSession();

		MemberDTO mdto = (MemberDTO) session.getAttribute("admin");
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
	 * 대나무숲의 글의 내용을 불러 올 때 해당 글에 달린 '비추천'의 목록을 ArrayList에 담아주고, 
	 * 접속한 사람이 좋아요 버튼을 눌렀는지를 체크 해 주는 메소드
	 * 
	 * @param req 서블릿 리퀘스트
	 * @return ArrayList 비추수
	 */
	public ArrayList Bb_Dlike_Cnt(HttpServletRequest req) {

		HttpSession session = req.getSession();

		MemberDTO mdto = (MemberDTO) session.getAttribute("admin");
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
	 * 대나무숲 게시판의 글을 조회 할 때 해당 글의 조회수를 늘려주는 메소드. 
	 * 만약 로그인 후 처음 글을 읽는 사람이라면 session에 글을 읽었다는 것을 저장 해 준다. 
	 * 
	 * @param req 서블릿 리퀘스트
	 * @param con 커낵션 연결
	 * @param bb_number 대나무 숲 번호
	 */
	private void updateCnt(HttpServletRequest req, String bb_number) {

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
