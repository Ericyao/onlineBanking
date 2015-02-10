package jdbcConnection;
import java.sql.*;
import java.util.ArrayList;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date; 

public class AcctDAOimpl implements AcctDAO {

	@Override
	public String viewUserName(String acctNum) throws Exception {
		AcctBean acct = null;
		String username = null;
		String sql = "SELECT username FROM account WHERE acctnum= ?";
		
		PreparedStatement pstmt = null;
		DBconnection dbc = null;
		try{
			//connect to database
			dbc = new DBconnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,acctNum);
			//Query the database
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				//After finding the result, assign the value to account
				acct = new AcctBean();
				acct.setUserName(rs.getString(1));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			System.out.println("hahahah");
		}finally{
			dbc.close();
		}
		return acct.getUserName();
	}

	@Override
	public double viewBalance(String acctNum) throws Exception {
		AcctBean acct = null;
		double balance = 0;
		String sql = "SELECT balance FROM account WHERE acctnum= ?";
		
		PreparedStatement pstmt = null;
		DBconnection dbc = null;
		try{
			//connect to database
			dbc = new DBconnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,acctNum);
			//Query the database
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				//After finding the result, assign the value to account
				acct = new AcctBean();
				acct.updateBalance(balance = rs.getDouble(1));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("error!");
		}finally{
			dbc.close();
		}
		return balance;
	}

	@Override
	public boolean delAcct(String acctNum) throws Exception {
		String sql = "DELETE FROM ACCOUNT WHERE acctnum = ?";
		boolean flag = false;
		PreparedStatement pstmt = null;
		DBconnection dbc = null;
		try{
			//connect to database
			dbc = new DBconnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,acctNum);
			//Query the database
			pstmt.executeUpdate();
			flag = true;
			pstmt.close();
		}catch(Exception e){
			throw new Exception("error!");
		}finally{
			dbc.close();
		}
		return flag;
	}

	//Not yet!
	@Override
	public void ShowHistory(String acctNum, String viewPeriod) throws Exception {
		AcctBean acct = null;
		String sql = "SELECT * FROM memo WHERE acctnum= ?";
		
		PreparedStatement pstmt = null;
		DBconnection dbc = null;
		try{
			//connect to database
			dbc = new DBconnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,acctNum);
			//Query the database
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				//After finding the result, assign the value to account
				acct = new AcctBean();
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("error!");
		}finally{
			dbc.close();
		}
		
	}
	
	public void updateBalance(double newBalance, String acctNum) throws Exception{
		String sql = "UPDATE account SET balance=? WHERE acctnum=?";
		PreparedStatement pstmt = null;
		DBconnection dbc = null;
		//For the database
		try{
			//connect to database
			dbc = new DBconnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setDouble(1,newBalance);
			pstmt.setString(2,acctNum);
			//Query the database
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("error!");
		}finally{
			dbc.close();
		}
	}

	@Override
	public String viewAcctType(String acctNum) throws Exception {
		String acctType = null;
		AcctBean acct = null;
		String sql = "SELECT accttype FROM account WHERE acctnum= ?";
		
		PreparedStatement pstmt = null;
		DBconnection dbc = null;
		try{
			//connect to database
			dbc = new DBconnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,acctNum);
			//Query the database
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				//After finding the result, assign the value to account
				acct = new AcctBean();
				acctType = rs.getString(1);
				acct.setAcctType(acctType);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("error!");
		}finally{
			dbc.close();
		}
		return acctType;
	}

	/* ***************For Transfer************************ */
	//Provide account list for the user
	public ArrayList<String> getAccounts(String userName) throws Exception {
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		ArrayList<String> acctlist = new ArrayList<String>();
		AcctBean acct= new AcctBean();		
		String sql = "SELECT acctnum from account where username= ?";
		try{
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, userName);
			ResultSet rs = pStatement.executeQuery();
			while(rs.next()) {				
				//tacct.setTacctnum(rs.getString(1));
				//tacctlist.add(tacct.getTacctnum());
				acctlist.add(rs.getString(1));
				
				}
			if (acctlist!=null) {
				System.out.println("Show T balance Successfully!");
			} else {
				System.out.println("Show T balance Faild!");
				acct = null;
			}
			// 关闭连接，返回结果
			// rs.close();	
			dbc.close();
			return acctlist;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
			
	}
			
	public double getRate(String typeFrom,String typeTo){
		//eg. from * rate = to
		double rate =1;
		System.out.println("typefrom"+typeFrom);
		System.out.println("typeTo"+typeTo);
		if(typeFrom.equals("RMB")){
			if(typeTo.equals("US")){
				rate = 0.16066;
			}else if(typeTo.compareTo("EURO") == 0){
				rate = 0.12329;
			}else{//"HK"
				rate = 1.24507;
			}
		}else if(typeFrom.compareTo("EURO") == 0){
			if(typeTo.compareTo("RMB") == 0){
				rate = 8.11119;
			}else if(typeTo.compareTo("US") == 0){
				rate = 1.30317;
			}else{//HK
				rate = 10.09899;
			}
		}else if(typeFrom.compareTo("US") == 0){
			if(typeTo.compareTo("RMB") == 0){
				rate = 6.22420;
			}else if(typeTo.compareTo("EURO") == 0){
				rate = 0.76736;
			}else{//HK
				rate = 7.74956;
			}
		}else{//HK
			if(typeTo.compareTo("RMB") == 0){
				rate = 0.80317;
			}else if(typeTo.compareTo("US") == 0){
				rate = 0.12904;
			}else if(typeFrom.compareTo("EURO") == 0){
				rate = 0.09902;
			}
		}
		return rate;
	}

	@Override
	public boolean ifExit(String acctNum) throws Exception {
		boolean flag = false;
		String sql = "SELECT username FROM account WHERE acctnum= ?";
		
		PreparedStatement pstmt = null;
		DBconnection dbc = null;
		try{
			//connect to database
			dbc = new DBconnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,acctNum);
			//Query the database
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				flag = true;
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("error!");
		}finally{
			dbc.close();
		}
		return flag;
	}
	
	//Suppose the acct user choose is toAcct & fromAcct
	//transfer for saving - saving
	//assume the currency of the amount is the same as the toBalance. 
	public boolean moneyTransfer(String toAcct,String fromAcct,double amount) throws Exception{	
		boolean flag = false;//for return
		double rate = 0;
		AcctDAO ad = new AcctDAOimpl();
		double newTo = 0,newFrom = 0; //after transfer 
		
		//judge if the fromAcct exits
		if(ifExit(fromAcct)){ //from account exits
			//get type of account
			String toType = ad.viewAcctCurrency(toAcct);
			String fromType = ad.viewAcctCurrency(fromAcct);
			//get balance of account
			double toBalance = ad.viewBalance(toAcct);
			double fromBalance = ad.viewBalance(fromAcct);
			double fromForeign = 0; //for different currency transfer
			
			if(toType.equals(fromType)){//the same type transfer
				if(fromBalance < amount){
					System.out.println("Not enough balance!");
				}else{
					newTo =  toBalance + amount;
					newFrom = fromBalance + amount;
					ad.updateBalance(newTo, toAcct);
					ad.updateBalance(newFrom, fromAcct);
					flag = true;
				}
			}else{//different type transfer
				rate = getRate(fromType,toType);
				fromForeign = amount / rate;
				System.out.println("amount"+amount);
				System.out.println("rate " + rate);
				System.out.println("fromForeign:"+ fromForeign);
				
				if(fromBalance < fromForeign){
					System.out.println("Not enough balance!");
				}else{
					newTo = toBalance + amount;
					newFrom = fromBalance - fromForeign;
					ad.updateBalance(newTo, toAcct);
					ad.updateBalance(newFrom, fromAcct);
					flag = true;
				}
				
			}
		}else{
			System.out.println("Account doesn't exist");
		}
		
		return flag;
		
	}

	public void addBalance(String acctnum,double damount)throws Exception {
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		
		AcctBean acct= new AcctBean();
		String sql="UPDATE account SET balance = ?  where acctnum = ?";		
		
		try{
			pStatement = conn.prepareStatement(sql);
			pStatement.setDouble(1, damount);
			pStatement.setString(2,acctnum);
			pStatement.executeUpdate();
			System.out.println("Begin Get it");
			dbc.close();
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return;
		
	}
	
	public void minusBalance(String acctnum,double amount)throws Exception {
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		
		AcctBean acct= new AcctBean();
		String sql="UPDATE account SET balance = ?  where acctnum = ?";		
		
		try{
			pStatement = conn.prepareStatement(sql);
			pStatement.setDouble(1, amount);
			pStatement.setString(2,acctnum);
			pStatement.executeUpdate();
			System.out.println("Begin Get it");
			dbc.close();
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return;
		
		
	}

	public String showToacct(String acctnum) throws Exception {
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		
		AcctBean acct= new AcctBean();		
		String sql = "SELECT acctto from account where acctnum = ?";
		try{
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, acctnum);
			ResultSet rs = pStatement.executeQuery();
			
			while(rs.next()) {				
				
				acct.setacctTo(rs.getString(1));
				
				}
			if (acct.getaccTo()!=null) {
				System.out.println("GETTACCTO balance Successfully!");
			} else {
				System.out.println("GETTACCTo balance Faild!");
				acct = null;
			}
			// 关闭连接，返回结果
			// rs.close();	
			dbc.close();
			return acct.getaccTo();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int writeHistory(String toAcct,String fromAcct,double amount) throws Exception {
		boolean flag = false;
		//get type of two accounts
			AcctDAOimpl ad = new AcctDAOimpl();
			String typeTo = ad.viewAcctType(toAcct);
			String typeFrom =  ad.viewAcctType(fromAcct);
			String transType = typeFrom+ "-" + typeTo;
			//get date
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String date=df.format(new Date());
			//get referenceno
			HistoryDAO hd = new HistoryDAO();
			int ref = hd.viewMAXRefe() + 1;
			HistoryBean history = new HistoryBean();
			//write into database
			String sql = "INSERT INTO history(referenceno,fromacct,toacct,transtype,amount,date) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = null;
			DBconnection dbc = null;
			try{
				//connect to database
				dbc = new DBconnection();
				pstmt = dbc.getConnection().prepareStatement(sql);
				pstmt.setInt(1,ref);history.setReferenceNo(ref);
				pstmt.setString(2,fromAcct);history.setFromAcct(fromAcct);
				pstmt.setString(3,toAcct);history.setToAcct(toAcct);
				pstmt.setString(4,transType);history.setTransType(transType);
				pstmt.setDouble(5,amount);history.setAmount(amount);
				pstmt.setString(6,date);history.setDate(date);
				//Query the database
				System.out.println(pstmt.executeUpdate());
				pstmt.close();System.out.println("refer"+history.getReferenceNo());
				flag = true;
			}catch(Exception e){
				throw new Exception("error!");
			}finally{
				dbc.close();
			}
		return ref;
	}
	

	@Override
	public String viewAcctCurrency(String acctNum) throws Exception {
		String acctType = null;
		AcctBean acct = null;
		String sql = "SELECT currency FROM account WHERE acctnum= ?";
		
		PreparedStatement pstmt = null;
		DBconnection dbc = null;
		try{
			//connect to database
			dbc = new DBconnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,acctNum);
			//Query the database
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				//After finding the result, assign the value to account
				acct = new AcctBean();
				acctType = rs.getString(1);
				acct.setCurrency(acctType);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("error!");
		}finally{
			dbc.close();
		}
		return acctType;
	}
	
	

	
}