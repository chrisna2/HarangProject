package facilities;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import facilities.model.CommandFactory;
import facilities.model.CommandInterface;



@WebServlet("/facil")
public class FacilitiesServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		doPost(req, resp);
		System.out.println("FacilitiesServlet doGet 접속 성공");
		
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String cmd = req.getParameter("cmd");
		String url = null;
		
		
		CommandInterface command = CommandFactory.newInstance().createCommand(cmd);
		url = (String)command.processCommand(req, resp);

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
		
		System.out.println("FacilitiesServlet doPost 접속 성공");
		
	}
}