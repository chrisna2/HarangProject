package impage.model;

public class CommandFactory {

	
	private CommandFactory(){}
	
	
	private static CommandFactory instance = new CommandFactory();
		
	
	public static CommandFactory newInstance(){
		return instance;
	}
	
	public CommandInterface createCommand(String cmd){
		
		if(cmd.equals("main")){
			
			return new ImmainCommand();
		}
		if(cmd.equals("make")){
			
			return new ImmakeCommand();
		}
		if(cmd.equals("detail")){
			
			return new ImdetailCommand();
		}
		if(cmd.equals("modify")){
			
			return new ImmodifyCommand();
		}
		if(cmd.equals("alist")){
			
			return new ImalistCommand();
		}
		if(cmd.equals("adetail")){
			
			return new ImadetailCommand();
		}
		else{
			
			return null;
		}
		
	}
}
