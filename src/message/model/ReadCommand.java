package message.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import dto.MessageDTO;

public class ReadCommand implements message.model.CommandInterface{
	MessageBean mbean = new MessageBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		MemberDTO member = mbean.getLoginInfo(req); // 로그인 정보
		String m_id = member.getM_id();
		
		getMessage(req);
		inbox_paging(req);
		read(req);
		
		// message_read.jsp 로 페이지 이동
		return "/WEB-INF/message/message_read.jsp";
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
	public void inbox_paging(HttpServletRequest req) {
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
		MessageDTO msg = mbean.getMessage(t_num);
		if(msg.getT_read_date() == null){
			mbean.readMessage(t_num);
		}
	}
	
	
	
}
