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
		else if(cmd.equals("regist")){
			return new RegistCommand();
		}
		else if(cmd.equals("mypage")){
			return new MyPageCommand();
		}
		else{
			return null;
		}
		
	}
}
