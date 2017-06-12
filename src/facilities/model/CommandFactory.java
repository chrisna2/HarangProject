package facilities.model;

import facilities.model.CommandFactory;
import facilities.model.CommandInterface;

public class CommandFactory {
private CommandFactory(){}
	
	
	private static CommandFactory instance = new CommandFactory();
		
	
	public static CommandFactory newInstance(){
		return instance;
	}
	
	public CommandInterface createCommand(String cmd){
		
		if(cmd.equals("MYPAGE")){
			return new MyPageCommand();
		}
		else if(cmd.equals("PMAIN")){
			return new ParttimeMainCommand();
		}

		else{
			return null;
		}
		
		
	}
}
