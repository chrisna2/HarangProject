package message.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostCommand implements CommandInterface{
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		// message_post.jsp 로 페이지 이동
		return "/WEB-INF/message/message_post.jsp";
	}
}
