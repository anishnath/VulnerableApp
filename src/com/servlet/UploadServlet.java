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
		String s = convertStreamToString(is);
		//System.out.println(s);
		//request.getSession().setAttribute("XYZ", "asdsad");
		//out.println("<pre class=\"brush: js;\"> Hello </pre>");
		out.println(s);
		//response.sendRedirect("login.jsp");
	

	}

	static String convertStreamToString(java.io.InputStream is) {
		java.util.Scanner s = new java.util.Scanner(is).useDelimiter("\\A");
		return s.hasNext() ? s.next() : "";
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		throw new ServletException("GET method used with " + getClass().getName() + ": POST method required.");
	}
}