package message.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InboxCommand implements message.model.CommandInterface{
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		// message_inbox_main.jsp 로 페이지 이동
		return "/WEB-INF/message/message_inbox_main.jsp";
	}
}
