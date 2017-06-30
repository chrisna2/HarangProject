package schedule.model;


/**
 * 
 * 학사일정 페이지 이동을 위해 필요한 커맨드 팩토리 클래스
 * 
 * @author 김민준 KIM MIN JOON
 *
 */
public class CommandFactory 
{
	private CommandFactory(){}
	
	
	private static CommandFactory instance = new CommandFactory();
		
	
	public static CommandFactory newInstance()
	{
		return instance;
	}
	
	public CommandInterface createCommand(String cmd)
	{
		
		if(cmd.equals("A_SCH_CON_UPDATE"))
		{
			return new A_Sch_Con_Update_Command();
		}
		if(cmd.equals("A_SCH_CON_UP_COMPLETE"))
		{
			return new A_Sch_Con_Up_Complete_Command();
		}
		else if(cmd.equals("A_SCH_POST"))
		{
			return new A_Sch_Post_Command();
		}
		else if(cmd.equals("A_SCH_POST_COMPLETE"))
		{
			return new A_Sch_Post_Complete_Command();
		}
		else if(cmd.equals("A_SCH_LIST"))
		{
			return new A_Sch_List_Command();
		}
		else if(cmd.equals("U_SCH_LIST"))
		{
			return new U_Sch_List_Command();
		}
		else if(cmd.equals("U_SCH_JOIN"))
		{
			return new U_Sch_Join_Command();
		}
		else if(cmd.equals("U_SCH_JOIN_CANCLE"))
		{
			return new U_Sch_Join_Cancle_Command();
		}
		else if(cmd.equals("A_SCH_DELETE"))
		{
			return new A_Sch_Delete_Command();
		}
		
		
		else
		{
			return null;
		}
		
		
	}
}
