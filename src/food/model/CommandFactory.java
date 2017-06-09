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
		if(cmd.equals("ticket")){
			
			return new TicketCommand();
		}
		else{
			
			return null;
		}
		
	}
}
