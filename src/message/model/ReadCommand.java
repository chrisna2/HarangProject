package message.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import dto.MessageDTO;
import util.MessageBean;

public class ReadCommand implements message.CommandInterface{
	MessageBean mbean = new MessageBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		MemberDTO member = mbean.getLoginInfo(req); // 로그인 정보
		String m_id = member.getM_id();
		
		getMessage(req);
		paging(req);
		read(req);
		notRead(m_id, req);
		
		// message_read.jsp 로 페이지 이동
		if(mbean.adminCheck(m_id)){return "WEB-INF/message/a_message_read.jsp";}
		else{ return "/WEB-INF/message/message_read.jsp";}
	}
	
	/**
	 * 글 번호로 메시지 정보를 검색하는 메서드.
	 * @param req
	 */
	public void getMessage(HttpServletRequest req){
		String t_num = req.getParameter("t_num");
		MessageDTO msg = mbean.getMessage(t_num);
		msg.setM_sender_name(mbean.getMember(msg.getM_sender()).getM_name());
		msg.setM_reader_name(mbean.getMember(msg.getM_reader()).getM_name());
		
		req.setAttribute("msg", msg);
		req.setAttribute("tab", req.getParameter("tab"));
	}
	
	/**
	 * 페이징 관련 매개변수를 처리하는 메서드.
	 * 
	 * @param req
	 */
	public void paging(HttpServletRequest req) {
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		int nowBlock = Integer.parseInt(req.getParameter("nowBlock"));

		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
	}
	
	/**
	 * 메시지를 읽은 시간을 저장하는 메서드.
	 * @param req
	 */
	public void read(HttpServletRequest req){
		String t_num = req.getParameter("t_num");
		String tab = req.getParameter("tab");
		MessageDTO msg = mbean.getMessage(t_num);
		if(msg.getT_read_date() == null){
			// 보낸 메시지는 읽음 처리 하지 않는다.
			if("INBOX".equals(tab) || "TOME".equals(tab)){
				mbean.readMessage(t_num);
			}
		}
	}
	
	public void notRead(String m_id, HttpServletRequest req){
		int notRead = mbean.getNotReadMessage(m_id);
		int notRead_toMe = mbean.getNotReadMessage_toMe(m_id);
		req.setAttribute("notRead", notRead);
		req.setAttribute("notRead_toMe", notRead_toMe);
	}
	
}
