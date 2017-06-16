package message.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import dto.MessageDTO;
import paging.PagingBean;
import paging.dto.PagingDto;

public class SentCommand implements message.model.CommandInterface{
	MessageBean mbean = new MessageBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		MemberDTO member = mbean.getLoginInfo(req); // 로그인 정보
		String m_id = member.getM_id();
		
		postMessage(m_id, req); // 메시지 보내기
		getList(m_id, req);
		
		// message_sent.jsp 로 페이지 이동
		return "/WEB-INF/message/message_sent.jsp";
	}
	
	public void getList(String m_id, HttpServletRequest req){
		ArrayList sentList = mbean.getSentMessageList(m_id); 
		// 아이디로 회원 이름을 검색하여 저장한다.
		for(int i=0; i<sentList.size();i++){
			MessageDTO msg = (MessageDTO) sentList.get(i);
			msg.setList_num(sentList.size()-i);
			msg.setM_reader_name(mbean.getMember(msg.getM_reader()).getM_name());
			sentList.set(i, msg);
		}
		paging(sentList.size(), req);
		req.setAttribute("list", sentList);
	}
	
	public void paging(int listSize, HttpServletRequest req) {
		// 페이징 관련 parameter 받아오기
		int nowPage = 0, nowBlock = 0;
		if (req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		if (req.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}

		PagingBean pbean = new PagingBean();

		// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수, 네번째는 블록당 페이지 개수!!
		PagingDto paging = pbean.Paging(listSize, 20, nowPage, 5, nowBlock);

		req.setAttribute("paging", paging);
	}
	
	/**
	 * 메시지를 보내는 메서드.
	 * @param m_id
	 * @param req
	 */
	public void postMessage(String m_id, HttpServletRequest req){
		String t_title = req.getParameter("t_title");
		String t_content = req.getParameter("t_content");
		String m_reader = req.getParameter("m_reader");
		
		if(t_title != null && t_content != null && m_reader != null){
			mbean.postMessage(t_title, t_content, m_id, m_reader);
		}
	}
}
