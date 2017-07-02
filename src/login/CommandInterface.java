package login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 로그인 페이지 커맨드 인터페이스
 * @author 나현기
 *
 */
public interface CommandInterface {
	
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException;
}
