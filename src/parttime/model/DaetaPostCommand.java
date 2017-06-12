package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DaetaPostCommand implements CommandInterface{
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		String m_id = (String) req.getSession().getAttribute("m_id");
		
		// daeta_post.jsp 로 페이지 이동
		return "/WEB-INF/parttime/daeta_post.jsp";
	}
}
