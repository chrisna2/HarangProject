package ajax;

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
	 * @param request 서블릿리퀘스트
	 * @param response 서블릿리스폰스
	 * @return 모든 객체
	 * @throws ServletException 서블릿 예외처리
	 * @throws IOException 입력 예외처리
	 */
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException;
}
