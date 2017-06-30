package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
/**
 * 대타 모집 - 글쓰기 페이지에서 처리하는 모든 기능을 구현한 함수.
 * @author 양혜민
 *
 */
public class DaetaPostCommand implements CommandInterface{
	ParttimeBean bean = new ParttimeBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		MemberDTO member = bean.getLoginInfo(req);
		
		paging(req);
		req.setAttribute("m_id", member.getM_id());
		
		if (bean.adminCheck(member.getM_id())) { // 관리자면 a_daeta_post.jsp
			return "WEB-INF/parttime/a_daeta_post.jsp";
		} else { // 회원이면 daeta_post.jsp
			return "/WEB-INF/parttime/daeta_post.jsp";
		}
	}
	
	/**
	 * 페이징 관련 변수 request로 받아서 넘기기
	 * 
	 * @param req
	 */
	public void paging(HttpServletRequest req) {
		int nowPage = 0, nowBlock = 0;
		if (req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		if (req.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);

	}
}
