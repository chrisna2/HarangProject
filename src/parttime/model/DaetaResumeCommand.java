package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DaetaResumeCommand implements CommandInterface{
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		// daeta_resume.jsp 로 페이지 이동
		return "/WEB-INF/parttime/daeta_resume.jsp";
	}
}
