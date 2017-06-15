package login.model;

public class CommandFactory {

	
	private CommandFactory(){}
	
	
	private static CommandFactory instance = new CommandFactory();
		
	
	public static CommandFactory newInstance(){
		return instance;
	}
	
	public CommandInterface createCommand(String cmd){
		
		if(cmd.equals("login")){
			
			return new LoginCommand();
		}
		else if(cmd.equals("join")){
			
			return new JoinCommand();
		}
		else{
			
			return null;
		}
		
	}
}
