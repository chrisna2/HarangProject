package food.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.CommandInterface;

/**
 * 메뉴 목록으로 페이지 이동하는 클래스
 * @author 나현기
 *
 */
public class MenuCommand implements CommandInterface {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		return "/WEB-INF/food/menuList.jsp";
		
	}

}
