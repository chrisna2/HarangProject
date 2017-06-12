package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ParttimeMainCommand implements CommandInterface{
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		// Session에 저장된 로그인 정보를 받아온다.
		//String m_id = (String)req.getSession().getAttribute("m_id");
		
		/*
		if (m_id.equals("a")){
			// 관리자면 a_parttime_main.jsp로 페이지 이동
			return "WEB-INF/parttime/a_parttime_main.jsp";
		}
		else{
			// 회원이면 parttime_main.jsp 로 페이지 이동
			return "/WEB-INF/parttime/parttime_main.jsp";
		}
		*/
		return "/WEB-INF/parttime/parttime_main.jsp";
	}
}
