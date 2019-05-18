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
