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
		else if(cmd.equals("update")){
			
			return new MyinfoUpdateCommand();
		}
		else if(cmd.equals("specUp")){
			
			return new SpecUpCommand();
		}
		else if(cmd.equals("specUp_proc")){
			
			return new SpecUpProcCommand();
		}
		else if(cmd.equals("timeTable")){
			
			return new TimetableCommand();
		}
		else if(cmd.equals("pointList")){
			
			return new PointlistCommand();
		}
		else if(cmd.equals("pointZero")){
			
			return new PointZeroCommand();
		}
		else if(cmd.equals("AmemList")){
			
			return new AmemListCommand();
		}
		else if(cmd.equals("AspecList")){
			
			return new AspecListCommand();
		}
		else if(cmd.equals("Achallenge")){
			
			return new AchallengeCommand();
		}
		else if(cmd.equals("AspecList")){
			
			return new AspecListCommand();
		}
		else if(cmd.equals("Alesson")){
			
			return new AlessonCommand();
		}
		else if(cmd.equals("ApointCheck")){
			
			return new ApointCommand();
		}
		else{
			return null;
		}
		
	}
}
