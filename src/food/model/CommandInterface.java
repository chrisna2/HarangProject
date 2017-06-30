package food.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 하랑레스토랑 관련 커멘드 인터 페이스
 * @author 나현기
 *
 */
public interface CommandInterface {
	/**
	 * 하랑 레스토랑 관련 프로세스 커멘드
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException;
}
