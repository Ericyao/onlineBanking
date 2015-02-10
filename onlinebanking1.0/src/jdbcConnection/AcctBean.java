package jdbcConnection;

public class AcctBean {

    private String username;
    private String acctnum;
    private double balance;
    private String accttype;
    private String currency;
    private boolean acctvalid;
	private String Toacct;	
    public String getUserName(){
    	return username;
    }
    
    public void setUserName(String newUserName){
    	username = newUserName;
    }
    
    public String getAcctNum(){
    	return acctnum;
    }
    
    public void setAcctNum(String newAcctnum){
    	acctnum = newAcctnum;
    }
    
    public double getBalance(){
    	return balance;
    }
    
    public void updateBalance(double d){
    	balance = d;
    }
    public String getAcctType(){
    	return accttype;
    }
    
    public void setAcctType(String newAcctType){
    	accttype = newAcctType;;
    }
    
    public boolean isAcctValid() {
       return acctvalid;
	}

    public void setAcctValid(boolean newAcctValid) {
       acctvalid = newAcctValid;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}
    
	public void setacctTo(String Toacct){
		this.Toacct = Toacct;
	}
	
	public String getaccTo(){
		return Toacct;
	}

}