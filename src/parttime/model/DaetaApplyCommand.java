package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import parttime.CommandInterface;
import util.ParttimeBean;

public class DaetaApplyCommand implements CommandInterface{
	ParttimeBean bean = new ParttimeBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		MemberDTO member = bean.getLoginInfo(req);
		
		paging(req);
		req.setAttribute("d_num", req.getParameter("d_num"));
		req.setAttribute("tab", req.getParameter("tab"));
		req.setAttribute("member", member);
		
		// daeta_apply.jsp 로 페이지 이동
		return "/WEB-INF/parttime/daeta_apply.jsp";
	}
	
	public void paging(HttpServletRequest req) {
		// 페이지 정보 parameter
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		int nowBlock = Integer.parseInt(req.getParameter("nowBlock"));

		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
	}
}
