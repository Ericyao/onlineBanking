package jdbcConnection;
import jdbcConnection.*;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class HistoryDAO {
	public HistoryBean getHistory(int referenceNo) throws Exception{
		String sql = "SELECT * FROM history WHERE referenceno= ?";

		PreparedStatement pstmt = null;
		DBconnection dbc = null;
		HistoryBean history = new HistoryBean();
		try{
			//connect to database
			dbc = new DBconnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1,referenceNo);
			history = new HistoryBean();
			//Query the database
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				//After finding the result, assign the value to account
				history.setReferenceNo(rs.getInt(1));
				history.setFromAcct(rs.getString(2));
				history.setToAcct(rs.getString(3));
				history.setExchangeRate(rs.getDouble(4));
				history.setTransType(rs.getString(5));
				history.setAmount(rs.getDouble(6));
				System.out.println("get History successful!");
			}
			if (history.getReferenceNo()!=0) {
				System.out.println("History Successfully!");
			} else {
				System.out.println("History Faild!");
				history = null;
			}
			rs.close();
			pstmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return history;
	}
	
	public int viewMAXRefe() throws Exception {
		HistoryBean history = new HistoryBean();
		int re = 0;
		String sql = "SELECT max(referenceno) FROM history";
		
		PreparedStatement pstmt = null;
		DBconnection dbc = null;
		try{
			//connect to database
			dbc = new DBconnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			//Query the database
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				history.setReferenceNo(re = rs.getInt(1));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("error!");
		}finally{
			dbc.close();
		}
		return re;
	}
	
	public boolean writeHistory(String toAcct,String fromAcct,double amount) throws Exception {
		boolean flag = false;
			HistoryBean history = new HistoryBean();
			//get type of two accounts
			AcctDAOimpl ad = new AcctDAOimpl();
			String typeTo = ad.viewAcctType(toAcct);
			String typeFrom =  ad.viewAcctType(fromAcct);
			String transType = typeTo + "-" + typeFrom;
			//get date of transfer(current date)
			Date d = new Date();
			DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			String date = fmt.format(d);
			//write into database
			String sql = "INSERT INTO history(referenceno) values(?)";
			PreparedStatement pstmt = null;
			DBconnection dbc = null;
			try{
				//connect to database
				dbc = new DBconnection();
				pstmt = dbc.getConnection().prepareStatement(sql);
				
				pstmt.setInt(1,viewMAXRefe()+1);history.setReferenceNo(viewMAXRefe()+1);/*
				pstmt.setString(2,fromAcct);history.setFromAcct(fromAcct);
				pstmt.setString(3,toAcct);history.setToAcct(toAcct);
				pstmt.setString(4,transType);history.setTransType(transType);
				pstmt.setDouble(5,amount);history.setAmount(amount);
				pstmt.setString(6,date);history.setDate(date);*/
				//Query the database
				pstmt.executeUpdate();
				pstmt.close();
				flag = true;	
			}catch(Exception e){
				throw new Exception("error!");
			}finally{
				dbc.close();
			}
		return flag;
	}

}