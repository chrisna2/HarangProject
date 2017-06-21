package parttime.model;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import dto.ParttimeDTO;
import paging.PagingBean;
import paging.dto.PagingDto;

/**
 * 알바 모집 게시판에 필요한 정보를 DB에서 꺼내오고 게시판 페이지로 이동하는 함수
 * 
 * @author 양혜민
 */
public class ParttimeMainCommand implements CommandInterface {
	ParttimeBean bean = new ParttimeBean();

	public String processCommand(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
		MemberDTO member = bean.getLoginInfo(req); // 로그인 정보

		insert(member.getM_id(),req); // 글이 추가된 경우
		delete(req); // 글이 삭제된 경우
		getList(req); // 게시판에 띄울 글 목록을 처리

		// 페이지 이동
		if ("admin02".equals(member.getM_id())) { // 관리자면 a_parttime_main.jsp
			return "WEB-INF/parttime/a_parttime_main.jsp";
		} else { // 회원이면 parttime_main.jsp
			return "/WEB-INF/parttime/parttime_main.jsp";
		}
	}

	/**
	 * 페이징 관련 parameter를 받아서 처리 후 request에 보내는 함수
	 * 
	 * @param listSize
	 * @param req
	 */
	public void paging(int listSize, HttpServletRequest req) {
		// 페이징 관련 parameter 받아오기
		int nowPage = 0, nowBlock = 0;
		if (req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		if (req.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}

		PagingBean pbean = new PagingBean();

		// 페이징 관련 정보 셋팅 , 두번째 parameter는 한페이지에 들어갈 글의 개수, 네번째는 블록당 페이지 개수!!
		PagingDto paging = pbean.Paging(listSize, 10, nowPage, 5, nowBlock);

		req.setAttribute("paging", paging);
	}

	/**
	 * DB에서 게시판에 띄울 글 정보를 받아와서 request에 보내는 함수.
	 * 
	 * @param req
	 */
	public void getList(HttpServletRequest req) {

		// 게시판에 띄울 글 정보를 모두 불러와 ArrayList에 저장
		ArrayList<ParttimeDTO> list = bean.getParttimeList();

		// 추가정보 저장=> 1.글번호 2.해당 글에 지원한 지원자
		for (int i = 0; i < list.size(); i++) {
			ParttimeDTO dto = list.get(i);
			dto.setList_num(list.size() - i); // 글번호
			dto.setCnt_apply(bean.getParttimeCnt_apply(dto.getP_num())); // 지원자수
			if (dto.getM_id().equals("admin02")) {
				dto.setM_name("관리자");
			} else {
				dto.setM_name(bean.getMember(dto.getM_id()).getM_name()); // 이름을
																			// 저장
			}
			list.set(i, dto);
		}

		paging(list.size(), req);

		// parameter 보내기
		req.setAttribute("list", list);
	}

	public void delete(HttpServletRequest req) {
		String delete = (String) req.getParameter("delete");
		String p_num = (String) req.getParameter("p_num");

		if ("OK".equals(delete)) {
			bean.deleteParttime(p_num);
		}
	}

	public void insert(String m_id,HttpServletRequest req) {
		String insert = req.getParameter("insert");

		if ("OK".equals(insert)) {
			ParttimeDTO dto = new ParttimeDTO();
			dto.setM_id(m_id);
			dto.setP_title(req.getParameter("p_title"));
			dto.setP_deadline(req.getParameter("p_deadline"));
			dto.setP_wage(Integer.parseInt(req.getParameter("p_wage")));
			dto.setP_term(req.getParameter("p_term"));
			dto.setP_content(req.getParameter("p_content"));
			dto.setP_tel(req.getParameter("p_tel"));
			dto.setP_location(req.getParameter("p_location"));
			dto.setP_header(req.getParameter("p_header"));
			dto.setP_daycode(transCode(req));

			bean.insertParttime(dto);
		}
	}

	public String transCode(HttpServletRequest req) {
		String daycode = "";
		String[] day = { "월", "화", "수", "목", "금", "토", "일" };
		String[] arr2 = {"0","0","0","0","0","0","0"};
		String param = req.getParameter("p_daycode"); 
		
		if(param != null){
			String arr[] = param.split(",");
			for (int i = 0; i < 7; i++) {
				for(int j=0; j<arr.length;j++){
					// 해당 요일이 있으면 1로 변경
					if(arr[j].equals(day[i])){
						arr2[i] = "1";
					}
				}
				daycode += arr2[i];
			}
		}
		return daycode;
	}

}
