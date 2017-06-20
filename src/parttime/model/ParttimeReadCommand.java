package parttime.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import dto.P_ApplyDTO;
import dto.ParttimeDTO;
import message.model.MessageBean;
import paging.PagingBean;
import paging.dto.PagingDto;
/**
 * 알바 모집 - 글읽기 페이지에서 처리하는 모든 기능을 구현한 함수.
 * @author 양혜민
 *
 */
public class ParttimeReadCommand implements CommandInterface {
	ParttimeBean bean = new ParttimeBean();
	MessageBean mbean = new MessageBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {
		MemberDTO member = bean.getLoginInfo(req); // 로그인 정보
		String m_id = member.getM_id();
		
		/** Read!!!!!! 글 정보 */
		String p_num = (String) req.getParameter("p_num"); // 글번호 parameter		
		ParttimeDTO dto = bean.getParttime(p_num); // 글 번호를 매개변수로 하여 글 정보를 받아온다.
		transCode(dto.getP_daycode(), req); // Daycode 변환해서 parameter 넘기기
		req.setAttribute("info", dto);
		req.setAttribute("p_num", p_num);
		/** 끝 : Read */
		
		apply(req); // 지원완료 후 
		paging(req); // paging 관련 변수 받아서 넘기기
		choice(m_id, req); // 채용버튼 눌렀을 때 처리
		isApply(m_id, req); // 지원했는지 안했는지
		cancelApply(member, req); //지원을 취소하는 경우
		
		/** 페이지 이동 */
		if ("admin02".equals(m_id)) { // 관리자면 a_parttime_read.jsp로 페이지 이동
			showApply(req);
			return "WEB-INF/parttime/a_parttime_read.jsp";
		} else { // 회원이면 parttime_read.jsp 로 페이지 이동
			if (m_id.equals(dto.getM_id())) { // 내가 쓴 글
				return "/WEB-INF/parttime/parttime_read_my.jsp";
			} else { // 다른 사람의 글
				String read = (String) req.getParameter("read");
				if (read != "no") {
					bean.counterUp("d",p_num); // 조회수 1 증가
				}
				return "/WEB-INF/parttime/parttime_read.jsp";
			}
		}
	}

	/**
	 * daycode를 받아서 배열로 분리해 parameter로 넘기는 메서드.
	 * 
	 * @param code
	 * @param req
	 */
	public void transCode(String code, HttpServletRequest req) {
		char[] day = { '월', '화', '수', '목', '금', '토', '일' };

		// String을 한글자씩 쪼개서 저장
		char[] _daycode = code.toCharArray();

		// char배열을 String배열로 변환
		String[] daycode = new String[7];
		for (int i = 0; i < _daycode.length; i++) {
			daycode[i] = Character.toString(_daycode[i]);
		}

		// parameter 넘기기
		req.setAttribute("daycode", daycode);
		req.setAttribute("day", day);
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
	 * @param req
	 */
	public void apply(HttpServletRequest req) {
		String m_id = "";
		MemberDTO member = (MemberDTO) req.getSession().getAttribute("member");
		if (member != null){ m_id = member.getM_id();}
		
		String p_num = (String) req.getParameter("p_num");
		ParttimeDTO dto = bean.getParttime(p_num); // 해당 글 정보
		MemberDTO writer = bean.getMember(dto.getM_id()); // 글쓴이의 회원정보
		
		String pm_reason = (String) req.getParameter("pm_reason");
		String pm_career = (String) req.getParameter("pm_career");
		String pm_wanttime = (String) req.getParameter("pm_wanttime");
		
		// 지원완료 후 이 페이지로 넘어올 경우
		if (m_id != null && pm_reason != null && pm_career != null && pm_wanttime != null) {
			bean.createResume(p_num, m_id, pm_reason, pm_career, pm_wanttime);
			
			// 지원 확인 메시지 보내기 : 관리자 -> 글쓴이
			String title = "\"" + dto.getP_title() + "\"글에 " + member.getM_name() 
						+ "님이 지원하였습니다." ;
			String content = "\"" + dto.getP_title() + "\"글에 " + member.getM_name() 
					+ "님이 지원하였습니다. 해당 글에서 이력서를 확인해주세요." ;
			mbean.postMessage(title, content, "admin02", m_id);
		
		}
	}

	/**
	 * 지원자 목록을 검색해서 request에 보내는 메서드.
	 * @param req
	 */
	public void showApply(HttpServletRequest req){
		String p_num = (String) req.getParameter("p_num"); // 글번호 parameter	
		ArrayList list = bean.getParttimeApplyList(p_num); // 지원자 목록 데이터
		
		for(int i=0; i<list.size();i++){
			P_ApplyDTO dto = (P_ApplyDTO) list.get(i);
			dto.setList_num(i+1); // 글번호 설정
			dto.setM_name(bean.getMember(dto.getM_id()).getM_name());// 지원자의 회원번호로 검색하여 지원자 이름을 받아온다.
			list.set(i, dto);
		} 
		a_paging(list.size(), req); // 지원자 목록 페이징
		req.setAttribute("resume", list); 
	}
	
	 /** 
	 * 지원자 페이징 관련 parameter를 처리하는 메서드.
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
	 * @param login
	 * @param req
	 */
	public void choice(String login, HttpServletRequest req){
		
		if("Y".equals(req.getParameter("choice"))){
			String m_id = req.getParameter("choice_id"); // 지원자
			String p_num = req.getParameter("p_num");
			
			bean.updateChoice(m_id, p_num); // 채용 정보를 DB에 저장
			ParttimeDTO dto = bean.getParttime(p_num); // 해당 글 정보
			MemberDTO member = bean.getMember(dto.getM_id()); // 글쓴이의 회원정보
			MemberDTO applicant = bean.getMember(m_id);
			
			// 채용 확인 메시지 보내기 : 채용한 사람 -> 지원자
			String title = "축하드립니다. 알바 모집에 채용되셨습니다.";
			String content = "축하드립니다. 알바 모집 게시판의 \"" + dto.getP_title() + "\"에 채용되셨습니다."
						+ "\n채용담당자와 직접 연락하세요. 연락처는 " +dto.getP_tel()+ " 입니다." ;
			mbean.postMessage(title, content, login, m_id);
			
			// 채용 확인 메시지 보내기 : 관리자 -> 채용한 사람
			String title2 = "축하드립니다. 알바 채용에 성공하였습니다.";
			String content2 = member.getM_name() + "님이 알바 모집 게시판에 작성한 \"" 
							+ dto.getP_title()+ "\" 글에 알바를 채용하셨습니다. \n채용하신 " 
							+ applicant.getM_name()+"님과 직접 연락하세요. 연락처는 "
							+ applicant.getM_tel()+ " 입니다." ;
			mbean.postMessage(title2, content2, "admin02" , login);
		}
		
	}
	
	/**
	 * 해당 게시글에 이미 지원을 했는지 안했는지 확인하는 메서드.
	 * @param m_id
	 * @param req
	 */
	public void isApply(String m_id, HttpServletRequest req){
		String p_num = req.getParameter("p_num");
		
		P_ApplyDTO applydto = new P_ApplyDTO(); 
		applydto = bean.getApply(m_id, p_num);

		if(applydto.getM_id() != null){
			req.setAttribute("applied", "Y");
		}else{
			req.setAttribute("applied", "N");
		}
	}
	
	/**
	 * 지원을 취소하는 경우 실행되는 메서드.
	 * @param member
	 * @param req
	 */
	public void cancelApply(MemberDTO member ,HttpServletRequest req){
		if("OK".equals(req.getParameter("cancel"))){
			String p_num = req.getParameter("p_num");
			
			bean.deleteApply(member.getM_id(), p_num); // 지원 정보를 DB에서 삭제
			ParttimeDTO dto = bean.getParttime(p_num); // 해당 글 정보
			MemberDTO writer = bean.getMember(dto.getM_id()); // 글쓴이의 회원정보
			
			// 지원 취소 메시지 보내기 : 관리자 -> 글 게시자
			String title = member.getM_name()+"님이 지원을 취소하였습니다.";
			String content = member.getM_name()+"님이 \"" + dto.getP_title() + "\"글에 대한 지원을 취소하였습니다."
					+ "\n해당 글을 확인해주세요." ;
			mbean.postMessage(title, content,"admin02", member.getM_id());
			
		}
	}
}
