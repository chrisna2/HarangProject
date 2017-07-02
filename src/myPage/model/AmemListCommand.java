package myPage.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myPage.CommandInterface;
/**
 * 회원 목록 페이지로 이동하는 커멘드 클래스
 * @author 나현기
 *
 */
public class AmemListCommand implements CommandInterface {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		return "/WEB-INF/myPage/a_memList.jsp";
	}

}
