
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
import java.net.URI;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.CookieHandler;
import java.net.CookieManager;
import java.net.CookiePolicy;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.URI;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;

public class HttpOnlyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HttpOnlyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// Set response content type
		response.setContentType("text/html");

		issueCookieHttpOnly(response, request, "Vulnerable-Web-Application", "https://goo.gl/3Bn35z",
				"https://goo.gl/86XHov", 300);
		// request.setAttribute("name", builder.toString());
		request.getRequestDispatcher("/httponly.jsp").forward(request, response);
	}

	public static void issueCookieHttpOnly(HttpServletResponse response, HttpServletRequest httpServletRequest,
			String cookieName, String cookieValue, String cookiePath, long maxAgeInSeconds) {

		Date expireDate = new Date();
		expireDate.setTime(expireDate.getTime() + (1000 * maxAgeInSeconds));
		// The following pattern does not work for IE.
		// DateFormat df = new SimpleDateFormat("dd MMM yyyy kk:mm:ss z");

		// This pattern works for Firefox, Chrome, Safari and Opera, as well as
		// IE.
		DateFormat df = new SimpleDateFormat("EEE, dd-MMM-yyyy kk:mm:ss z");
		df.setTimeZone(TimeZone.getTimeZone("GMT"));
		String cookieExpire = df.format(expireDate);

		StringBuilder sb = new StringBuilder(cookieName);
		sb.append("=");
		sb.append(cookieValue);
		sb.append(";expires=");
		sb.append(cookieExpire);
		sb.append(";path=");
		sb.append(cookiePath);
		sb.append(";HttpOnly");

		response.setHeader("SET-COOKIE", sb.toString());

		// httpServletRequest.getSession(true).
		httpServletRequest.getSession(true).getId();

		CookieManager cm = new CookieManager(null, CookiePolicy.ACCEPT_ALL);
		CookieHandler.setDefault(cm);
		Map<String, List<String>> header = new HashMap<>();
		List<String> values = new ArrayList<>();
		values.add("JSESSIONID=" + httpServletRequest.getSession().getId() + "; version=1; Path="
				+ httpServletRequest.getRemoteAddr() + "; HttpOnly");
		values.add("CUSTOMER=WILE_E_COYOTE; version=1; Path=" + httpServletRequest.getRemoteAddr());
		header.put("Set-Cookie", values);
	}

}
