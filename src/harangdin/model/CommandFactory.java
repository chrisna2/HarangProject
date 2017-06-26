package harangdin.model;

public class CommandFactory {
	
	private CommandFactory(){}

	private static CommandFactory instance = new CommandFactory();
	
	public static CommandFactory newInstance(){
		return instance;
	}
	
	public CommandInterface createCommand(String cmd){
		
		if(cmd.equals("main")){
			return new HarangdinMainCommand();
		}
		else if(cmd.equals("adminMain")){
			return new AdminMainCommand();
		}
		else if(cmd.equals("regist")){
			return new RegistCommand();
		}
		else if(cmd.equals("regist_proc")){
			return new RegistProcCommand();
		}
		else if(cmd.equals("mypage")){
			return new MyPageCommand();
		}
		else if(cmd.equals("adminDonate")){
			return new AdminDonateCommand();
		}
		else if(cmd.equals("bdetail")){
			return new BookDetailCommand();
		}
		else if(cmd.equals("bd_detail")){
			return new BookDonateDetailCommand();
		}
		else if(cmd.equals("b_hunter")){
			return new BookHunterCommand();
		}
		else if(cmd.equals("buying")){
			return new BuyingCommand();
		}
		else if(cmd.equals("selling")){
			return new SellingCommand();
		}
		else if(cmd.equals("donation")){
			return new DonationCommand();
		}
		
		else{
			return null;
		}
		
	}
}
