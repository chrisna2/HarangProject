package myPage.model;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyinfoCommand implements CommandInterface {
	

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException{
		
		
		return "/WEB-INF/myPage/myInfo.jsp";
	}

}
