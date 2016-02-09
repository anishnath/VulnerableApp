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
