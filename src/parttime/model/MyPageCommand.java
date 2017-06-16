package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;

public class MyPageCommand implements CommandInterface{
	ParttimeBean bean = new ParttimeBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		MemberDTO member = bean.getLoginInfo(req); // 로그인 정보
		
		// mypage.jsp 로 페이지 이동
		return "/WEB-INF/parttime/mypage.jsp";
	}
}
