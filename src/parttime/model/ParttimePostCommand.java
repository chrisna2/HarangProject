package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;

public class ParttimePostCommand implements CommandInterface{
	ParttimeBean bean = new ParttimeBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		MemberDTO member = bean.getLoginInfo(req);
		
		paging(req);
		
		String[] day = {"월","화","수","목","금","토","일"};
		req.setAttribute("day", day);
		req.setAttribute("m_id", member.getM_id());
		// parttime_post.jsp 로 페이지 이동
		return "/WEB-INF/parttime/parttime_post.jsp";
	}
	
	/**
	 * 페이징 관련 변수 request로 받아서 넘기기
	 * 
	 * @param req
	 */
	public void paging(HttpServletRequest req) {
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		int nowBlock = Integer.parseInt(req.getParameter("nowBlock"));

		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);

	}
}
