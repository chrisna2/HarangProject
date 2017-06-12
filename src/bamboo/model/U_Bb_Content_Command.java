package bamboo.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class U_Bb_Content_Command implements CommandInterface {
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {
		
		String m_id = (String) req.getSession().getAttribute("m_id");
		
		// 대나무숲 학생측  리스트 페이지에서 제목을 클릭하여 대나무숲의 본문 페이지(컨텐츠페이지) 로 이동
		return "/WEB-INF/bamboo/u_bb_content.jsp";
	}
}
