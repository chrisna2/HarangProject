package ajax;

import ajax.model.A_ScheduleCommand;
import ajax.model.A_ScheduleContentCommand;
import ajax.model.DaetaReplyCommand;
import ajax.model.DongCommand;
import ajax.model.FacilSelectPgCommand;
import ajax.model.FacilSelectSrCommand;
import ajax.model.FindttCommand;
import ajax.model.FoodCommand;
import ajax.model.FoodinfoCommand;
import ajax.model.GugunCommand;
import ajax.model.MemberIdCommand;
import ajax.model.MembernumCommand;
import ajax.model.ParttimeReplyCommand;
import ajax.model.ScheduleCommand;
import ajax.model.ScheduleContentCommand;

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
		else if(cmd.equals("asche")){
			return new A_ScheduleCommand();
		}
		else if(cmd.equals("aschecon")){
			return new A_ScheduleContentCommand();
		}
		else if(cmd.equals("selectPg")){
			return new FacilSelectPgCommand();
		}
		else if(cmd.equals("findtt")){
			return new FindttCommand();
		}
		else if(cmd.equals("selectSr")){
			return new FacilSelectSrCommand();
		}
		else if(cmd.equals("membernum")){
			return new MembernumCommand();
		}
		else if(cmd.equals("pReply")){
			return new ParttimeReplyCommand();
		}
		else if(cmd.equals("dReply")){
			return new DaetaReplyCommand();
		}
		else{
			return null;
		}
		
	}
}
