package harangdin;

import harangdin.model.AdminBookDetailCommand;
import harangdin.model.AdminDonateCommand;
import harangdin.model.AdminMainCommand;
import harangdin.model.BookDetailCommand;
import harangdin.model.BookDonateDetailCommand;
import harangdin.model.BookHunterCommand;
import harangdin.model.BuyingCommand;
import harangdin.model.DonationCommand;
import harangdin.model.HarangdinMainCommand;
import harangdin.model.OkayCommand;
import harangdin.model.RegistCommand;
import harangdin.model.RegistMyCommand;
import harangdin.model.RegistProcCommand;
import harangdin.model.SellingCommand;
import harangdin.model.TradeBookCommand;

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
		else if(cmd.equals("registMy")){
			return new RegistMyCommand();
		}
		else if(cmd.equals("regist_proc")){
			return new RegistProcCommand();
		}
		else if(cmd.equals("adminDonate")){
			return new AdminDonateCommand();
		}
		else if(cmd.equals("bdetail")){
			return new BookDetailCommand();
		}
		else if(cmd.equals("adminBdetail")){
			return new AdminBookDetailCommand();
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
		else if(cmd.equals("trade")){
			return new TradeBookCommand();
		}
		else if(cmd.equals("okay")){
			return new OkayCommand();
		}
		
		else{
			return null;
		}
		
	}
}
