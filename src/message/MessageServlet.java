package message;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.LoginBean;
import message.model.CommandFactory;
import message.model.CommandInterface;



@WebServlet("/message")
public class MessageServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String cmd = req.getParameter("cmd");
		String url = null;
		
		
		CommandInterface command = CommandFactory.newInstance().createCommand(cmd);
		
		url = (String)command.processCommand(req, resp);
		
		//세션을 리프레쉬
				LoginBean refresh = new LoginBean();
				refresh.refreshSession(req);
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
		
	}
}