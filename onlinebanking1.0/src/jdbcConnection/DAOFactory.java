package jdbcConnection;

public class DAOFactory {
	public static UserDAO getUserDAOInstance(){
		return new UserDAOimpl();
	}
}
