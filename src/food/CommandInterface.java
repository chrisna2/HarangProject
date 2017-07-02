package food;

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
	 * @param request 서블릿 리퀘스트
	 * @param response 서블릿 리스폰스
	 * @return Object 모든 형태의 클래스
	 * @throws ServletException 서블릿 예외 처리
	 * @throws IOException 입력 예외 처리
	 */
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException;
}
