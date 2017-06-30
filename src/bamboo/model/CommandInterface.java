package bamboo.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * 커맨드 팩토리를 위한 인터페이스
 * 
 * @author 김민준 KIM MIN JOON
 *
 */
public interface CommandInterface {
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;
}
