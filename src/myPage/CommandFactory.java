package myPage;

import myPage.model.AchallengeCommand;
import myPage.model.AcompleteCommand;
import myPage.model.AinformationCommand;
import myPage.model.AlessonCommand;
import myPage.model.AnewLessonUpdateCommand;
import myPage.model.AnewlessonCommand;
import myPage.model.AnewmemCommand;
import myPage.model.ApointCommand;
import myPage.model.ApplistCommand;
import myPage.model.AspecListCommand;
import myPage.model.AupdatelessonCommand;
import myPage.model.MyinfoCommand;
import myPage.model.MyinfoUpdateCommand;
import myPage.model.PointZeroCommand;
import myPage.model.PointlistCommand;
import myPage.model.SpecUpCommand;
import myPage.model.SpecUpProcCommand;
import myPage.model.TimetableCommand;

/**
 * 회원 페이지 와 회원 및 포인트 관리 페이지 등록 팩토리 클래스 
 * @author 나현기
 *
 */
public class CommandFactory {

	private CommandFactory() {
	}

	private static CommandFactory instance = new CommandFactory();

	public static CommandFactory newInstance() {
		return instance;
	}

	public CommandInterface createCommand(String cmd) {

		System.out.println(cmd);

		if (cmd.equals("myinfo")) {

			return new MyinfoCommand();
		} else if (cmd.equals("update")) {

			return new MyinfoUpdateCommand();
		} else if (cmd.equals("specUp")) {

			return new SpecUpCommand();
		} else if (cmd.equals("specUp_proc")) {

			return new SpecUpProcCommand();
		} else if (cmd.equals("timeTable")) {

			return new TimetableCommand();
		} else if (cmd.equals("pointList")) {

			return new PointlistCommand();
		} else if (cmd.equals("pointZero")) {

			return new PointZeroCommand();
		} else if (cmd.equals("AmemList")) {

			return new AinformationCommand();
		} else if (cmd.equals("AspecList")) {

			return new AspecListCommand();
		} else if (cmd.equals("Achallenge")) {

			return new AchallengeCommand();
		} else if (cmd.equals("AspecList")) {

			return new AspecListCommand();
		} else if (cmd.equals("Alesson")) {

			return new AlessonCommand();
		} else if (cmd.equals("ApointCheck")) {

			return new ApointCommand();
		} else if (cmd.equals("Applist")) {

			return new ApplistCommand();
		} else if (cmd.equals("Anewmem")) {

			return new AnewmemCommand();
		} 
		else if (cmd.equals("Anewlesson")) {
		
			return new AnewlessonCommand();
		} 
		else if (cmd.equals("Aupdatelesson")) {
			
			return new AupdatelessonCommand();
		} 
		else if (cmd.equals("AnewlessonUpdate")) {
			
			return new AnewLessonUpdateCommand();
		} else if (cmd.equals("Acomplete")) {

			return new AcompleteCommand();
		}
		else {
			return null;
		}

	}
}
