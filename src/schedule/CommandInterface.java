package schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 
 * 학사일정 페이지의 커맨드팩토리를 위한 인터페이스
 * 
 * @author 김민준 KIM MIN JOON
 *
 */
public interface CommandInterface {
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;
}
