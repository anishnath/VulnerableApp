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


package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CrudDao;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.model.Student;

public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Object> JSONROOT = new HashMap<String, Object>();

	private CrudDao dao;

	public Controller() {
		dao = new CrudDao();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");
		
		List<Student> studentList = new ArrayList<Student>();
		if (action != null) {
			
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			response.setContentType("application/json");
			try {
				if (action.equals("list")) {
					// Fetch Data from Student Table
					studentList = dao.getAllStudents();

					// Return in the format required by jTable plugin
					JSONROOT.put("Result", "OK");
					JSONROOT.put("Records", studentList);

					// Convert Java Object to Json
					String jsonArray = gson.toJson(JSONROOT);

					response.getWriter().print(jsonArray);
				} else if (action.equals("create") || action.equals("update")) {
					Student student = new Student();
					if (request.getParameter("studentId") != null) {
						int studentId = Integer.parseInt(request.getParameter("studentId"));
						student.setStudentId(studentId);
					}

					if (request.getParameter("name") != null) {
						String name = request.getParameter("name");
						student.setName(name);
					}

					if (request.getParameter("department") != null) {
						String department = request.getParameter("department");
						student.setDepartment(department);
					}

					if (request.getParameter("emailId") != null) {
						String emailId = request.getParameter("emailId");
						student.setEmailId(emailId);
					}

					if (action.equals("create")) {
						// Create new record
						dao.addStudent(student);
					} else if (action.equals("update")) {
						// Update existing record
						dao.updateStudent(student);
					}

					// Return in the format required by jTable plugin
					JSONROOT.put("Result", "OK");
					JSONROOT.put("Record", student);

					// Convert Java Object to Json
					String jsonArray = gson.toJson(JSONROOT);
					response.getWriter().print(jsonArray);
				} else if (action.equals("delete")) {
					// Delete record
					if (request.getParameter("studentId") != null) {
						int studentId = Integer.parseInt(request.getParameter("studentId"));
						dao.deleteStudent(studentId);

						// Return in the format required by jTable plugin
						JSONROOT.put("Result", "OK");

						// Convert Java Object to Json
						String jsonArray = gson.toJson(JSONROOT);
						response.getWriter().print(jsonArray);
					}
				}
				
				else if (action.equals("findByName")) {
					// Delete record
					if (request.getParameter("username") != null) {
						String studentName =String.valueOf(request.getParameter("username"));
						//dao.deleteStudent(studentId);
						
						List<String> userNameList=dao.getstudentByUserName(studentName);

			

						// Convert Java Object to Json
						//String jsonArray = gson.toJson(JSONROOT);
						//response.getWriter().print(jsonArray);
						
						 request.setAttribute("sqlInection",userNameList);
						 request.getRequestDispatcher("/sqlinjection1.jsp").forward(request, response);
					}
				}
				
			} catch (Exception ex) {
				JSONROOT.put("Result", "ERROR");
				JSONROOT.put("Message", ex.getMessage());
				String error = gson.toJson(JSONROOT);
				response.getWriter().print(error);
			}
		}
		
		
	}
}