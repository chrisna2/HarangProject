package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import parttime.dto.ParttimeDto;

public class ParttimeReadCommand implements CommandInterface {
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// Session에 저장된 로그인 정보를 받아온다.
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("member");
		String m_id = member.getM_id();
		
		String p_num = (String)req.getParameter("p_num");
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		int nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		
		// 알바 지원 관련 parameter
		String pm_reason = (String)req.getParameter("pm_reason");
		String pm_career = (String)req.getParameter("pm_career");
		String pm_wanttime = (String)req.getParameter("pm_wanttime");
		
		// 기타 parameter
		String read = (String)req.getParameter("read");
		
		// bean 객체 인스턴스 생성
		ParttimeBean bean = new ParttimeBean();
		DaycodeBean dbean = new DaycodeBean();
		
		// 지원완료 후 이 페이지로 넘어올 경우
		if(pm_reason != null && pm_career != null && pm_wanttime != null){
			bean.createResume(p_num, m_id, pm_reason, pm_career, pm_wanttime);
		}
				
		// 글 번호를 매개변수로 하여 글 정보를 받아온다.
		ParttimeDto dto = bean.getParttime(p_num);
		
		// Daycode를 분리
		//char[] day = dto.getP_daycode().toCharArray();
		//DaycodeDto day = dbean.transDaycodeToDto(dto.getP_daycode());
		
		// 글정보 parameter로 넘기기
		req.setAttribute("info", dto);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
		//req.setAttribute("day", day);
		
		// 페이지 이동
		if ("admin02".equals(m_id)) { // 관리자면 a_parttime_read.jsp로 페이지 이동
			return "WEB-INF/parttime/a_parttime_read.jsp";
		} else { // 회원이면 parttime_read.jsp 로 페이지 이동
			if(dto.getM_id().equals(m_id)){ // 내가 쓴 글
				return "/WEB-INF/parttime/parttime_read_my.jsp";
			}else{ // 다른 사람의 글
				if(read != "no"){
					bean.counterUp(p_num); // 조회수 1 증가
				}
				return "/WEB-INF/parttime/parttime_read.jsp";
			}
		}
	}
}
