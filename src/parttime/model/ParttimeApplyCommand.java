package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ParttimeApplyCommand implements CommandInterface {
	ParttimeBean bean = new ParttimeBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {
		
		String p_num = (String)req.getParameter("p_num");
		
		paging(req);
		req.setAttribute("p_num", p_num);
		
		// parttime_apply.jsp 로 페이지 이동
		return "/WEB-INF/parttime/parttime_apply.jsp";
	}

	public void paging(HttpServletRequest req) {
		// 페이지 정보 parameter
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		int nowBlock = Integer.parseInt(req.getParameter("nowBlock"));

		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
	}
}
