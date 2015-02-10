package jdbcConnection;

import java.util.ArrayList;

public interface TimeDepositDAO {
	public abstract void addBalance(String tacctnum,String timeperiod,double tbalanceEB,double tbalanceEA)throws Exception;
	
	public abstract void minusBalance(String tacctnum)throws Exception;
	
	public abstract double showBalanceEA(String tacctnum)throws Exception;
	public  boolean isTacctExisted(String tacctnum) throws Exception;
	public  ArrayList<String> showTacct(String tusername) throws Exception;
	public String Caldeadline(String todaydate,String timeperiod) throws Exception;
	public double showBalanceEB(String Tacctnum) throws Exception;
	public String showFromacct(String taccount) throws Exception;
	public double CalTbalanceEA(double TbalanceEB,String timeperiod) throws Exception;
	public void Setdeadline(String Tacctnum,String deadline)throws Exception;
	public String TviewAcctType(String acctNum) throws Exception;
	public boolean SFTwriteHistory(String toAcct,String fromAcct,double amount) throws Exception;
	public TimeDeposit ShowTimeDepositINF(String username) throws Exception;
	public void SetBegin(String Tacctnum, String begindate)throws Exception;
	public boolean TSFwriteHistory(String toAcct,String fromAcct,double amount) throws Exception;
}

