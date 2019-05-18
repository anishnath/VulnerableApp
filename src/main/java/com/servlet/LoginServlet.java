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

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.LoginDAO;

import java.sql.*;

public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			response.setContentType("text/html;charset=UTF-8");

			String username = request.getParameter("username");
			String pass = request.getParameter("pass");
			LoginDAO login = new LoginDAO();
			long startTime = System.currentTimeMillis();
			if (login.isValidLogin(username, pass)) {
				HttpSession session = request.getSession();
				session.setAttribute("user", username);
				// setting session to expiry in 30 mins
				session.setMaxInactiveInterval(30 * 60);
				Cookie userName = new Cookie("user", username);
				userName.setMaxAge(30 * 60);
				// response.addCookie(userName);
				// response.sendRedirect("main.jsp");
				long endTime = System.currentTimeMillis();
				long totalTime = endTime - startTime;
				out.println("<b><u>Command </b></u>= LoggedIn Time" + "<br><font size=\"3\" color=\"blue\">" + totalTime
						+ "</font><br>");
				
				request.setAttribute("name","<b><u>Command </b></u>= User Succesfully Logged-IN,In Time" + "<br><font size=\"3\" color=\"blue\">" + totalTime
						+ "</font><br>");
		        request.getRequestDispatcher("/sqlinjection1.jsp").forward(request, response);

			} else {
				
				 request.setAttribute("name","<font color=red>Either user name or password is wrong.</font>");
				 request.getRequestDispatcher("/sqlinjection1.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println("<font color=red>Either user name or password is wrong or DB server is DOWN.</font>");
		}
	}
}