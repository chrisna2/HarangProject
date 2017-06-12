package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DaetaMainCommand implements CommandInterface {
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// Session에 저장된 로그인 정보를 받아온다.
		//String m_id = (String) req.getSession().getAttribute("m_id");
		
		// DB에서 대타 모집 게시판 정보를 ArrayList형태로 가지고와서 req에 담아 보낸다. 
		/*
		if (m_id.equals("a")) {
			// 관리자면 a_daeta_main.jsp로 페이지 이동
			return "WEB-INF/parttime/a_daeta_main.jsp";
		} else {
			// 회원이면 daeta_main.jsp 로 페이지 이동
			return "/WEB-INF/parttime/daeta_main.jsp";
		}
		*/
		return "/WEB-INF/parttime/daeta_main.jsp";
	}
}
