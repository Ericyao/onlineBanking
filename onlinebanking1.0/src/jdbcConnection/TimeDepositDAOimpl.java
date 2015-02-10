package jdbcConnection;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public  class TimeDepositDAOimpl implements TimeDepositDAO{

	public void addBalance(String tacctnum,String timeperiod,double tbalanceEB,double tbalanceEA)throws Exception {
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		System.out.println("yes1"+tacctnum+"yes2"+timeperiod+"yes3"+tbalanceEB+"yes4"+tbalanceEA);
		TimeDeposit tacct= new TimeDeposit();
		String sql="UPDATE timedeposit SET tbalanceeb =?,tbalanceea=?,timeperiod = ? where tacctfrom = ? ";		
		//String sql = "UPDATE timedeposit SET tbalanceeb = ? where tacctnum = ?";
		try{
			pStatement = conn.prepareStatement(sql);
			pStatement.setDouble(1, tbalanceEB);
			pStatement.setDouble(2,tbalanceEA);
			pStatement.setString(3, timeperiod);
			pStatement.setString(4, tacctnum);
			//pStatement.setString(2, "312345678");
			pStatement.executeUpdate();
			
			dbc.close();System.out.println("Begin Get it");
	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return;
	}

	public void minusBalance(String tacctnum)throws Exception {
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		
		TimeDeposit tacct = new TimeDeposit();
		String sql="UPDATE  timedeposit SET  TBALANCEEB = '0',tbalanceea = '0' where tacctfrom = ?";		
		
		try{
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, tacctnum);
			pStatement.executeUpdate();
			System.out.println("!!After Get it");
			dbc.close();
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return;
	}

	public double showBalanceEA(String Tacctnum) throws Exception {
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		
		TimeDeposit tacct= new TimeDeposit();		
		String sql = "SELECT tbalanceEA from timedeposit where tacctnum = ?";
		try{
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, Tacctnum);
			ResultSet rs = pStatement.executeQuery();
			
			while(rs.next()) {				
				
				tacct.setTbalancea(rs.getDouble(1));
				
				}
			if (tacct.getTacctnum()!=null) {
				System.out.println("Show T balance Successfully!");
			} else {
				System.out.println("Show T balance Faild!");
				tacct = null;
			}
			// 关闭连接，返回结果
			// rs.close();	
			dbc.close();
			return tacct.getTbalancea();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public double showBalanceEB(String Tacctnum) throws Exception {
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		
		TimeDeposit tacct= new TimeDeposit();		
		String sql = "SELECT tbalanceeb from timedeposit where tacctfrom = ?";
		try{
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, Tacctnum);
			ResultSet rs = pStatement.executeQuery();
			
			while(rs.next()) {				
				
				tacct.setTbalanceb(rs.getDouble(1));
				
				}
			if (tacct.getTbalanceb()!=0) {
				System.out.println("Show T balance Successfully!");
			} else {
				System.out.println("Show T balance Faild!");
				tacct = null;
			}
			// 关闭连接，返回结果
			// rs.close();	
			dbc.close();
			return tacct.getTbalanceb();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public boolean isTacctExisted(String tacctnum) throws Exception {
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		// 声明变量用于存取结果
		boolean isExisted = false;
		// 搜索语句
		String query = "select * from user where tacctnum= ?";
		try{
			// 执行搜索
			pStatement = conn.prepareStatement(query);
			pStatement.setString(1, tacctnum);
			ResultSet rs = pStatement.executeQuery();
			
			// 判断是否为空
			if (!rs.next()) {
				System.out.println("The Taccount number is not Not Existed!");
				isExisted = false;
			} else {
				System.out.println("Existed!");
				isExisted = true;
			}
			// 关闭连接，返回结果
			
			dbc.close();
			return isExisted;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	
	public  ArrayList<String> showTacct(String tusername) throws Exception {
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		ArrayList<String> tacctlist = new ArrayList<String>();
		TimeDeposit tacct= new TimeDeposit();		
		String sql = "SELECT tacctnum from timedeposit where tusername= ?";
		try{
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, tusername);
			ResultSet rs = pStatement.executeQuery();
			while(rs.next()) {				
				//tacct.setTacctnum(rs.getString(1));
				//tacctlist.add(tacct.getTacctnum());
				tacctlist.add(rs.getString(1));
				
				}
			if (tacctlist!=null) {
				System.out.println("Show T balance Successfully!");
			} else {
				System.out.println("Show T balance Faild!");
				tacct = null;
			}
			// 关闭连接，返回结果
			// rs.close();	
			dbc.close();
			return tacctlist;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	public String Caldeadline(String todaydate, String timeperiod) throws Exception {
		String deadline;
		int time = Integer.parseInt(timeperiod);
		/*
		Date date = new Date(0);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		/*String curdate = simpleDateFormat.format(date);*/
	/*	 Calendar   rightNow   =   Calendar.getInstance();  
         //rightNow.add(Calendar.DAY_OF_MONTH,-1);  
         rightNow.add(Calendar.DAY_OF_MONTH,+time);  
           simpleDateFormat.format(rightNow.getTime());  
          deadline = simpleDateFormat.format(date);
      */  
		Calendar now = Calendar.getInstance();
	    System.out.println("Current date : " + (now.get(Calendar.MONTH) + 1) + "-"
	        + now.get(Calendar.DATE) + "-" + now.get(Calendar.YEAR));
	    
	    // add days to current date using Calendar.add method
	    now.add(Calendar.MONTH, time);
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    deadline = sdf.format(now.getTime());
	   System.out.println(deadline);
	   return deadline;
		}
	

	public double CalTbalanceEA(double TbalanceEB,String timeperiod) throws Exception{
		double Tbalanceea = 0;
		double Tbalanceeb = TbalanceEB;
		switch(Integer.parseInt(timeperiod)){
		case 3: Tbalanceea = Tbalanceeb*1.03;
					break;
		case 6: Tbalanceea = Tbalanceeb*1.06;
			break;
		case 9: Tbalanceea = Tbalanceeb*1.09;
			break;
		case 12:Tbalanceea = Tbalanceeb*1.12;
		break;
		}
		
		return Tbalanceea;
	}

	
	public String showFromacct(String taccount) throws Exception {
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		
		TimeDeposit tacct= new TimeDeposit();		
		String sql = "SELECT tacctfrom from timedeposit where tacctnum = ?";
		try{
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, taccount);
			ResultSet rs = pStatement.executeQuery();
			
			while(rs.next()) {				
				
				tacct.setTacctfrom(rs.getString(1));
				
				}
			if (tacct.getTacctfrom()!=null) {
				System.out.println("GETTACCTFROM balance Successfully!");
			} else {
				System.out.println("GETTACCTFROM balance Faild!");
				tacct = null;
			}
			// 关闭连接，返回结果
			// rs.close();	
			dbc.close();
			return tacct.getTacctfrom();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void Setdeadline(String Tacctnum, String deadline)throws Exception {
		String sql = "UPDATE timedeposit SET tdeadline = ? where tacctfrom = ?";
		PreparedStatement pstmt = null;
		DBconnection dbc = null;
		TimeDeposit tacct= new TimeDeposit();		
		//For the database
		try{
			//connect to database
			dbc = new DBconnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, deadline);
			pstmt.setString(2, Tacctnum);
			//Query the database
			pstmt.executeUpdate();
			pstmt.close();
			System.out.println("setdeadline okay!");
		}catch(Exception e){
			throw new Exception("error!");
		}finally{
			dbc.close();
		}
		
	}

	public String TviewAcctType(String acctNum) throws Exception {
		String acctType = null;
		TimeDeposit acct = null;
		String sql = "SELECT taccttype FROM timedeposit WHERE tacctnum= ?";
		
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
				acct = new TimeDeposit();
				acctType = rs.getString(1);
				acct.setTaccttype(acctType);
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
	

	public boolean SFTwriteHistory(String toAcct,String fromAcct,double amount) throws Exception {
		boolean flag = false;
		//get type of two accounts
	AcctDAOimpl ad = new AcctDAOimpl();
		//set type
		String typeFrom = ad.viewAcctType(fromAcct);
		String transType = typeFrom + "-" + "TimeD";
		//get date
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date=df.format(new Date());
		//get referenceno
		HistoryDAO hd = new HistoryDAO();
		int ref = hd.viewMAXRefe() + 1;
		//write into database
		String sql = "INSERT INTO history(referenceno,fromacct,toacct,transtype,amount,date) values(?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		DBconnection dbc = null;
		try{
			//connect to database
			dbc = new DBconnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1,ref);
			pstmt.setString(2,fromAcct);
			pstmt.setString(3,toAcct);
			pstmt.setString(4,transType);
			pstmt.setDouble(5,amount);
			pstmt.setString(6,date);
			//Query the database
			System.out.println(pstmt.executeUpdate());
			pstmt.close();System.out.println("hahaSuccess");
			flag = true;
		}catch(Exception e){
			throw new Exception("error!");
		}finally{
			dbc.close();
		}
	return flag;
	}

	@Override
	public TimeDeposit ShowTimeDepositINF(String tacctnum) throws Exception {
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		//String info=null;
		TimeDeposit tacct = new TimeDeposit();
		String sql="select * from timedeposit where tacctfrom= ?";		
		
		try{
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, tacctnum);
			ResultSet rs = pStatement.executeQuery();
			
			while(rs.next()) {				
				tacct.setTacctnum(rs.getString(1));
				tacct.setTacctfrom(rs.getString(2));
				tacct.setTusername(rs.getString(3));
				tacct.setTbalanceb(rs.getInt(4));
				tacct.setTbalancea(rs.getInt(5));
				tacct.setTaccttype(rs.getString(6));
				tacct.setTimeperiod(rs.getString(7));
				tacct.setTbegin(rs.getDate(8));
				tacct.setTdeadline(rs.getDate(9));
				tacct.setTcurrency(rs.getString(10));
				
				}
			if (tacct.getTacctnum()!=null) {
				System.out.println("Time deposit Query Successfully!");
			} else {
				System.out.println("Time deposit Query Faild!");
				tacct = null;
			}
			// 关闭连接，返回结果
			// rs.close();	
			dbc.close();
			return tacct;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void SetBegin(String Tacctnum, String begindate)throws Exception{
		String sql = "UPDATE timedeposit SET tbegin = ? where tacctfrom = ?";
		PreparedStatement pstmt = null;
		DBconnection dbc = null;
		TimeDeposit tacct= new TimeDeposit();		
		//For the database
		try{
			//connect to database
			dbc = new DBconnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, begindate);
			pstmt.setString(2, Tacctnum);
			//Query the database
			pstmt.executeUpdate();
			pstmt.close();
			System.out.println("setbegindate okay!");
		}catch(Exception e){
			throw new Exception("error!");
		}finally{
			dbc.close();
		}
	}

	public boolean TSFwriteHistory(String toAcct,String fromAcct,double amount) throws Exception {
		boolean flag = false;
			//get type of two accounts
		AcctDAOimpl ad = new AcctDAOimpl();
			//set type
			String typeTo = ad.viewAcctType(toAcct);
			String transType = "TimeD" + "-" + typeTo;
			//get date
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String date=df.format(new Date());
			//get referenceno
			HistoryDAO hd = new HistoryDAO();
			int ref = hd.viewMAXRefe()+ 1;
			//write into database
			String sql = "INSERT INTO history(referenceno,fromacct,toacct,transtype,amount,date) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = null;
			DBconnection dbc = null;
			try{
				//connect to database
				dbc = new DBconnection();
				pstmt = dbc.getConnection().prepareStatement(sql);
				pstmt.setInt(1,ref);
				pstmt.setString(2,fromAcct);
				pstmt.setString(3,toAcct);
				pstmt.setString(4,transType);
				pstmt.setDouble(5,amount);
				pstmt.setString(6,date);
				//Query the database
				System.out.println(pstmt.executeUpdate());
				pstmt.close();System.out.println("hahaSuccess");
				flag = true;
			}catch(Exception e){
				throw new Exception("error!");
			}finally{
				dbc.close();
			}
		return flag;
	}

	
	
	
}	
	
	
 