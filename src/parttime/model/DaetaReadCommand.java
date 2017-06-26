package parttime.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.D_ApplyDTO;
import dto.DaetaDTO;
import dto.MemberDTO;
import message.model.MessageBean;
import paging.PagingBean;
import paging.dto.PagingDto;

public class DaetaReadCommand implements CommandInterface {
	ParttimeBean bean = new ParttimeBean();
	MessageBean mbean = new MessageBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {
		MemberDTO member = bean.getLoginInfo(req);
		String m_id = member.getM_id();
		
		cancelApply(member, req); // 지원을 취소하는 경우
		
		/** Read!!!!!! 글 정보 */
		String d_num = req.getParameter("d_num"); // 글번호 parameter
		DaetaDTO dto = bean.getDaeta(d_num); // 글 번호를 매개변수로 하여 글 정보를 받아온다.
		req.setAttribute("info", dto);
		req.setAttribute("d_num", d_num);
		req.setAttribute("m_id", m_id);
		req.setAttribute("tab", req.getParameter("tab"));
		/** 끝 : Read */
		
		/** Apply!! 지원자 정보*/
		apply(req); // 지원완료 후
		isComplete(m_id, req); // 대타 수행 확인
		paging(req); // paging 관련 변수 받아서 넘기기
		choice(m_id, req); // 채용버튼 눌렀을 때 처리
		isApply(m_id, req); // 지원했는지 안했는지
		showApply(req); // 지원자목록
		/** 끝 : Apply */
		
		/** 페이지 이동 */
		if (bean.adminCheck(member.getM_id())) { // 관리자면 a_parttime_read.jsp로 페이지 이동
			return "WEB-INF/parttime/a_daeta_read.jsp";
		} else { // 회원이면 parttime_read.jsp 로 페이지 이동
			String read = (String) req.getParameter("read");
			if (read != "no" || m_id != dto.getM_id()) { 
				bean.counterUp("d", d_num); // 조회수 1 증가
			}
			return "/WEB-INF/parttime/daeta_read.jsp";
		}
		
	}
	
	/**
	 * 알바 모집 게시판 페이징 관련 매개변수를 처리하는 메서드.
	 * 
	 * @param req
	 */
	public void paging(HttpServletRequest req) {
		int nowPage = 0, nowBlock = 0;
		if (req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		if (req.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}

		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);

	}

	/**
	 * 지원 완료 후 이 페이지로 넘어올 경우 DB에 이력서를 저장하는 메서드.
	 * 
	 * @param req
	 */
	public void apply(HttpServletRequest req) {
		String m_id = "";
		MemberDTO member = bean.getLoginInfo(req);
		if (member != null) {
			m_id = member.getM_id();
		}

		String d_num = (String) req.getParameter("d_num");
		DaetaDTO dto = bean.getDaeta(d_num); // 해당 글 정보
		MemberDTO writer = bean.getMember(dto.getM_id()); // 글쓴이의 회원정보

		String dm_reason = (String) req.getParameter("dm_reason");
		
		// 지원완료 후 이 페이지로 넘어올 경우
		if (m_id != null && dm_reason != null ) {
			System.out.println("지원완료");
			bean.createDaetaResume(d_num, m_id, dm_reason);

			// 지원 확인 메시지 보내기 : 관리자 -> 글쓴이
			String title = "\"" + dto.getD_title() + "\"글에 " + member.getM_name() + "님이 지원하였습니다.";
			String content = "\"" + dto.getD_title() + "\"글에 " + member.getM_name() + "님이 지원하였습니다. 해당 글에서 이력서를 확인해주세요.";
			mbean.postMessage(title, content, "admin02", m_id);

		}
	}

	/**
	 * 지원자 목록을 검색해서 request에 보내는 메서드.
	 * 
	 * @param req
	 */
	public void showApply(HttpServletRequest req) {
		String d_num = (String) req.getParameter("d_num"); // 글번호 parameter
		ArrayList list = bean.getDaetaApplyList(d_num); // 지원자 목록 데이터

		for (int i = 0; i < list.size(); i++) {
			D_ApplyDTO dto = (D_ApplyDTO) list.get(i);
			dto.setList_num(i + 1); // 글번호 설정
			dto.setM_name(bean.getMember(dto.getM_id()).getM_name());// 지원자의 회원번호로 검색하여 지원자이름을 받아온다.
			list.set(i, dto);
		}
		a_paging(list.size(), req); // 지원자 목록 페이징
		req.setAttribute("resume", list);
	}

	/**
	 * 지원자 페이징 관련 parameter를 처리하는 메서드.
	 * 
	 * @param listSize
	 * @param req
	 */
	public void a_paging(int listSize, HttpServletRequest req) {
		// 페이징 관련 parameter 받아오기
		int nowPage = 0, nowBlock = 0;
		if (req.getParameter("a_nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("a_nowPage"));
		}
		if (req.getParameter("a_nowBlock") != null) {
			nowBlock = Integer.parseInt(req.getParameter("a_nowBlock"));
		}

		PagingBean pbean = new PagingBean();

		// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수, 네번째는 블록당 페이지 개수!!
		PagingDto paging = pbean.Paging(listSize, 5, nowPage, 3, nowBlock);

		req.setAttribute("a_paging", paging);
	}

	/**
	 * 채용 버튼을 눌렀을 때, 채용여부에 관한 정보를 업데이트하고 채용확인 메시지를 보내는 메서드.
	 * 
	 * @param login
	 * @param req
	 */
	public void choice(String login, HttpServletRequest req) {

		if ("Y".equals(req.getParameter("choice"))) {
			String m_id = req.getParameter("choice_id"); // 지원자
			String d_num = req.getParameter("d_num");

			bean.updateDaetaChoice(m_id, d_num); // 채용 정보를 DB에 저장
			DaetaDTO dto = bean.getDaeta(d_num); // 해당 글 정보
			MemberDTO member = bean.getMember(dto.getM_id()); // 글쓴이의 회원정보
			MemberDTO applicant = bean.getMember(m_id);

			// 채용 확인 메시지 보내기 : 채용한 사람 -> 지원자
			String title = "축하드립니다. 대타 모집에 채용되셨습니다.";
			String content = "축하드립니다. 대타 모집 게시판의 \"" + dto.getD_title() + "\"에 채용되셨습니다." + "\n작성자와 직접 연락하세요. 연락처는 "
					+ dto.getD_tel() + " 입니다.";
			mbean.postMessage(title, content, login, m_id);

			// 채용 확인 메시지 보내기 : 관리자 -> 채용한 사람
			String title2 = "축하드립니다. 대타 채용에 성공하였습니다.";
			String content2 = member.getM_name() + "님이 대타 모집 게시판에 작성한 \"" + dto.getD_title()
					+ "\" 글에 대타를 채용하셨습니다. \n채용하신 " + applicant.getM_name() + "님과 직접 연락하세요. 연락처는 " + applicant.getM_tel()
					+ " 입니다.";
			mbean.postMessage(title2, content2, "admin02", login);
		}
	}
	
	/**
	 * 해당 게시글에 이미 지원을 했는지 안했는지 확인하는 메서드.
	 * 
	 * @param m_id
	 * @param req
	 */
	public void isApply(String m_id, HttpServletRequest req) {
		String d_num = req.getParameter("d_num");

		D_ApplyDTO applydto = new D_ApplyDTO();
		applydto = bean.getDaetaApply(m_id, d_num);

		if (applydto.getM_id() != null) {
			req.setAttribute("applied", "Y");
		} else {
			req.setAttribute("applied", "N");
		}
	}

	/**
	 * 지원을 취소하는 경우 실행되는 메서드.
	 * 
	 * @param member
	 * @param req
	 */
	public void cancelApply(MemberDTO member, HttpServletRequest req) {
		if ("OK".equals(req.getParameter("cancel"))) {
			String d_num = req.getParameter("d_num");

			bean.deleteDaetaApply(member.getM_id(), d_num); // 지원 정보를 DB에서 삭제
			DaetaDTO dto = bean.getDaeta(d_num); // 해당 글 정보
			MemberDTO writer = bean.getMember(dto.getM_id()); // 글쓴이의 회원정보

			// 지원 취소 메시지 보내기 : 관리자 -> 글 게시자
			String title = member.getM_name() + "님이 지원을 취소하였습니다.";
			String content = member.getM_name() + "님이 \"" + dto.getD_title() + "\"글에 대한 지원을 취소하였습니다."
					+ "\n해당 글을 확인해주세요.";
			mbean.postMessage(title, content, "admin02", member.getM_id());

		}
	}
	
	/**
	 * 마감일이 지났는지 여부를 확인하는 메서드.
	 * @param d_num
	 * @return true 지남|| false 안 지남
	 */
	public boolean checkDeadline(String d_num){
		DaetaDTO dto = bean.getDaeta(d_num);
		String d_deadline = dto.getD_deadline();
		
		// d_deadline을 Date로 형변환
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		Date deadline = null;
		
		try{
			deadline = date.parse(d_deadline);
		}catch(Exception e){}
		
		// 오늘날짜와 비교해서 지났으면 true 안지났으면 false를 반환
		return deadline.before(new Date());
	}
	
	/**
	 * 대타를 확인 후 포인트를 지급하는 메서드.
	 * @param req
	 */
	public void isComplete(String m_id, HttpServletRequest req){
		String d_num = req.getParameter("d_num");
		String isComplete = req.getParameter("isComplete");
		if(isComplete != null){
			D_ApplyDTO dto = bean.getDaetaApply(m_id, d_num);
			dto.setDm_iscomplete("Y");
			bean.updateDaetaMember(dto);
			
			/** 포인트 지급!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
		}
	}

}
