package impage.model;

public class CommandFactory {

	private CommandFactory() {
	}

	private static CommandFactory instance = new CommandFactory();

	public static CommandFactory newInstance() {
		return instance;
	}

	public CommandInterface createCommand(String cmd) {

		if (cmd.equals("main")) {

			return new ImmainCommand();
		}
		if (cmd.equals("make")) {

			return new ImmakeCommand();
		}
		if (cmd.equals("detail")) {

			return new ImdetailCommand();
		}
		if (cmd.equals("modify")) {

			return new ImmodifyCommand();
		}
		if (cmd.equals("amain")) {

			return new ImalistCommand();
		}
		if (cmd.equals("adetail")) {

			return new ImadetailCommand();
		}
		if (cmd.equals("insert")) {

			return new InsertCommand();
		}
		if (cmd.equals("update")) {

			return new Immodify2Command();
		}
		if (cmd.equals("warning")) {

			return new ImwarningCommand();
		}
		if (cmd.equals("amodify")) {

			return new ImwarningCommand();
		}
		if (cmd.equals("delete")) {

			return new ImadeleteCommand();
		}
	
		else {

			return null;
		}

	}
}
