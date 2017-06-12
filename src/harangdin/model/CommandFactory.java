package harangdin.model;

public class CommandFactory {
	
	private CommandFactory(){}

	private static CommandFactory instance = new CommandFactory();
	
	public static CommandFactory newInstance(){
		return instance;
	}
	
	public CommandInterface createCommand(String cmd){
		
		if(cmd.equals("main")){
			return new mainCommand();
		}
		else if(cmd.equals("adminMain")){
			return new AdminMainCommand();
		}
		else{
			return null;
		}
		
	}
}
