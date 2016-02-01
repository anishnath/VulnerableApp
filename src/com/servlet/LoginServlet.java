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

			} else {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
				out.println("<font color=red>Either user name or password is wrong.</font>");
				// rd.include(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println("<font color=red>Either user name or password is wrong or DB server is DOWN.</font>");
		}
	}
}