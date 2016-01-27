package com.jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtility {
	private static Connection connection = null;
	//
	// public static Connection getConnection() {
	// if (connection != null)
	// return connection;
	// else {
	// // Store the database URL in a string
	// String serverName = "127.0.0.1";
	// String portNumber = "1521";
	// String sid = "XE";
	// String dbUrl = "jdbc:oracle:thin:@" + serverName + ":" + portNumber
	// + ":" + sid;
	// try {
	// Class.forName("oracle.jdbc.driver.OracleDriver");
	// // set the url, username and password for the database
	// connection = DriverManager.getConnection(dbUrl, "system", "admin");
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// return connection;
	// }
	// }

	public static Connection getConnection() throws IOException, ClassNotFoundException, SQLException {
		if (connection != null)
			return connection;
		else {

			String host = "127.12.156.2"; 
			//String host = "127.0.0.1"; 
			String username = "zarigatongy";
			String password = "zarigatongy";
			String driver = "com.mysql.jdbc.Driver";

			// com.mysql.jdbc.Driver driver2 = new Driver();

			System.out.println(
					"host: " + host + "username: " + username + "password: " + password + "\ndriver: " + driver);

			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("--------------------------");
			System.out.println("DRIVER: " + driver);
			connection = DriverManager.getConnection("jdbc:mysql://127.12.156.2:3306/zarigatongy", username, password);
			//connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/zarigatongy", username, password);
			System.out.println("CONNECTION: " + connection);

			return connection;
		}
	}
}