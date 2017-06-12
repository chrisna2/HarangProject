package bamboo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bamboo.model.CommandFactory;
import bamboo.model.CommandInterface;



@WebServlet("/bamboo")
public class BambooServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cmd = req.getParameter("cmd");
		String url = null;
		
		CommandInterface command = CommandFactory.newInstance().createCommand(cmd);
		url = (String)command.processCommand(req, resp);

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
		
	}
}