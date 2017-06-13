package parttime.model;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import paging.PagingBean;
import paging.dto.PagingDto;
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
		String m_id = (String)req.getSession().getAttribute("m_id");
		
		// 페이징 관련 parameter 받아오기
		int nowPage=0, nowBlock=0;
		if(req.getParameter("nowPage") != null){nowPage = Integer.parseInt(req.getParameter("nowPage"));}
		if(req.getParameter("nowBlock") != null){nowBlock = Integer.parseInt(req.getParameter("nowBlock"));}

		// DB 연동 함수를 쓰기 위해 인스턴스 생성
		ParttimeBean bean = new ParttimeBean();
		PagingBean pbean = new PagingBean();
		
		// 게시판에 띄울 글 정보를 모두 불러와 ArrayList에 저장
		ArrayList<ParttimeDto> list = bean.getParttimeList();
		
		// 추가정보 저장=> 1.글번호  2.해당 글에 지원한 지원자
		for(int i=0; i<list.size();i++){
			ParttimeDto dto = list.get(i);
			dto.setList_num(list.size()-i); //글번호 
			dto.setCnt_apply(bean.getCnt_apply(dto.getP_num())); //지원자수
			if(dto.getM_id().equals("admin02")){dto.setM_id("관리자");}
			list.set(i, dto);
		}
		
		// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수!!
		PagingDto paging = pbean.Paging(list.size(),5, nowPage, nowBlock);
		
		// parameter 보내기
		req.setAttribute("list", list);
		req.setAttribute("paging", paging);
		
		// 페이지 이동
		if ("admin02".equals(m_id)){ // 관리자면 a_parttime_main.jsp
			return "WEB-INF/parttime/a_parttime_main.jsp";
		}
		else{ // 회원이면 parttime_main.jsp
			return "/WEB-INF/parttime/parttime_main.jsp";
		}
	}
	
}
