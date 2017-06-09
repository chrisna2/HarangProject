package food.model;

public class CommandFactory {

	
	private CommandFactory(){}
	
	
	private static CommandFactory instance = new CommandFactory();
		
	
	public static CommandFactory newInstance(){
		return instance;
	}
	
	public CommandInterface createCommand(String cmd){
		
		if(cmd.equals("menu")){
			
			return new MenuCommand();
		}
		if(cmd.equals("Amenu")){
			
			return new AdminMenuCommand();
		}
		if(cmd.equals("ticket")){
			
			return new TicketCommand();
		}
		if(cmd.equals("Aticket")){
			
			return new AdminTicketCommand();
		}
		else{
			
			return null;
		}
		
	}
}
