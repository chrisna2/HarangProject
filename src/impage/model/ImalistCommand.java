package impage.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImalistCommand implements CommandInterface {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "/WEB-INF/imPage/a_imlist.jsp";
	}

}
