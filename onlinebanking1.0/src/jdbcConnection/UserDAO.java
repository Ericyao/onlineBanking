package jdbcConnection;
public interface UserDAO {
	//public abstract String ResetPassword(String password) throws Exception;
	public  User signin(String username,String password) throws Exception;
	public  boolean isUserExisted(String username) throws Exception;
	public  void updateINF(String password ,String telephone, String address,String username) throws Exception;
	public  User ShowINF(String username) throws Exception;
}
