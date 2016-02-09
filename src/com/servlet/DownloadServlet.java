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

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String filename = request.getParameter("filename");

		System.out.println("FileName " + filename);

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		// String filename = "home.jsp";
		String filepath = "";
		response.setContentType("APPLICATION/OCTET-STREAM");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

		if (filename != null && filename.contains("temp.txt")) {
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
			StringBuilder builder = new StringBuilder();
			builder.append("Ok Response of temp.txt file");
			builder.append("<br>");
			builder.append("https://goo.gl/mKw4dn");
			builder.append("<br>");
			builder.append("https://goo.gl/VS5aTv");
			out.write(builder.toString());

			// StringBuilder builder = new StringBuilder();

			// builder = new StringBuilder();
			// ServletContext ctx = getServletContext();
			// InputStream is =
			// ctx.getResourceAsStream("/command-injection.txt");
			//
			// ;
			// String s = Utils.convertStreamToString(is);
			// //System.out.println(s);
			// // request.getSession().setAttribute("XYZ", "asdsad");
			// // out.println("<pre class=\"brush: js;\"> Hello </pre>");
			// // out.println(s);
			//
			// builder.append(s);
			// request.setAttribute("name", builder.toString());
			request.getRequestDispatcher("/command-injection.jsp").forward(request, response);

			return;

		}

		if (filename != null && filename.contains("hosts")) {

			FileInputStream fileInputStream = new FileInputStream(filepath + filename);

			int i;
			while ((i = fileInputStream.read()) != -1) {
				out.write(i);
			}
			fileInputStream.close();
			out.close();
		}

	}
}
