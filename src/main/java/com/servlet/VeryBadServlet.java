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
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VeryBadServlet
 */
@WebServlet(description = "A very BAD Servlet Example", urlPatterns = { "/VeryBadServlet" })
public class VeryBadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Servlet method responding to HTTP GET methods calls.
	 *
	 * @param request
	 *            HTTP request.
	 * @param response
	 *            HTTP response.
	 */
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		final PrintWriter out = response.getWriter();
		out.write("GET method was invoked.. !");
	}

	/**
	 * Servlet method responding to HTTP POST methods calls.
	 *
	 * @param request
	 *            HTTP request.
	 * @param response
	 *            HTTP response.
	 */
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		final PrintWriter out = response.getWriter();
		out.write("POST method was invoked!");
	}

	/**
	 * Servlet method responding to HTTP PUT methods calls.
	 *
	 * @param request
	 *            HTTP request.
	 * @param response
	 *            HTTP response.
	 */
	@Override
	public void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		final PrintWriter out = response.getWriter();
		out.write("https://goo.gl/bHAB4V");
	}

	/**
	 * Servlet method responding to HTTP DELETE methods calls.
	 *
	 * @param request
	 *            HTTP request.
	 * @param response
	 *            HTTP response.
	 */
	@Override
	public void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		final PrintWriter out = response.getWriter();
		out.write("https://goo.gl/VS5aTv");
	}

	@Override
	protected void doTrace(HttpServletRequest request, HttpServletResponse resp) throws IOException {
		
		System.out.println("Inside TRACE");
		resp.setHeader("Access-Control-Allow-Origin", "*");
		resp.setHeader("Access-Control-Allow-Methods", "GET,DELETE,POST,TRACE,OPTIONS,PUT,HEAD");
		resp.setHeader("Access-Control-Allow-Headers", "Content-Type");
		resp.setHeader("Access-Control-Max-Age", "86400");
		// Tell the browser what requests we allow.
		resp.setHeader("Allow", "GET, HEAD, POST, TRACE, OPTIONS,DELETE,PUT");
	}

	/**
	 * @see HttpServlet#doOptions(HttpServletRequest, HttpServletResponse)
	 */
	protected void doOptions(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setHeader("Access-Control-Allow-Origin", "*");
		resp.setHeader("Access-Control-Allow-Methods", "GET,DELETE,POST,TRACE,OPTIONS,PUT,HEAD");
		resp.setHeader("Access-Control-Allow-Headers", "Content-Type");
		resp.setHeader("Access-Control-Max-Age", "86400");
		// Tell the browser what requests we allow.
		resp.setHeader("Allow", "GET, HEAD, POST, TRACE, OPTIONS");
	}

}
