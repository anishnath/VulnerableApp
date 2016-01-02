package com.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.DBUtility;
import com.model.Student;

public class CrudDao {

private Connection dbConnection;
private PreparedStatement pStmt;

public CrudDao()  {
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
	String insertQuery = "INSERT INTO STUDENT( NAME, " +
			"DEPARTMENT, EMAIL) VALUES (?,?,?)";
	try {
		pStmt = dbConnection.prepareStatement(insertQuery);
		//pStmt.setInt(1, student.getStudentId());
		pStmt.setString(1, student.getName());
		pStmt.setString(2, student.getDepartment());
		pStmt.setString(3, student.getEmailId());
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

public void updateStudent(Student student)  {
	String updateQuery = "UPDATE STUDENT SET NAME = ?, " +
			"DEPARTMENT = ?, EMAIL = ? WHERE STUDENTID = ?";
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
}