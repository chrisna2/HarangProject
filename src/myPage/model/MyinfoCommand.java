package myPage.model;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.model.RegformCommand;

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
