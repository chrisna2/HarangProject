package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDTO;

public class ParttimeApplyCommand implements CommandInterface{
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		// 글 정보 parameter
		String p_num = (String)req.getParameter("p_num");
		
		// 페이지 정보 parameter
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		int nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		
		// parameter 넘겨주기
		req.setAttribute("p_num", p_num);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
		
		// parttime_apply.jsp 로 페이지 이동
		return "/WEB-INF/parttime/parttime_apply.jsp";
	}
}
