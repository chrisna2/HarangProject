package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyPageCommand implements CommandInterface{
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		//String m_id = (String) req.getSession().getAttribute("m_id");
		// mypage.jsp 로 페이지 이동
		return "/WEB-INF/parttime/mypage.jsp";
	}
}
