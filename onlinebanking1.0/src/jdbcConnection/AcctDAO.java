package jdbcConnection;

import java.util.ArrayList;

public interface AcctDAO {
	public boolean ifExit(String acctNum) throws Exception;
	public String viewUserName(String acctNum) throws Exception;
	public double viewBalance(String acctNum) throws Exception;
	public String viewAcctType(String acctNum) throws Exception;
	public boolean delAcct(String acctNum) throws Exception;
	public void updateBalance(double newBalance, String acctNum) throws Exception; 
	public void ShowHistory(String acctId,String viewPeriod) throws Exception;
	public ArrayList<String> getAccounts(String userName) throws Exception;
	public double getRate(String typeFrom,String typeTo);
	public boolean moneyTransfer(String toAcct,String fromAcct,double amount) throws Exception;
	public abstract void addBalance(String acctnum,double damount)throws Exception;
	public abstract void minusBalance(String acctnum,double amount)throws Exception;
	public String showToacct(String acctnum) throws Exception;
	public int writeHistory(String toAcct,String fromAcct,double amount) throws Exception;
	public String viewAcctCurrency(String acctNum)throws Exception;
}
