package parttime.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import dto.P_ApplyDTO;

public class ParttimeResumeCommand implements CommandInterface {
	ParttimeBean bean = new ParttimeBean();

	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {
		MemberDTO member = bean.getLoginInfo(req);
		
		String m_id = req.getParameter("m_id");
		String p_num = req.getParameter("p_num");

		paging(req);

		P_ApplyDTO resume = bean.getParttimeApply(m_id, p_num);
		applicantInfo(resume.getM_id(), req);

		req.setAttribute("p_num", p_num);
		req.setAttribute("resume", resume);
		req.setAttribute("tab", req.getParameter("tab"));

		
		if (bean.adminCheck(member.getM_id())) { // 관리자면 a_parttime_resume.jsp
			return "WEB-INF/parttime/a_parttime_resume.jsp";
		} else { // 회원이면 parttime_resume.jsp
			return "/WEB-INF/parttime/parttime_resume.jsp";
		}
		
	}
	
	/**
	 * 페이징 관련 매개변수를 처리하는 메서드.
	 * @param req
	 */
	public void paging(HttpServletRequest req) {
		// 글 읽기에서 지원자 목록 페이징
		int a_nowPage = 0, a_nowBlock = 0;
		if(req.getParameter("a_nowPage") != null){a_nowPage = Integer.parseInt(req.getParameter("a_nowPage"));}
		if(req.getParameter("a_nowBlock") != null) {a_nowBlock = Integer.parseInt(req.getParameter("a_nowBlock"));}

		req.setAttribute("a_nowPage", a_nowPage);
		req.setAttribute("a_nowBlock", a_nowBlock);
		
		//알바 모집 게시판 페이징
		int nowPage = 0, nowBlock = 0;
		if (req.getParameter("nowPage") != null) {nowPage = Integer.parseInt(req.getParameter("nowPage"));}
		if (req.getParameter("nowBlock") != null) {nowBlock = Integer.parseInt(req.getParameter("nowBlock"));}

		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
	}
	
	/**
	 * 지원자의 회원번호로 지원자 정보를 조회하는 메서드.
	 * @param m_id
	 * @param req
	 * @throws ParseException
	 */
	public void applicantInfo(String m_id, HttpServletRequest req){
		MemberDTO applicant = bean.getMember(m_id);
		applicant.setM_age(getAge(applicant.getM_birth()));
		req.setAttribute("applicant", applicant);
	}
	
	/**
	 * 현재 날짜와 출생일을 비교하여 나이를 계산하는 메서드.
	 * @param birth
	 * @return 나이
	 */
	public int getAge(String birth) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREAN);
		Date birthday = null;
		try {
			birthday = sdf.parse(birth);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		GregorianCalendar today = new GregorianCalendar();
		GregorianCalendar birthDay = new GregorianCalendar();
		birthDay.setTime(birthday);

		int factor = 0;
		if (today.get(Calendar.DAY_OF_YEAR) < birthDay.get(Calendar.DAY_OF_YEAR)) {
			factor = -1;
		}
		return today.get(Calendar.YEAR) - birthDay.get(Calendar.YEAR) + factor;
	}
}
