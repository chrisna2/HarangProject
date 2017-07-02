package login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 로그인 관련 서블릿
 * @author 나현기
 *
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// TODO Auto-generated method stub
		String cmd = request.getParameter("cmd");
		String url = null;
		
		CommandInterface command = null;
		
		//요거 한줄이면 아~~주 깔끔하게 떨어진다. if문도 사라짐
		command = CommandFactory.newInstance().createCommand(cmd);
		
		url = (String)command.processCommand(request, response);
		
		RequestDispatcher view = request.getRequestDispatcher(url);
		view.forward(request, response);
		
	}
}
