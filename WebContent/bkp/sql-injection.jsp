<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	if (request.getSession().getAttribute("user") == null) {
		response.sendRedirect("login.jsp");
		return;
	}
%>
<html>  
<body>  
<form action="LoginServlet">  
Find byUsername:<input type="text" name="roll"/><br/>  
<input type="hidden" name="action" value="findByName" /><br/>  
  
<input type="submit" value="search"/>  
</form>  
</body>  
</html>  