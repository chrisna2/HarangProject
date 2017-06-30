package login.model;
/**
 * 로그인 관련 커멘드 팩토리 클래스
 * @author 나현기
 *
 */
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
		else if(cmd.equals("regform")){
			
			return new RegformCommand();
		}
		else if(cmd.equals("logout")){
			
			return new LogoutCommand();
		}
		else if(cmd.equals("goback")){
			
			return new GoBackCommand();
		}
		else if(cmd.equals("refresh")){
			
			return new RefreshCommand();
		}
		else{
			
			return null;
		}
		
	}
}
