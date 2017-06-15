package parttime.model;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import dto.ParttimeDTO;
import paging.PagingBean;
import paging.dto.PagingDto;

/**
 * 알바 모집 게시판에 필요한 정보를 DB에서 꺼내오고 게시판 페이지로 이동하는 함수
 * @author 양혜민 
 */
public class ParttimeMainCommand implements CommandInterface {
	ParttimeBean bean = new ParttimeBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
		String m_id = "";
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("member");
		MemberDTO admin = (MemberDTO)req.getSession().getAttribute("admin");
		if (admin != null){ m_id = admin.getM_id();}
		else{ m_id = member.getM_id();}
		
		delete(req); // 글이 삭제된 경우
		getList(req); // 게시판에 띄울 글 목록을 처리
		
		// 페이지 이동
		if ("admin02".equals(m_id)) { // 관리자면 a_parttime_main.jsp
			return "WEB-INF/parttime/a_parttime_main.jsp";
		} else { // 회원이면 parttime_main.jsp
			return "/WEB-INF/parttime/parttime_main.jsp";
		}
	}

	/**
	 * 페이징 관련 parameter를 받아서 처리 후 request에 보내는 함수
	 * 
	 * @param listSize
	 * @param req
	 */
	public void paging(int listSize, HttpServletRequest req) {
		// 페이징 관련 parameter 받아오기
		int nowPage = 0, nowBlock = 0;
		if (req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		if (req.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}

		PagingBean pbean = new PagingBean();

		// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수, 네번째는 블록당 페이지 개수!!
		PagingDto paging = pbean.Paging(listSize, 10, nowPage, 5, nowBlock);

		req.setAttribute("paging", paging);
	}
	
	/**
	 * DB에서 게시판에 띄울 글 정보를 받아와서 request에 보내는 함수.
	 * @param req
	 */
	public void getList(HttpServletRequest req) {
		
		// 게시판에 띄울 글 정보를 모두 불러와 ArrayList에 저장
		ArrayList<ParttimeDTO> list = bean.getParttimeList();
		
		// 추가정보 저장=> 1.글번호 2.해당 글에 지원한 지원자
		for (int i = 0; i < list.size(); i++) {
			ParttimeDTO dto = list.get(i);
			dto.setList_num(list.size() - i); // 글번호
			dto.setCnt_apply(bean.getCnt_apply(dto.getP_num())); // 지원자수
			if (dto.getM_id().equals("admin02")) {
				dto.setM_id("관리자");
			}
			list.set(i, dto);
		}

		paging(list.size(), req);

		// parameter 보내기
		req.setAttribute("list", list);
	}

	public void delete(HttpServletRequest req){
		String delete = (String)req.getParameter("delete");
		String p_num = (String)req.getParameter("p_num");
		
		if ("OK".equals(delete)){
			bean.deleteParttime(p_num);
		}
	}
}
