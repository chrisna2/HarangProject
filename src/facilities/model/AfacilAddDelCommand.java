package facilities.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AfacilAddDelCommand implements CommandInterface {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("AfacilAddDelCommand 접속");
		return "/WEB-INF/facil/a_facilities_adddel.jsp";
	}

}
