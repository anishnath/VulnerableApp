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
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.jdbc.DBUtility;
import com.model.Student;

public class CrudDao {
	
	private static Random random = new Random();

	private Connection dbConnection;
	private PreparedStatement pStmt;

	public CrudDao() {
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

	public void addStudent(Student student) {
		
		int x =random.nextInt();
		
		String insertQuery = "INSERT INTO STUDENT( STUDENTID,NAME, " + "DEPARTMENT, EMAIL) VALUES (?,?,?,?)";
		//System.out.println(insertQuery);
		
		try {
			pStmt = dbConnection.prepareStatement(insertQuery);
			pStmt.setInt(1, x);
			pStmt.setString(2, student.getName());
			pStmt.setString(3, student.getDepartment());
			pStmt.setString(4, student.getEmailId());
			pStmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void deleteStudent(int userId) {
		String deleteQuery = "DELETE FROM STUDENT WHERE STUDENTID = ?";
		try {
			pStmt = dbConnection.prepareStatement(deleteQuery);
			pStmt.setInt(1, userId);
			pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void updateStudent(Student student) {
		String updateQuery = "UPDATE STUDENT SET NAME = ?, " + "DEPARTMENT = ?, EMAIL = ? WHERE STUDENTID = ?";
		try {
			pStmt = dbConnection.prepareStatement(updateQuery);
			pStmt.setString(1, student.getName());
			pStmt.setString(2, student.getDepartment());
			pStmt.setString(3, student.getEmailId());
			pStmt.setInt(4, student.getStudentId());
			pStmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public List<Student> getAllStudents() {
		List<Student> students = new ArrayList<Student>();

		String query = "SELECT * FROM STUDENT ORDER BY STUDENTID";
		try {
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Student student = new Student();

				student.setStudentId(rs.getInt("STUDENTID"));
				student.setName(rs.getString("NAME"));
				student.setDepartment(rs.getString("DEPARTMENT"));
				student.setEmailId(rs.getString("EMAIL"));
				students.add(student);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return students;
	}

	public List<String> getstudentByUserName(final String userName) {
		List<String> students = new ArrayList<String>();

		String query = "SELECT * FROM LOGIN where user_name='"+userName+ "'ORDER BY user_name";
		try {
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				students.add(rs.getString("USER_NAME"));
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return students;
	}

}