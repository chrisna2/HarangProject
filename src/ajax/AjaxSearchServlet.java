package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Ajax 전용 : ArrayList를 JSON으로 바로 보내주는 서블릿 클래스.
 * @author 나현기
 *
 */
@WebServlet("/ajax")
public class AjaxSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String cmd = request.getParameter("cmd");
		ArrayList list = new ArrayList();
		
		CommandInterface command = null;
		
		//요거 한줄이면 아~~주 깔끔하게 떨어진다. if문도 사라짐
		command = CommandFactory.newInstance().createCommand(cmd);
		
		//dto를 포함한 목록은 여기서 불러오기
		list = (ArrayList)command.processCommand(request, response);
		
		Gson gson = new Gson();
		
		String jsonlist = gson.toJson(list);
		
		out.write(jsonlist);
		out.flush();
		out.close();
	}
}
