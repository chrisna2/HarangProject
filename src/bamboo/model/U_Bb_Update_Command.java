package bamboo.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class U_Bb_Update_Command implements CommandInterface {
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {

		String m_id = (String) req.getSession().getAttribute("m_id");
		
		// 대나무숲 학생측의 컨텐츠페이지(글읽기페이지) 에서 글쓰기를 눌렀을 때 글의 작성자와 세션에 저장된 사용자가 같으면  
		// 대나무숲 학생이용자의 글 수정 페이지로 이동.
		return "/WEB-INF/bamboo/u_bb_update.jsp";
	}
}
