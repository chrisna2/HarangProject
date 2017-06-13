package parttime.model;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import parttime.dto.ParttimeDto;
/**
 * 
 * @author 양혜민
 * 알바 모집 게시판에 필요한 정보를 DB에서 꺼내오고 게시판 페이지로 이동하는 함수
 */
public class ParttimeMainCommand implements CommandInterface{
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException{
		req.setCharacterEncoding("utf-8");
		// Session에 저장된 로그인 정보를 받아온다.
		//String m_id = (String)req.getSession().getAttribute("m_id");
		ParttimeBean bean = new ParttimeBean();
		
		// 게시판에 띄울 글 정보를 모두 불러와 ArrayList에 저장
		ArrayList<ParttimeDto> list = bean.getParttimeList();
		
		// 해당 글에 지원한 지원자들이 몇 명인지 조회 후 list에 저장
		for(int i=0; i<list.size();i++){
			ParttimeDto dto = list.get(i);
			dto.setCnt_apply(bean.getCnt_apply(dto.getP_num()));
			if(dto.getM_id().equals("admin02")){dto.setM_id("관리자");}
			list.set(i, dto);
		}
		
		req.setAttribute("list", list);
		/*
		if (m_id.equals("a")){
			// 관리자면 a_parttime_main.jsp로 페이지 이동
			return "WEB-INF/parttime/a_parttime_main.jsp";
		}
		else{
			// 회원이면 parttime_main.jsp 로 페이지 이동
			return "/WEB-INF/parttime/parttime_main.jsp";
		}
		*/
		return "/WEB-INF/parttime/parttime_main.jsp";
	}
	
	
}
