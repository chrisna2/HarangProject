package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ParttimeDTO;

public class ParttimeUpdateCommand implements CommandInterface{
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		ParttimeBean bean = new ParttimeBean();
		
		paging(req);
		String p_num = req.getParameter("p_num"); // 글번호 parameter
		ParttimeDTO dto = bean.getParttime(p_num); // 글 번호를 매개변수로 하여 글 정보를 받아온다.
		transCode(dto.getP_daycode(), req); // Daycode 변환해서 parameter 넘기기
		req.setAttribute("info", dto);		
		
		// parttime_update.jsp 로 페이지 이동
		return "/WEB-INF/parttime/parttime_update.jsp";
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
		if (req.getParameter("nowPage") != null) {nowPage = Integer.parseInt(req.getParameter("nowPage"));}
		if (req.getParameter("nowBlock") != null) {nowBlock = Integer.parseInt(req.getParameter("nowBlock"));}

		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);

	}
	

}
