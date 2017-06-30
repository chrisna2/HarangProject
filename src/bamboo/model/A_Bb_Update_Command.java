package bamboo.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 
 * 대나무숲 관리자가 자신이 쓴 글의 수정하기 버튼을 눌렀을 때 페이지 이동을 위한 클래스
 * 
 * @author student
 *
 */
public class A_Bb_Update_Command implements CommandInterface {
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {

		
		// 대나무숲 관리자측의 컨텐츠페이지(본문읽기 페이지) 에서 수정하기를 눌렀을 때 글의 작성자와 세션에 저장된 사용자가 같으면  
		// 대나무숲 관리자의 글 수정 페이지로 이동.
		return "/WEB-INF/bamboo/a_bb_update.jsp";
	}
}
