package parttime.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.D_ApplyDTO;
import dto.DaetaDTO;
import dto.MemberDTO;
import paging.PagingBean;
import paging.dto.PagingDto;
import point.PointBean;
import util.DateBean;

/**
 * 대타 모집 게시판에 필요한 정보를 DB에서 꺼내오고 게시판 페이지로 이동하는 함수
 * @author 양혜민
 *
 */
public class DaetaMainCommand implements CommandInterface {
	ParttimeBean bean = new ParttimeBean();
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {
		MemberDTO member = bean.getLoginInfo(req); // 로그인 정보
		
		insert(member.getM_id(),req); // 글이 추가된 경우
		delete(req); //글이 삭제된 경우
		getList(member.getM_id(), req); //글목록
		
		if (bean.adminCheck(member.getM_id())) { // 관리자면 a_parttime_main.jsp
			return "WEB-INF/parttime/a_daeta_main.jsp";
		} else { // 회원이면 parttime_main.jsp
			return "/WEB-INF/parttime/daeta_main.jsp";
		}
	}
	
	/**
	 * DB에서 게시판에 띄울 글 정보를 받아와서 request에 보내는 함수.
	 * @param m_id
	 * @param req
	 */
	public void getList(String m_id, HttpServletRequest req) {
		
		// 게시판에 띄울 글 정보를 모두 불러와 ArrayList에 저장
		ArrayList list = bean.getDaetaList();
		
		// 마감일이 지나면 [마감]으로 말머리 변경
		for(int i=0; i<list.size(); i++){
			afterDeadline(((DaetaDTO)list.get(i)).getD_num()); 
		}
		
		// 추가정보 저장=> 1.글번호 2.해당 글에 지원한 지원자
		for (int i = 0; i < list.size(); i++) {
			DaetaDTO dto = (DaetaDTO) list.get(i);
			dto.setList_num(list.size() - i); // 글번호
			dto.setCnt_apply(bean.getDaetaCnt_apply(dto.getD_num())); // 지원자수
			dto.setD_pick(bean.getPicked(dto.getD_num())); // 채용된 사람 회원번호
			
			/** 채용된 사람이 신고 버튼을 누른 상태이면*/
			D_ApplyDTO apply = bean.getDaetaApply(dto.getD_pick(), dto.getD_num());
			if(apply.getDm_report() == "Y"){
				req.setAttribute("dm_report", "OK");
			}
			
			// 거래 상태를 파라미터로 보낸다.
			req.setAttribute("state", state(dto.getD_pick(), dto.getD_num()));
			
			
			if (dto.getM_id().equals("admin02")) {
				dto.setM_name("관리자");
			}else{
				dto.setM_name(bean.getMember(dto.getM_id()).getM_name()); //이름을 저장
			}
			list.set(i, dto);
		}

		paging(list.size(), req);

		// parameter 보내기
		req.setAttribute("list", list);
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
	 * 대타 모집 게시판에서 글을 삭제하는 메서드.
	 * @param req
	 */
	public void delete(HttpServletRequest req){
		String delete = (String)req.getParameter("delete");
		String d_num = (String)req.getParameter("d_num");
		
		if ("OK".equals(delete)){
			bean.deleteDaeta(d_num);
		}
	}
	
	/**
	 * 대타 모집 게시판에서 글을 추가하는 메서드.
	 * @param m_id
	 * @param req
	 */
	public void insert(String m_id, HttpServletRequest req) {
		String insert = req.getParameter("insert");

		if ("OK".equals(insert)) {
			DaetaDTO dto = new DaetaDTO();
			dto.setM_id(m_id);
			dto.setD_title(req.getParameter("d_title"));
			dto.setD_deadline(req.getParameter("d_deadline"));
			dto.setD_wage(Integer.parseInt(req.getParameter("d_wage")));
			dto.setD_date(req.getParameter("d_date"));
			dto.setD_content(req.getParameter("d_content"));
			dto.setD_tel(req.getParameter("d_tel"));
			dto.setD_location(req.getParameter("d_location"));
			dto.setD_header(req.getParameter("d_header"));
			dto.setD_deposit(Integer.parseInt(req.getParameter("d_deposit")));

			bean.insertDaeta(dto);
			
			/** 글을 게시하면 포인트가 관리자에게로 넘어간다!!!!!!!!!!!!!!!!!!!!!*/
			PointBean pbean = new PointBean();
			pbean.tradePoint("대타 모집 글 게시", bean.getMember(m_id).getM_point(), 
										       dto.getD_deposit(), m_id, "admin02");
		}
	}

	/**
	 * 마감일이 지나면 자동으로 말머리가 [마감]으로 변경되는 메서드.
	 * @param d_num
	 */
	public void afterDeadline(String d_num){
		DaetaDTO dto = bean.getDaeta(d_num);
		if(new DateBean().checkDeadline(dto.getD_deadline()) && !dto.getD_header().equals("[마감]")){
			dto.setD_header("[마감]");
			bean.updateDaeta(dto);
		}
	}
	
	/**
	 * 대타 모집 게시글에 채용된 사람의 거래 상태를 확인하는 메서드.
	 * @param m_id 채용된 사람 회원번호
	 * @param d_num 글번호
	 * @return 포인트거래 진행상태
	 */
	public String state(String m_id, String d_num){
		D_ApplyDTO apply = bean.getDaetaApply(m_id, d_num); // 채용된 사람의 이력서정보
		DaetaDTO dto = bean.getDaeta(d_num); // 글정보
		DateBean date = new DateBean();
		
		/** 글이 등록됨과 동시에 준비상태가 된다.*/
		String state = "prepare";
		
		/*
		if(date.checkDeadline(dto.getD_deadline()) 
				&& (date.checkDeadline(dto.getD_date()) == false) && (apply.getDm_iscomplete() == null)){
			/** 마감일이 지나고 대타날짜가 지나지 않았을 때는 진행중인 상태
			state = "progress";
		}
		*/
		
		if(date.checkDeadline(dto.getD_date()) && (apply.getDm_iscomplete() == null)
														&& (date.checkDate(dto.getD_date(), 3)==false)){
			/** 대타 날짜가 지나고 (대타 날짜 후 3일 미만) 버튼이 아직 눌리지 않았을 때는 대기상태*/
			state="waiting";
		}
		
		if(date.checkDate(dto.getD_date(), 3)){
			/** 대타 날짜가 3일이상 지났지만 버튼이 눌리지 않았을때는 경고상태*/
			state="warning";
		}
		
		if("Y".equals(apply.getDm_iscomplete())){
			/** 글 작성자가 확인버튼을 눌러 거래가 완료된 상태*/
			state="success";
		}
		
		if("N".equals(apply.getDm_iscomplete())){
			/** 포인트 거래가 거절된 상태 */
			state="denied";
		}
		
		return state;
	}
}
