package message.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;

public class PostCommand implements CommandInterface{
	MessageBean mbean = new MessageBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		MemberDTO member = mbean.getLoginInfo(req); // 로그인 정보
		
		req.setAttribute("member", member);
		
		// message_post.jsp 로 페이지 이동
		return "/WEB-INF/message/message_post.jsp";
	}
	
	
}
