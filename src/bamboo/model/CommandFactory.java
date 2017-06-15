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
		else if(cmd.equals("U_BB_POST_COMPLETE"))
		{
			return new U_Bb_Post_Complete_Command();
		}
		else if(cmd.equals("U_BB_REPLY"))
		{
			return new U_Bb_Reply_Command();
		}
		else if(cmd.equals("U_BR_LIST"))
		{
			return new U_Br_List_Command();
		}
		else if(cmd.equals("U_BR_DEL"))
		{
			return new U_Br_Delete_Command();
		}
		else if(cmd.equals("U_BB_CONUP"))
		{
			return new U_Bb_Con_Update_Command();
		}
		else if(cmd.equals("U_BB_CONUP_COMPLETE"))
		{
			return new U_Bb_Con_Up_Complete_Command();
		}
		else if(cmd.equals("U_BB_DEL"))
		{
			return new U_Bb_Delete_Command();
		}
		else if(cmd.equals("U_BB_LIKE"))
		{
			return new Bb_Like_Command();
		}
		else if(cmd.equals("U_BB_DLIKE"))
		{
			return new Bb_Dlike_Command();
		}
		else if(cmd.equals("U_BB_LIKE_CANCLE"))
		{
			return new Bb_Like_Cancle_Command();
		}
		else if(cmd.equals("U_BB_DLIKE_CANCLE"))
		{
			return new Bb_Dlike_Cancle_Command();
		}
		
		else
		{
			return null;
		}
		
		
	}
}
