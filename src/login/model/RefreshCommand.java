package login.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bamboo.model.Bb_List_Command;
import dto.DaetaDTO;
import dto.MemberDTO;
import dto.ParttimeDTO;
import login.LoginBean;
import myPage.model.PointlistCommand;
import myPage.model.TimetableCommand;
import parttime.model.ParttimeBean;
/**
 * 로그인을 유지하면서 메인페이지로 이동하는 클래스.
 * @author 양혜민
 *
 */
public class RefreshCommand implements CommandInterface {
	
	LoginBean bean = new LoginBean();
	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO login = bean.getLoginInfo(request);
		String m_id = login.getM_id();
		String url = "";
		
		//timetable(request); //현재 학기 시간표정보
		recentData(request); //최신정보
		point(request,m_id);//최근 포인트 정보
		
		//일반 회원 일때
		if(bean.adminCheck(m_id)==false){
			session.setAttribute("member", login);
			url="/WEB-INF/login/main.jsp";
		}
		//관리자 일때.
		else if(bean.adminCheck(m_id)){
			session.setAttribute("admin", login);
			url="/WEB-INF/login/a_main.jsp";
		}
		return url;
	}
	
	/**
	 * 시간표 정보를 불러오는 메서드.
	 * @param req
	 */
	public void timetable(HttpServletRequest req){
		TimetableCommand ttc = new TimetableCommand();
		ttc.defaultTimeTable(req);
	}
	
	/**
	 * 최신글 정보를 불러오는 메서드.
	 * @param req
	 */
	public void recentData(HttpServletRequest req){
		ParttimeBean pbean = new ParttimeBean();
		ArrayList<ParttimeDTO> plist= pbean.getParttimeList();
		ArrayList<DaetaDTO> dlist = pbean.getDaetaList();
		Bb_List_Command blc = new Bb_List_Command();
		ArrayList blist = blc.bblist(req);
		req.setAttribute("p_list", plist);
		req.setAttribute("d_list", dlist);
		req.setAttribute("blist", blist);
	}
	
	/**
	 * 포인트 정보를 불러오는 메서드.
	 * @param req
	 */
	public void point(HttpServletRequest req, String m_id){
		PointlistCommand plc = new PointlistCommand();
		
		//일반 회원 일때
		if(bean.adminCheck(m_id)==false){
			plc.pointList(req);
		}
		//관리자 일때.
		else if(bean.adminCheck(m_id)){
			
		}
	}

}
