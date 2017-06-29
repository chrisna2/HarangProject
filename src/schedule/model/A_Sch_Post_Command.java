package schedule.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import facilities.model.FacilPGreservCommand;
import facilities.model.FacilSRreservCommand;

public class A_Sch_Post_Command implements CommandInterface {
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) {

		
		FacilPGreservCommand fpgr = new FacilPGreservCommand();
		
		fpgr.loadList(req);
		
		FacilSRreservCommand fsrr = new FacilSRreservCommand();
		
		fsrr.loadList(req);
		
		
		
		
		
		
		
		
		
		
		
		return "/WEB-INF/schedule/a_sch_post.jsp";
	}
}
