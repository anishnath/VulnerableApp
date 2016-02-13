<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.util.List"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<%@include file="head.jsp" %>
<%@include file="/js/googletracking.js" %>
<title>SQL Injection Example</title>


</head>
<body>

<div id="wrap">

<%@include file="top.jsp" %>

<div id="content">

<div class="right">

<h1>SQL Injection Example#!</h1>

<p>
SQL Injection, the number#1 threat, it's easy to find,simulate and most tried by the remote hacker, in the SQL injection,
the remote attacker will try to inject sql query in standard http form post or get method by knowing the basic working knowledge 
of how <b>SQL</b> query works
</p>
<p>

</p>

<fieldset>
<legend>
				<B>SQL Injection LOGIN Example, The correct username=<b>admin </b> password=<b>admin</b> </B>
				
			</legend>
				<pre class="brush: js;">
				// Theese are few Injected SQL Injection which can make you logged in the web page
				// Make user name to any of theese string
				HACKED' or 'x'='x
				admin1' or '1'='1
				HACKED'||'6
				</pre>
				
			
			<form id="form" method="post" action="LoginServlet">
			<br>
			UserName:<input type="text" size=50 name="username" value="admin" /><br/>
            Password:<input type="password" size=50 name="pass" value="admin"/><br/>
		    <input type="submit" value="Click To Login" />
			 <br>
			 </form>
</fieldset>


	<fieldset name="Output of the fieldSet">		
			<%String name=(String)request.getAttribute("name");
		
		if(name!=null)
		{
			out.print(name);	
		}
                  %>
                  <br>
                  <fieldset name="Output of the fieldSet">		
                  <legend>
				<B>SQL Injection Find Example, </b> </B>
				
			</legend>
                  <form id="form" method="post" action="Controller">
                  <input type="hidden" name="action" value="findByName">
			<br>
			Find UserName:<input type="text" size=50 name="username" value="admin" /><br/>
            
		    <input type="submit" value="Click To Find" />
			 <br>
			 </form>
			 
			 
			 	<fieldset name="Output of the fieldSet">
			 	
			 	<%
			 	List list =  (List)request.getAttribute("sqlInection");
			 	
			 	if(list!=null && !list.isEmpty())
			 		
			 	{
			 		for(int i=0;i<list.size();i++){
			 			
			 			%>
			 			<b>User Name </b>
			 			<%
			 		    out.println(list.get(i));
			 			
			 		}
			 	}
			 	
			 	%>
			 	
			 		
			 	</fieldset>
			 
			 			 		
 <fieldset>
 
 </fieldset>

			 </fieldset>
			
	</fieldset>
</div>


	
<div class="lefttop"> </div>

<%@include file="left.jsp" %>

</div>

</body>
</html>