package com.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

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
		
		if(filename!=null && filename.contains("temp.txt"))
		{
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
			StringBuilder builder = new StringBuilder();
			builder.append("Ok Response of temp.txt file");
			builder.append("<br>");
			builder.append("https://goo.gl/mKw4dn");
			builder.append("<br>");
			builder.append("https://goo.gl/VS5aTv");
			out.write(builder.toString());
			
			return;
			
		}

		
		
		 FileInputStream fileInputStream = new FileInputStream(filepath +
		 filename);
		
		 int i;
		 while ((i = fileInputStream.read()) != -1) {
		 out.write(i);
		 }
		 fileInputStream.close();
		 out.close();

	
	}
}
