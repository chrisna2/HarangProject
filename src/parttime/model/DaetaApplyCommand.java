package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DaetaApplyCommand implements CommandInterface{
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		String m_id = (String) req.getSession().getAttribute("m_id");
		
		// DB에서 m_id정보를 통해 m_name, m_tel을 검색
		
		// 검색한 파라미터를 req에 담아 넘긴다.
		//req.setAttribute("m_name", m_name);
		//req.setAttribute("m_tel", m_tel);
		
		// daeta_apply.jsp 로 페이지 이동
		return "/WEB-INF/parttime/daeta_apply.jsp";
	}
}
