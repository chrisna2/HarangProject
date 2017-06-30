package food.model;
/**
 * 하랑레스토랑 관련 팩토리 클래스
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
		
		if(cmd.equals("menu")){
			
			return new MenuCommand();
		}
		else if(cmd.equals("Amenu")){
			
			return new AdminMenuCommand();
		}
		else if(cmd.equals("ticket")){
			
			return new TicketCommand();
		}
		else if(cmd.equals("ticket_print")){
			
			return new PrintTicketCommand();
		}
		else if(cmd.equals("ticket_proc")){
			
			return new TicketprocCommand();
		}
		else if(cmd.equals("Aticket")){
			
			return new AdminTicketCommand();
		}
		else if(cmd.equals("ticketuse")){
			
			return new TicketUseCommand();
		}
		else{
			
			return null;
		}
		
	}
}
