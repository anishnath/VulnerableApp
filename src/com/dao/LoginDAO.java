package com.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.jdbc.DBUtility;

public class LoginDAO {

	private Connection dbConnection;
	private PreparedStatement pStmt;

	public LoginDAO() {

		try {
			dbConnection = DBUtility.getConnection();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public boolean isValidLogin(final String username, final String password) {

		String selectQuery = "select count(*) as count from  LOGIN  WHERE USER_NAME = '" + username + "' and password = '"
				+ password + "';";

		System.out.println(selectQuery);
		boolean isValidLo = false;
		try {
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery(selectQuery);
			while (rs.next()) {

				int x = rs.getInt("count");
				
				if (x >0)
				{
					isValidLo =true;
					
				}

			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return isValidLo;
	}
	
	public static void main(String[] args) {
		
		LoginDAO login = new LoginDAO();
		System.err.println(login.isValidLogin("admin", "admin"));
	}

}
