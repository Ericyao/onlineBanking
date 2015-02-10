package jdbcConnection;

public class User {
	private int userid;
	private String username;
	private String password;
	private String address;
	private String realname;
	private String telephone;
	private int noofacc;
	
	public int getUserid(){
		return userid;
	}
	public void setUserid(int userid){
		this.userid = userid;
	}
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getPassword(){
		return password;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public String getAddress(){
		return address;
	}
	
	public void setAddress(String address){
		this.address = address;
	}
	
	public String getRealname(){
		return realname;
	}
	
	public void setRealname(String realname){
		this.realname = realname;
	}
	
	public void setTelephone(String telephone){
		this.telephone = telephone;
	}
	
	public String getTelephone(){
		return telephone;
	}
	public int getNoofacc(){
		return noofacc;
	}
	
	public void setNoofacc(int noofacc){
		this.noofacc = noofacc;
	}
	
}
