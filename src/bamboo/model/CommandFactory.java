package bamboo.model;

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
		
		if(cmd.equals("A_BB_CON"))
		{
			return new A_Bb_Content_Command();
		}
		else if(cmd.equals("A_BB_POST"))
		{
			return new A_Bb_Post_Command();
		}
		else if(cmd.equals("BB_LIST"))
		{
			return new Bb_List_Command();
		}
		else if(cmd.equals("U_BB_CON"))
		{
			return new U_Bb_Content_Command();
		}
		else if(cmd.equals("U_BB_POST"))
		{
			return new U_Bb_Post_Command();
		}
		else if(cmd.equals("U_BB_UPDATE"))
		{
			return new U_Bb_Update_Command();
		}
		else if(cmd.equals("A_BB_UPDATE"))
		{
			return new A_Bb_Update_Command();
		}
		else if(cmd.equals("A_BB_LIST"))
		{
			return new A_Bb_List_Command();
		}
		
		else
		{
			return null;
		}
		
		
	}
}
