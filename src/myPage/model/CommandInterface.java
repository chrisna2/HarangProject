package myPage.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 회원 페이지 와 회원 및 포인트 관리 페이지 등록 커멘드 인터 페이스
 * @author 나현기
 *
 */
public interface CommandInterface {
	
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException;
}
