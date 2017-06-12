package schedule.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class A_Sch_Post_Command implements CommandInterface {
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {

		String m_id = (String) req.getSession().getAttribute("m_id");
		// 학사일정 관리자측 메인페이지에서 글쓰기를 눌렀을 때  
		// 학사일정 관리자의 글 작성 페이지로 이동.
		
		return "/WEB-INF/schedule/a_sch_post.jsp";
	}
}
