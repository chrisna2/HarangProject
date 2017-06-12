package parttime.model;

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
		else if(cmd.equals("DMAIN")){
			return new DaetaMainCommand();
		}
		else if(cmd.equals("PREAD")){
			return new ParttimeReadCommand();
		}
		else if(cmd.equals("DREAD")){
			return new DaetaReadCommand();
		}
		else if(cmd.equals("PAPPLY")){
			return new ParttimeApplyCommand();
		}
		else if(cmd.equals("DAPPLY")){
			return new DaetaApplyCommand();
		}
		else if(cmd.equals("PPOST")){
			return new ParttimePostCommand();
		}
		else if(cmd.equals("DPOST")){
			return new DaetaPostCommand();
		}
		else if(cmd.equals("PUPDATE")){
			return new ParttimeUpdateCommand();
		}
		else if(cmd.equals("DUPDATE")){
			return new DaetaUpdateCommand();
		}
		else if(cmd.equals("PRESUME")){
			return new ParttimeResumeCommand();
		}
		else if(cmd.equals("DRESUME")){
			return new DaetaResumeCommand();
		}
		else{
			return null;
		}
		
		
	}
}
