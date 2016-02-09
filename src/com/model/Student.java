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


package com.model;

public class Student {

private int studentId;
private String name;
private String department;
private String emailId;

public int getStudentId() {
	return studentId;
}

public String getName() {
	return name;
}

public String getDepartment() {
	return department;
}

public String getEmailId() {
	return emailId;
}

public void setStudentId(int studentId) {
	this.studentId = studentId;
}

public void setName(String name) {
	this.name = name;
}

public void setDepartment(String department) {
	this.department = department;
}

public void setEmailId(String emailId) {
	this.emailId = emailId;
}
}