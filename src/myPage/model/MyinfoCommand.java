package myPage.model;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.model.RegformCommand;

/**
 * 내 정보페이지로 접속하는 커맨드 클래스
 * @author 나현기
 *
 */
public class MyinfoCommand implements CommandInterface {
	

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException{
		
		//RegformCommand 클래스에서 시정보 불러 오기
		RegformCommand sido = new RegformCommand();
		sido.getSido(request);
		
		return "/WEB-INF/myPage/myInfo.jsp";
	}

}
