package parttime.model;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.D_ApplyDTO;
import dto.MemberDTO;
import dto.P_ApplyDTO;

public class DaetaResumeCommand implements CommandInterface{
	ParttimeBean bean = new ParttimeBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		MemberDTO member = bean.getLoginInfo(req);
		String m_id = req.getParameter("m_id");
		String d_num = req.getParameter("d_num");

		paging(req);

		D_ApplyDTO resume = bean.getDaetaApply(m_id, d_num);
		applicantInfo(resume.getM_id(), req);

		req.setAttribute("d_num", d_num);
		req.setAttribute("resume", resume);
		req.setAttribute("tab", req.getParameter("tab"));
		
		
		if (bean.adminCheck(member.getM_id())) { // 관리자면 a_daeta_resume.jsp
			return "WEB-INF/parttime/a_daeta_resume.jsp";
		} else { // 회원이면 daeta_resume.jsp
			return "/WEB-INF/parttime/daeta_resume.jsp";
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
		req.setAttribute("applicant", applicant);
	}
}
