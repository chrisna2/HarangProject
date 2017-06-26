package ajax.model;

public class CommandFactory{

	
	private CommandFactory(){}
	
	
	private static CommandFactory instance = new CommandFactory();
		
	
	public static CommandFactory newInstance(){
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
		
		else if(cmd.equals("selectPg")){
			return new FacilSelectPgCommand();
		}
		
		else{
			return null;
		}
		
	}
}
