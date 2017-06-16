package message.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import dto.MessageDTO;
import paging.PagingBean;
import paging.dto.PagingDto;

public class InboxCommand implements message.model.CommandInterface{
	MessageBean mbean = new MessageBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		MemberDTO member = mbean.getLoginInfo(req); // 로그인 정보
		String m_id = member.getM_id();
		
		getList(m_id, req);
		notRead(req);
		
		// message_inbox_main.jsp 로 페이지 이동
		return "/WEB-INF/message/message_inbox_main.jsp";
	}
	
	public void getList(String m_id, HttpServletRequest req){
		ArrayList givenList = mbean.getGivenMessageList(m_id);
		// 아이디로 회원 이름을 검색하여 저장한다.
		for(int i=0; i<givenList.size();i++){
			MessageDTO msg = (MessageDTO) givenList.get(i);
			msg.setList_num(givenList.size()-i);
			msg.setM_sender_name(mbean.getMember(msg.getM_sender()).getM_name());
			givenList.set(i, msg);
		}
		paging(givenList.size(), req);
		req.setAttribute("list", givenList);
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
	
	public void notRead(HttpServletRequest req){
		
	}
}
