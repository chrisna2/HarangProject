package schedule.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class A_Sch_List_Command implements CommandInterface 
{
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) 
	{
		
		
			return "WEB-INF/schedule/a_sch_main.jsp";
		
	}
}
