package com.webservice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.dao.CrudDao;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.model.Student;

public class StudentSrv {
	
	private HashMap<String, Object> JSONROOT = new HashMap<String, Object>();


	public String createStudent(final String name, String department, String emailId)

	{

		Student student = new Student();
		student.setName(name);
		student.setDepartment(department);
		student.setEmailId(emailId);

		CrudDao dao = new CrudDao();

		dao.addStudent(student);

		List<Student> studentList = new ArrayList<Student>();
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		
		
		
		studentList = dao.getAllStudents();

		// Return in the format required by jTable plugin
		JSONROOT.put("Result", "OK");
		JSONROOT.put("Records", studentList);

		// Convert Java Object to Json
		String jsonArray = gson.toJson(JSONROOT);
		
		return jsonArray;

	}

}
