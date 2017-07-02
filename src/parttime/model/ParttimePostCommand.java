package parttime.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import parttime.CommandInterface;
import util.ParttimeBean;
/**
 * 알바 모집 - 글쓰기 페이지에서 처리하는 모든 기능을 구현한 함수.
 * @author 양혜민
 *
 */
public class ParttimePostCommand implements CommandInterface{
	ParttimeBean bean = new ParttimeBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp){
		MemberDTO member = bean.getLoginInfo(req);
		
		paging(req);
		
		String[] day = {"월","화","수","목","금","토","일"};
		req.setAttribute("day", day);
		req.setAttribute("m_id", member.getM_id());
		
		if (bean.adminCheck(member.getM_id())) { // 관리자면 a_parttime_post.jsp
			return "WEB-INF/parttime/a_parttime_post.jsp";
		} else { // 회원이면 parttime_post.jsp
			return "/WEB-INF/parttime/parttime_post.jsp";
		}
	}
	
	/**
	 * 페이징 관련 변수 request로 받아서 넘기기
	 * 
	 * @param req 서블릿 리퀘스트
	 */
	public void paging(HttpServletRequest req) {
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		int nowBlock = Integer.parseInt(req.getParameter("nowBlock"));

		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);

	}
}
