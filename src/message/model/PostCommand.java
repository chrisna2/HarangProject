package message.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import dto.MessageDTO;

public class PostCommand implements CommandInterface{
	MessageBean mbean = new MessageBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		MemberDTO member = mbean.getLoginInfo(req); // 로그인 정보
		
		reply(req);
		notRead(member.getM_id(), req);
		req.setAttribute("member", member);
		
		// message_post.jsp 로 페이지 이동
		return "/WEB-INF/message/message_post.jsp";
	}
	
	public void notRead(String m_id, HttpServletRequest req){
		int notRead = mbean.getNotReadMessage(m_id);
		int notRead_toMe = mbean.getNotReadMessage_toMe(m_id);
		req.setAttribute("notRead", notRead);
		req.setAttribute("notRead_toMe", notRead_toMe);
	}
	
	public void reply(HttpServletRequest req){
		String t_num = req.getParameter("t_num");
		MessageDTO msg = mbean.getMessage(t_num);
		String reader = mbean.getMember(msg.getM_sender()).getM_name(); 
		req.setAttribute("reader", reader);
	}
}
