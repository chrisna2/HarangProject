package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;

public class MyPageCommand implements CommandInterface{
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		String m_id = "";
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("member");
		MemberDTO admin = (MemberDTO)req.getSession().getAttribute("admin");
		if (admin != null){ m_id = admin.getM_id();}
		else{ m_id = member.getM_id();}
		
		
		// mypage.jsp 로 페이지 이동
		return "/WEB-INF/parttime/mypage.jsp";
	}
}
