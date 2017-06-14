package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import parttime.dto.ParttimeDto;

public class ParttimeReadCommand implements CommandInterface {
	ParttimeBean bean = new ParttimeBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {
		MemberDTO member = (MemberDTO) req.getSession().getAttribute("member");
		String m_id = member.getM_id(); // 로그인 정보
		String p_num = (String) req.getParameter("p_num"); // 글번호 parameter		
		ParttimeDto dto = bean.getParttime(p_num); // 글 번호를 매개변수로 하여 글 정보를 받아온다.

		apply(req); // 지원완료 후 
		paging(req); // paging 관련 변수 받아서 넘기기
		read(dto, req); // 글 정보 뿌리기

		/** 페이지 이동 */
		if ("admin02".equals(m_id)) { // 관리자면 a_parttime_read.jsp로 페이지 이동
			return "WEB-INF/parttime/a_parttime_read.jsp";
		} else { // 회원이면 parttime_read.jsp 로 페이지 이동
			if (m_id.equals(dto.getM_id())) { // 내가 쓴 글
				return "/WEB-INF/parttime/parttime_read_my.jsp";
			} else { // 다른 사람의 글
				String read = (String) req.getParameter("read");
				if (read != "no") {
					bean.counterUp(p_num); // 조회수 1 증가
				}
				return "/WEB-INF/parttime/parttime_read.jsp";
			}
		}
	}

	/**
	 * daycode를 받아서 배열로 분리해 parameter로 넘기는 함수
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
	 * 페이징 관련 변수 request로 받아서 넘기기
	 * 
	 * @param req
	 */
	public void paging(HttpServletRequest req) {
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		int nowBlock = Integer.parseInt(req.getParameter("nowBlock"));

		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);

	}

	public void read(ParttimeDto dto, HttpServletRequest req) {
		// Session에 저장된 로그인 정보를 받아온다.
		MemberDTO member = (MemberDTO) req.getSession().getAttribute("member");
		String m_id = member.getM_id();

		// 글번호 parameter
		String p_num = (String) req.getParameter("p_num");

		// Daycode 변환해서 parameter 넘기기
		transCode(dto.getP_daycode(), req);

		req.setAttribute("info", dto);
		req.setAttribute("p_num", p_num);
	}

	public void apply(HttpServletRequest req) {
		MemberDTO member = (MemberDTO) req.getSession().getAttribute("member");
		String m_id = member.getM_id();
		
		String p_num = (String) req.getParameter("p_num");
		
		String pm_reason = (String) req.getParameter("pm_reason");
		String pm_career = (String) req.getParameter("pm_career");
		String pm_wanttime = (String) req.getParameter("pm_wanttime");
		
		// 지원완료 후 이 페이지로 넘어올 경우
		if (pm_reason != null && pm_career != null && pm_wanttime != null) {
			bean.createResume(p_num, m_id, pm_reason, pm_career, pm_wanttime);
			System.out.println("apply");
		}
	}
}
