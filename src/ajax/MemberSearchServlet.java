package ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.MessageBean;

@WebServlet("/m_search")
public class MemberSearchServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		
		String m_name = req.getParameter("m_name");
		
		MessageBean mbean = new MessageBean();
		String[] arrID = mbean.getMember_id(m_name);
		
		for(int i=0; i<arrID.length;i++){
			out.println(arrID[i]);
		}
	}
}
