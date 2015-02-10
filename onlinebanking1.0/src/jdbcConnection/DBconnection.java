/**
 * 
 */
package jdbcConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
/**
 * @author EricYao
 * Database Connector 
 */
public class DBconnection {
		
		private static final String DBURL ="jdbc:mysql://localhost:3306/onlinebank";
		private static final String DBUSER ="root";
		private static final String DBPASSWORD ="";
		
		private Connection conn = null;
		public DBconnection() throws Exception {
			try{
				Class.forName("com.mysql.jdbc.Driver");
				this.conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
				System.out.println("Yeah!");
				} catch (ClassNotFoundException e){
					System.out.println("Can not find the Driver");
				}catch (SQLException e){
					System.out.println("Can not connect the database");
				}
		}
		
		public Connection getConnection() {		// Get the connection
			return this.conn;
		}
		
		public void close() throws Exception {
			if (this.conn != null) {
				try {
					this.conn.close();			// Close database connection
				} catch (Exception e) {
					throw e;
				}
			}
		}
}
