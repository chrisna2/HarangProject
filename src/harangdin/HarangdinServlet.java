package harangdin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.LoginBean;

@WebServlet("/harangdin")
public class HarangdinServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String cmd = request.getParameter("cmd");
		String url = null;
		
		CommandInterface command = null;
		
		//요거 한줄이면 아~~주 깔끔하게 떨어진다. if문도 사라짐
		command = CommandFactory.newInstance().createCommand(cmd);
		
		url = (String)command.processCommand(request, response);
		
		//세션 초기화
		LoginBean login = new LoginBean();
		login.refreshSession(request);
		
		RequestDispatcher view = request.getRequestDispatcher(url);
		view.forward(request, response);
	}
	
}