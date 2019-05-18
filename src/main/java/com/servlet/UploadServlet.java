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

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UploadServlet extends HttpServlet {

	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 50 * 1024;
	private int maxMemSize = 4 * 1024;
	private static final int BYTES_DOWNLOAD = 1024;
	private File file;



	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		PrintWriter out = response.getWriter();

		response.setContentType("text/html");
		//response.setHeader("Content-Disposition", "attachment;filename=upload.txt");
		ServletContext ctx = getServletContext();
		InputStream is = ctx.getResourceAsStream("/upload.txt");

		;
		String s = Utils.convertStreamToString(is);
		//System.out.println(s);
		//request.getSession().setAttribute("XYZ", "asdsad");
		//out.println("<pre class=\"brush: js;\"> Hello </pre>");
		//out.println(s);
		//response.sendRedirect("login.jsp");
		StringBuilder builder = new StringBuilder();
		builder.append(s);
		request.setAttribute("name", builder.toString());
        request.getRequestDispatcher("/upload.jsp").forward(request, response);
	

	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		throw new ServletException("GET method used with " + getClass().getName() + ": POST method required.");
	}
}