package jdbcConnection;
import java.sql.*;
import java.text.SimpleDateFormat;
import   java.text.*;
import java.util.*;
import java.util.Date;


public  class UserDAOimpl implements UserDAO {


	public  void updateINF(String password ,String telephone, String address,String username) throws Exception {
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		
		User user= new User();
		String sql="UPDATE user SET password = ?,telephone = ?,address = ? WHERE username = ?";		
		
		try{
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, password);
			pStatement.setString(2, telephone);
			pStatement.setString(3,address);
			pStatement.setString(4, username);
			pStatement.executeUpdate();
			System.out.println("Get it");
			dbc.close();
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return;
		}

		

	public User signin(String username, String password) throws Exception {
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		
		User user= new User();
		String sql="select * from user where username= ? and password= ?";		
		
		try{
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, username);
			pStatement.setString(2, password);
			ResultSet rs = pStatement.executeQuery();
			
			while(rs.next()) {				
				user.setUsername(rs.getString(1));
				user.setUserid(rs.getInt(2));
				user.setPassword(rs.getString(3));
				user.setNoofacc(rs.getInt(4));
				user.setTelephone(rs.getString(5));
				user.setAddress(rs.getString(6));
				}
			if (user.getUserid()!=0) {
				System.out.println("Signin Successfully!");
			} else {
				System.out.println("Signin Faild!");
				user = null;
			}
			// 关闭连接，返回结果
			// rs.close();	
			dbc.close();
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean isUserExisted(String username) throws Exception{
		// TODO Auto-generated method stub
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		// 声明变量用于存取结果
		boolean isExisted = false;
		// 搜索语句
		String query = "select * from user where username= ?";
		try{
			// 执行搜索
			pStatement = conn.prepareStatement(query);
			pStatement.setString(1, username);
			ResultSet rs = pStatement.executeQuery();
			
			// 判断是否为空
			if (!rs.next()) {
				System.out.println("Not Existed!");
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



	public User ShowINF(String username) throws Exception {
		DBconnection dbc = new DBconnection();
		Connection conn = dbc.getConnection();
		PreparedStatement pStatement = null;
		
		User user = new User();
		String sql="select * from user where username= ?";		
		
		try{
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, username);
			ResultSet rs = pStatement.executeQuery();
			
			while(rs.next()) {				
				user.setUsername(rs.getString(1));
				user.setUserid(rs.getInt(2));
				user.setPassword(rs.getString(3));
				user.setNoofacc(rs.getInt(4));
				user.setTelephone(rs.getString(5));
				user.setAddress(rs.getString(6));
				}
			if (user.getUserid()!=0) {
				System.out.println("Query Successfully!");
			} else {
				System.out.println("Query Faild!");
				user = null;
			}
			// 关闭连接，返回结果
			// rs.close();	
			dbc.close();
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}



}
	

