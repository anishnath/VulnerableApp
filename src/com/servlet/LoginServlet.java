package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.LoginDAO;

import java.sql.*;

public class LoginServlet extends HttpServlet {
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        LoginDAO login = new LoginDAO();
        if(login.isValidLogin(username, pass))
        {
        	HttpSession session = request.getSession();
            session.setAttribute("user", username);
            //setting session to expiry in 30 mins
            session.setMaxInactiveInterval(30*60);
            Cookie userName = new Cookie("user", username);
            userName.setMaxAge(30*60);
            response.addCookie(userName);
            response.sendRedirect("main.jsp");
        }
        else
        {
        	 RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
             out.println("<font color=red>Either user name or password is wrong.</font>");
             rd.include(request, response);
        }
    }  
}