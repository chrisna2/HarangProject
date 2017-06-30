package ajax.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * AJAX 커멘드 인터페이스
 * @author 나현기
 *
 */
public interface CommandInterface {
	/**
	 * ajax에서 사용할 수 있는 커멘드 인터 페이스
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException;
}
