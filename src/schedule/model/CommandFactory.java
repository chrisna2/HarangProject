package schedule.model;

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
		
		if(cmd.equals("A_SCH_UPDATE"))
		{
			return new A_Sch_Update_Command();
		}
		else if(cmd.equals("A_SCH_POST"))
		{
			return new A_Sch_Post_Command();
		}
		else if(cmd.equals("A_SCH_LIST"))
		{
			return new A_Sch_List_Command();
		}
		else if(cmd.equals("U_SCH_LIST"))
		{
			return new U_Sch_List_Command();
		}
		
		
		else
		{
			return null;
		}
		
		
	}
}
