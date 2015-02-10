<%@ page language="java" contentType="text/html; charset=gb2312"
   %>
<%@page import = "java.sql.*" %>
<%@page import = "jdbcConnection.*" %>
<%@page import = "java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>connect the database</title>
</head>
<body>
	<% 	
	 String DBURL ="jdbc:mysql://localhost:3306/onlinebank";
	 String DBUSER ="root";
	String DBPASSWORD ="";
	Connection conn = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
		System.out.println("Yeah!");
		} catch (ClassNotFoundException e){
			System.out.println("Can not find the Driver");
		}catch (SQLException e){
			System.out.println("Can not connect the database");
		}
		//DBconnection conn;
		try{
			Statement stmt = conn.createStatement();
			String queryALL = "SELECT*FROM user;";
			ResultSet rs = stmt.executeQuery(queryALL);
			while(rs.next()){
				String username = rs.getString(1);
				int userid = rs.getInt(2);
				String userpassword = rs.getString(3);
				
				out.println("username:"+username);
				out.println("userid"+userid);
				out.println("password"+userpassword);
			}
		}catch (SQLException e){
			out.println("Query failed");
		}
	    
	
	
%>
</body>
</html>