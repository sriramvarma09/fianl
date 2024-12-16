package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ResourceBundle;

public class DbCon {
	
	private static Connection con=null;
	private DbCon() {}

	public static Connection getConnection() {
		try {
			String driver=ResourceBundle.getBundle("db").getString("driver");
			Class.forName(driver);
			con = DriverManager.getConnection(ResourceBundle.getBundle("db").getString("url"),ResourceBundle.getBundle("db").getString("username"),ResourceBundle.getBundle("db").getString("password"));
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

}
