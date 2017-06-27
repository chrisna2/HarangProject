package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.DaetaDTO;

public class DaetaUpdateCommand implements CommandInterface{
	ParttimeBean bean = new ParttimeBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		paging(req);
		String d_num = req.getParameter("d_num"); // 글번호 parameter
		DaetaDTO dto = bean.getDaeta(d_num); // 글 번호를 매개변수로 하여 글 정보를 받아온다.
		req.setAttribute("info", dto);	
		req.setAttribute("tab", req.getParameter("tab"));
		
		// daeta_update.jsp 로 페이지 이동
		return "/WEB-INF/parttime/daeta_update.jsp";
	}
	
	/**
	 * 대타 모집 게시판 페이징 관련 매개변수를 처리하는 메서드.
	 * 
	 * @param req
	 */
	public void paging(HttpServletRequest req) {
		int nowPage = 0, nowBlock = 0;
		if (req.getParameter("nowPage") != null) {nowPage = Integer.parseInt(req.getParameter("nowPage"));}
		if (req.getParameter("nowBlock") != null) {nowBlock = Integer.parseInt(req.getParameter("nowBlock"));}

		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);

	}
}
