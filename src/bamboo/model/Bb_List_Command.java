package bamboo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.BambooDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import paging.PagingBean;
import paging.dto.PagingDto;

public class Bb_List_Command implements CommandInterface {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public Bb_List_Command() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DBCP 연결실패 : " + err);
		}
	}

	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {

		req.setAttribute("bblist", bblist(req));
		req.setAttribute("bbnlist", bbnlist(req));

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
		PagingDto paging = pbean.Paging(bblist(req).size(), 20, nowPage, 10, nowBlock);
		// 페이징 정보 보내기
		req.setAttribute("paging", paging);

		return "/WEB-INF/bamboo/u_bb_list.jsp";
	}

	public ArrayList bblist(HttpServletRequest req) {
		HttpSession session = req.getSession();

		// MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		// String m_id = mdto.getM_id();

		// System.out.println("Bb_List_Command에서 Test : " + m_id);

		ArrayList list = new ArrayList();
		try {
			con = pool.getConnection();

			String sql;
			String sOption = req.getParameter("sOption");
			String table_search = req.getParameter("table_search");

			 System.out.println(sOption);
			 System.out.println("테이블 서치 : " + table_search);

			if (null == table_search) {

				sql = "select distinct bb.bb_num, bb.m_id, bb_notice, bb_title, bb_content, bb_regdate, bb_count, bb_nickname, ifnull(like_cnt,0), (select count(br_num) from tbl_bbreply where bb_num = bb.bb_num) as bb_replycnt from tbl_bamboo bb left outer join (select bb_num, count(tbl_like.m_id) like_cnt from tbl_like group by bb_num) li on bb.bb_num = li.bb_num where bb_notice = 'N' order by bb_regdate desc ";
				pstmt = con.prepareStatement(sql);
				// System.out.println(sql);
			}

			else {

				if (table_search.equals("bbnewlist")) {

					sql = "select distinct bb.bb_num, bb.m_id, bb_notice, bb_title, bb_content, bb_regdate, bb_count, bb_nickname, ifnull(like_cnt,0), (select count(br_num) from tbl_bbreply where bb_num = bb.bb_num) as bb_replycnt from tbl_bamboo bb left outer join (select bb_num, count(tbl_like.m_id) like_cnt from tbl_like group by bb_num) li on bb.bb_num = li.bb_num  where bb_regdate > (select date_sub(now(), interval 3 day)) and bb_notice='N' order by bb_regdate desc limit 20";
					pstmt = con.prepareStatement(sql);
				} else if (table_search.equals("bbhotlist")) {

					sql = "select distinct bb.bb_num, bb.m_id, bb_notice, bb_title, bb_content, bb_regdate, bb_count, bb_nickname, ifnull(like_cnt,0), (select count(br_num) from tbl_bbreply where bb_num = bb.bb_num) as bb_replycnt from tbl_bamboo bb left outer join (select bb_num, count(tbl_like.m_id) like_cnt from tbl_like group by bb_num) li on bb.bb_num = li.bb_num  where bb_regdate> (select date_sub(now(), interval 30 day)) and bb_notice='N' order by like_cnt desc, bb.bb_count limit 20";
					pstmt = con.prepareStatement(sql);

				} else {

					sql = "select distinct bb.bb_num, bb.m_id, bb_notice, bb_title, bb_content, bb_regdate, bb_count, bb_nickname, ifnull(like_cnt,0), (select count(br_num) from tbl_bbreply where bb_num = bb.bb_num) as bb_replycnt from tbl_bamboo bb left outer join (select bb_num, count(tbl_like.m_id) like_cnt from tbl_like group by bb_num) li on bb.bb_num = li.bb_num  where bb."+ sOption + " like '%" + table_search + "%' and bb_notice='N'";
					pstmt = con.prepareStatement(sql);
				}
				// System.out.println(sql);

			}

			rs = pstmt.executeQuery();

			while (rs.next()) {

				BambooDTO bbdto = new BambooDTO();
				bbdto.setBb_num(rs.getString("bb_num"));
				bbdto.setM_id(rs.getString("m_id"));
				bbdto.setBb_notice(rs.getString("bb_notice"));
				bbdto.setBb_title(rs.getString("bb_title"));
				bbdto.setBb_content(rs.getString("bb_content"));
				bbdto.setBb_regdate(rs.getDate("bb_regdate"));
				bbdto.setBb_count(rs.getInt("bb_count"));
				bbdto.setBb_nickname(rs.getString("bb_nickname"));
				bbdto.setLike_cnt(rs.getInt("ifnull(like_cnt,0)"));
				bbdto.setReply_cnt(rs.getInt("bb_replycnt"));

				list.add(bbdto);

			}

		} catch (Exception err) {
			System.out.println("Bb_List_Command에서 오류");
			err.printStackTrace();

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return list;
	}

	public ArrayList bbnlist(HttpServletRequest req) {
		HttpSession session = req.getSession();

		// MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		// String m_id = mdto.getM_id();

		// System.out.println("Bb_List_Command에서 Test : " + m_id);

		ArrayList nlist = new ArrayList();
		try {
			con = pool.getConnection();

			String sql = "select distinct bb.bb_num, bb.m_id, bb_notice, bb_title, bb_content, bb_regdate, bb_count, bb_nickname, ifnull(like_cnt,0), (select count(br_num) from tbl_bbreply where bb_num = bb.bb_num) as bb_replycnt from tbl_bamboo bb left outer join (select bb_num, count(tbl_like.m_id) like_cnt from tbl_like group by bb_num) li on bb.bb_num = li.bb_num where bb_notice = 'Y' order by bb_regdate desc ";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				BambooDTO bbdto = new BambooDTO();
				bbdto.setBb_num(rs.getString("bb_num"));
				bbdto.setM_id(rs.getString("m_id"));
				bbdto.setBb_notice(rs.getString("bb_notice"));
				bbdto.setBb_title(rs.getString("bb_title"));
				bbdto.setBb_content(rs.getString("bb_content"));
				bbdto.setBb_regdate(rs.getDate("bb_regdate"));
				bbdto.setBb_count(rs.getInt("bb_count"));
				bbdto.setBb_nickname(rs.getString("bb_nickname"));
				bbdto.setLike_cnt(rs.getInt("ifnull(like_cnt,0)"));
				bbdto.setReply_cnt(rs.getInt("bb_replycnt"));

				nlist.add(bbdto);

			}

		} catch (Exception err) {
			System.out.println("Bb_List_Command에서 오류");
			err.printStackTrace();

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return nlist;
	}
}
