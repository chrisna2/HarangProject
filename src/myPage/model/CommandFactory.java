package myPage.model;

public class CommandFactory{

	
	private CommandFactory(){}
	
	
	private static CommandFactory instance = new CommandFactory();
		
	
	public static CommandFactory newInstance(){
		return instance;
	}
	
	public CommandInterface createCommand(String cmd){
		
		System.out.println(cmd);
		
		if(cmd.equals("myinfo")){
			
			return new MyinfoCommand();
		}
		if(cmd.equals("specUp")){
			
			return new SpecUpCommand();
		}
		if(cmd.equals("timeTable")){
			
			return new TimetableCommand();
		}
		if(cmd.equals("pointList")){
			
			return new PointlistCommand();
		}
		if(cmd.equals("pointZero")){
			
			return new PointZeroCommand();
		}
		if(cmd.equals("AmemList")){
			
			return new AmemListCommand();
		}
		if(cmd.equals("AspecList")){
			
			return new AspecListCommand();
		}
		if(cmd.equals("Achallenge")){
			
			return new AchallengeCommand();
		}
		if(cmd.equals("AspecList")){
			
			return new AspecListCommand();
		}
		if(cmd.equals("Alesson")){
			
			return new AlessonCommand();
		}
		if(cmd.equals("ApointCheck")){
			
			return new ApointCommand();
		}
		else{
			return null;
		}
		
	}
}
