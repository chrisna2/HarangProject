package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ParttimePostCommand implements CommandInterface{
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		
		paging(req);
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
