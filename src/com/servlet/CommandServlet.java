package com.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommandServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommandServlet() {
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

		// Actual logic goes here.
		PrintWriter out = response.getWriter();
		out.println("<h1>" + "Hello CANT PROCESS THE MESSAGE TRY AGAIN " + "</h1>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String inputText = request.getParameter("text");
		final String methodName = request.getParameter("methodName");
		PrintWriter out = response.getWriter();
		final List<String> command = new ArrayList<String>();

		if (inputText != null && !inputText.isEmpty()) {
			inputText = inputText.trim();

			// if (inputText.contains("env") || inputText.contains("rm") ||
			// inputText.contains("mv")) {
			// out.println("<b><u>Command </b></u>= " + inputText +
			// "<br><font size=\"3\" color=\"blue\">"
			// + "Permission Denied</font><br>");
			// return;
			// }
			final StringTokenizer token = new StringTokenizer(inputText);
			while (token.hasMoreElements()) {
				command.add((String) token.nextElement());

			}
			if (command.size() > 0) {

				// final String output
				// =networkDiagnostics.doCommand(command);

				Callable<Object> callable = new Callable<Object>() {
					public Object call() throws Exception {
						return doCommand(command);
					}
				};

				ExecutorService executorService = Executors.newCachedThreadPool();
				Object result = null;
				Future<Object> task = executorService.submit(callable);
				try {
					// ok, wait for 30 seconds max
					result = task.get(10, TimeUnit.SECONDS);
					System.out.println("Finished with result: " + result);
					out.println("<b><u>Command </b></u>= " + inputText + "<br><font size=\"3\" color=\"blue\">" + result
							+ "</font><br>");
				} catch (ExecutionException e) {
					throw new RuntimeException(e);

				} catch (TimeoutException e) {
					System.out.println("timeout...");
					System.out.println("Finished with result: " + result);
				} catch (InterruptedException e) {
					System.out.println("interrupted");
				}

			}

		}
	}

	public static String doCommand(List<String> command)

	{
		StringBuilder builder = new StringBuilder();
		System.out.println("Command  " + command.toString());
		if(command.contains("rm") || command.contains("mv"))
		{
			builder.append("This command caanot be executed");
			return builder.append("<pre class=\"brush: js;\"> Hello </pre>").toString();
		}
		try {
			String s = null;

			ProcessBuilder pb = new ProcessBuilder(command);
			Process process = pb.start();

			BufferedReader stdInput = new BufferedReader(new InputStreamReader(process.getInputStream()));
			BufferedReader stdError = new BufferedReader(new InputStreamReader(process.getErrorStream()));

			while ((s = stdInput.readLine()) != null) {
				builder.append(s + "<br>");
				builder.append(System.getProperty("line.separator"));
			}

			// read any errors from the attempted command
			System.out.println("Here is the standard error of the command (if any):\n");
			while ((s = stdError.readLine()) != null) {
				builder.append(s + "<br>");
				builder.append(System.getProperty("line.separator"));
			}

		} catch (Exception e) {
			System.out.println("Error " + e);
			builder.append("<pre class=\"brush: js;\">"+ e +" </pre>").toString();
		}
		builder.append("<pre class=\"brush: js;\"> Command Executed </pre>").toString();
		return builder.toString();
	}

}
