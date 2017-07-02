package facilities;

import facilities.CommandFactory;
import facilities.CommandInterface;
import facilities.model.AFacilManagerCommand;
import facilities.model.AFacilPGCommand;
import facilities.model.AFacilSRCommand;
import facilities.model.AfacilAddDelCommand;
import facilities.model.FacilMainCommand;
import facilities.model.FacilPGreservCommand;
import facilities.model.FacilSRreservCommand;

public class CommandFactory {
	private CommandFactory(){}
	
	
	private static CommandFactory instance = new CommandFactory();
		
	
	public static CommandFactory newInstance(){
		return instance;
	}
	
	public CommandInterface createCommand(String cmd){
		
		// 사용자 메인
		if(cmd.equals("FacilMain")){
			System.out.println("if_FacilMain 접근");
			return new FacilMainCommand();
		}	

		// 사용자 운동장 예약
		else if(cmd.equals("FacilPGreserv")){
			return new FacilPGreservCommand();
		}

		// 사용자 스터디룸 예약
		else if(cmd.equals("FacilSRreserv")){
			return new FacilSRreservCommand();
		}

		// 관리자 시설 추가/삭제
		else if(cmd.equals("AFacilAddDel")){
			return new AfacilAddDelCommand();
		}

		// 관리자 운동장 관리
		else if(cmd.equals("AFacilPG")){
			return new AFacilPGCommand();
		}
		
		// 관리자 스터디룸 관리
		else if(cmd.equals("AFacilSR")){
			return new AFacilSRCommand();
		}
		
		// 관리자 사용자 시설 예약 취소
		else if(cmd.equals("AFacilManager")){
			return new AFacilManagerCommand();
		}
		
		else{
			return null;
		}
		
	}
}
