package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import parttime.dto.DaycodeDto;
import parttime.dto.ParttimeDto;

public class ParttimeReadCommand implements CommandInterface {
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// Session에 저장된 로그인 정보, req에서 글번호를 받아온다.
		String m_id = (String) req.getSession().getAttribute("m_id");
		String p_num = (String)req.getParameter("p_num");
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		int nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		
		ParttimeBean bean = new ParttimeBean();
		DaycodeBean dbean = new DaycodeBean();
		
		// 글 번호를 매개변수로 하여 글 정보를 받아온다.
		ParttimeDto dto = bean.getParttime(p_num);
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
				return "/WEB-INF/parttime/parttime_read.jsp";
			}
		}
	}
}
