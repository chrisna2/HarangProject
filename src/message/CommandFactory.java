package message;

import message.model.InboxCommand;
import message.model.PostCommand;
import message.model.ReadCommand;
import message.model.SentCommand;
import message.model.ToMeCommand;

public class CommandFactory {
private CommandFactory(){}
	
	
	private static CommandFactory instance = new CommandFactory();
		
	
	public static CommandFactory newInstance(){
		return instance;
	}
	
	public CommandInterface createCommand(String cmd){
		if(cmd.equals("INBOX")){
			return new InboxCommand();
		}
		else if(cmd.equals("POST")){
			return new PostCommand();
		}
		else if(cmd.equals("SENT")){
			return new SentCommand();
		}
		else if(cmd.equals("TOME")){
			return new ToMeCommand();
		}
		else if(cmd.equals("READ")){
			return new ReadCommand();
		}
		else{
			return null;
		}
	}
}
