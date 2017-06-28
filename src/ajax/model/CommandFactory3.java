package ajax.model;

public class CommandFactory3{

	
	private CommandFactory3(){}
	
	
	private static CommandFactory3 instance = new CommandFactory3();
		
	
	public static CommandFactory3 newInstance(){
		return instance;
	}
	
	public CommandInterface createCommand(String cmd){
		
		System.out.println(cmd);
		
		if(cmd.equals("gugun")){
			
			return new GugunCommand();
		}
		else if(cmd.equals("dong")){
			
			return new DongCommand();
		}
		else if(cmd.equals("food")){
			
			return new FoodCommand();
		}
		else if(cmd.equals("foodinfo")){
			
			return new FoodinfoCommand();
		}
		else if(cmd.equals("memberid")){
			return new MemberIdCommand();
		}
		else if(cmd.equals("sche")){
			return new ScheduleCommand();
		}
		else if(cmd.equals("schecon")){
			return new ScheduleContentCommand();
		}
		else if(cmd.equals("membernum")){
			return new MembernumCommand();
		}
		else{
			return null;
		}
		
	}
}
