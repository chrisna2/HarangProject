package parttime.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.D_ApplyDTO;
import dto.DaetaDTO;
import dto.MemberDTO;
import dto.P_ApplyDTO;
import dto.ParttimeDTO;
import paging.PagingBean;
import paging.dto.PagingDto;

public class MyPageCommand implements CommandInterface {
	ParttimeBean bean = new ParttimeBean();
	/**
	 * mypage.jsp로 페이지 이동하기 전에 해야할 작업을 처리하는 메서드.
	 */
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {
		MemberDTO member = bean.getLoginInfo(req); // 로그인 정보
		String m_id = member.getM_id();

		getParttimeList(m_id, req);
		getDaetaList(m_id, req);
		getParttimeApplyList(m_id, req);
		getDaetaApplyList(m_id, req);
		
		// mypage.jsp 로 페이지 이동
		return "/WEB-INF/parttime/mypage.jsp";
	}
	
	/**
	 * 내가 쓴 알바 모집 글 목록을 검색하는 메서드.
	 * @param m_id
	 * @param req
	 */
	public void getParttimeList(String m_id, HttpServletRequest req) {
		ArrayList plist = bean.getMyParttimeList(m_id);
		// 추가정보 저장=> 1.글번호 2.해당 글에 지원한 지원자
		for (int i = 0; i < plist.size(); i++) {
			ParttimeDTO dto = (ParttimeDTO) plist.get(i);
			dto.setList_num(plist.size() - i); // 글번호
			dto.setCnt_apply(bean.getParttimeCnt_apply(dto.getP_num())); // 지원자수
			if (dto.getM_id().equals("admin02")) {
				dto.setM_name("관리자");
			}else{
				dto.setM_name(bean.getMember(dto.getM_id()).getM_name()); //이름을 저장
			}
			plist.set(i, dto);
		}
		paging(1,plist.size(), req);//페이징
		req.setAttribute("plist", plist);
	}
	
	/**
	 * 내가 쓴 대타 모집 글 목록을 검색하는 메서드.
	 * @param m_id
	 * @param req
	 */
	public void getDaetaList(String m_id, HttpServletRequest req) {
		ArrayList dlist = bean.getMyDaetaList(m_id);
		// 추가정보 저장=> 1.글번호 2.해당 글에 지원한 지원자
		for (int i = 0; i < dlist.size(); i++) {
			DaetaDTO dto = (DaetaDTO) dlist.get(i);
			dto.setList_num(dlist.size() - i); // 글번호
			dto.setCnt_apply(bean.getDaetaCnt_apply(dto.getD_num())); // 지원자수
			// 아이디로 이름을 검색하여 저장.
			if (dto.getM_id().equals("admin02")) {
				dto.setM_name("관리자");
			}else{
				dto.setM_name(bean.getMember(dto.getM_id()).getM_name()); 
			}
			dlist.set(i, dto);
		}
		paging(2,dlist.size(), req);//페이징
		req.setAttribute("dlist", dlist);
	}

	/**
	 * 내가 지원한 글 목록을 검색해서 request에 보내는 메서드.
	 * @param req
	 */
	public void getParttimeApplyList(String m_id, HttpServletRequest req){
		ArrayList applyList = bean.getMyParttimeApplyList(m_id); //내가 지원한 이력서 목록
		ArrayList p_alist = new ArrayList(); 
		for(int i=0; i<applyList.size();i++){
			P_ApplyDTO apply = (P_ApplyDTO) applyList.get(i); 
			ParttimeDTO dto = bean.getParttime(apply.getP_num()); //내가 지원한 글의 정보
			dto.setList_num(i+1); // 글번호 설정
			dto.setCnt_apply(bean.getParttimeCnt_apply(dto.getP_num())); // 지원자수
			dto.setM_name(bean.getMember(dto.getM_id()).getM_name());// 작성자의 회원번호로 검색하여 지원자 이름을 받아온다.
			p_alist.add(dto);
		} 
		paging(3,p_alist.size(), req); // 지원자 목록 페이징
		req.setAttribute("p_resume", p_alist); 
	}
	
	public void getDaetaApplyList(String m_id, HttpServletRequest req){
		ArrayList applyList = bean.getMyDaetaApplyList(m_id); // 내가 지원한 이력서 목록
		ArrayList d_alist = new ArrayList();
		for(int i=0; i<applyList.size();i++){
			D_ApplyDTO apply = (D_ApplyDTO) applyList.get(i); 
			DaetaDTO dto = bean.getDaeta(apply.getD_num()); // 내가 지원한 글의 정보
			dto.setList_num(i+1); // 글번호 설정
			dto.setCnt_apply(bean.getDaetaCnt_apply(dto.getD_num())); // 지원자수
			dto.setM_name(bean.getMember(dto.getM_id()).getM_name());// 작성자의 회원번호로 검색하여 지원자 이름을 받아온다.
			d_alist.add(dto);
		} 
		paging(4 ,d_alist.size(), req); // 지원자 목록 페이징
		req.setAttribute("d_resume", d_alist); 
	}
	
	/**
	 * 페이징 관련 parameter를 받아서 처리 후 request에 보내는 함수
	 * 
	 * @param i 몇번째 페이징
	 * @param listSize
	 * @param req
	 */
	public void paging(int i, int listSize, HttpServletRequest req) {
		PagingBean pbean = new PagingBean();
		
		switch(i){
		case 1:
			int nowPage1 = 0, nowBlock1 = 0;
			if (req.getParameter("nowPage") != null) {nowPage1 = Integer.parseInt(req.getParameter("nowPage"));}
			if (req.getParameter("nowBlock") != null) {nowBlock1 = Integer.parseInt(req.getParameter("nowBlock"));}
			PagingDto paging1 = pbean.Paging(listSize, 5, nowPage1, 3, nowBlock1);
			req.setAttribute("paging1", paging1);
		case 2:
			int nowPage2 = 0, nowBlock2 = 0;
			if (req.getParameter("nowPage") != null) {nowPage2 = Integer.parseInt(req.getParameter("nowPage"));}
			if (req.getParameter("nowBlock") != null) {nowBlock2 = Integer.parseInt(req.getParameter("nowBlock"));}
			PagingDto paging2 = pbean.Paging(listSize, 5, nowPage2, 3, nowBlock2);
			req.setAttribute("paging2", paging2);
		case 3:
			int nowPage3 = 0, nowBlock3 = 0;
			if (req.getParameter("nowPage") != null) {nowPage3 = Integer.parseInt(req.getParameter("nowPage"));}
			if (req.getParameter("nowBlock") != null) {nowBlock3 = Integer.parseInt(req.getParameter("nowBlock"));}
			PagingDto paging3 = pbean.Paging(listSize, 5, nowPage3, 3, nowBlock3);
			req.setAttribute("paging3", paging3);
		
		case 4:
			int nowPage4 = 0, nowBlock4 = 0;
			if (req.getParameter("nowPage") != null) {nowPage4 = Integer.parseInt(req.getParameter("nowPage"));}
			if (req.getParameter("nowBlock") != null) {nowBlock4 = Integer.parseInt(req.getParameter("nowBlock"));}	
			PagingDto paging4 = pbean.Paging(listSize, 5, nowPage4, 3, nowBlock4);
			req.setAttribute("paging4", paging4);
		}
	}
}
