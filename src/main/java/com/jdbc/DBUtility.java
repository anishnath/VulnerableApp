/**
 * 
 * 
 * Copyright (C) 2016 Anish Nath

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

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

			//System.out.println(
				//	"host: " + host + "username: " + username + "password: " + password + "\ndriver: " + driver);

			Class.forName("com.mysql.jdbc.Driver");
			//System.out.println("--------------------------");
			//System.out.println("DRIVER: " + driver);
			connection = DriverManager.getConnection("jdbc:mysql://127.12.156.2:3306/zarigatongy?autoReconnect=true", username, password);
			//connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/zarigatongy", username, password);
			System.out.println("CONNECTION: " + connection);

			return connection;
		}
	}
}