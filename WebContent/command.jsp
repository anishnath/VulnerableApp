<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<%@include file="head.jsp" %>
<%@include file="/js/googletracking.js" %>
<title>Command Injection Example</title>

</head>
<body>

<div id="wrap">

<%@include file="top.jsp" %>

<div id="content">

<div class="right">

<h1>Command Injection Example</h1>

<p>
If the application supports commands to be executed, then the 
the remote attacker try to pass the command in the form POST method or GET request to check whether the application is vulnerable to <b>command injection</b> or not
</p>




	<form id="form"  method="post" action="/CommandServlet">
		<fieldset name="Execute Command Online">
			<legend>
				<B>Ping Statistics</B>
			</legend>
			Without Command Execution<br>
			<b></>Ping</b><input id="inputtext" type="text" name="text" readonly="readonly" value="ping -c1 google.com" size="50">
			<b><input type="submit" id="executeMethod" name="executeMethod"
				value="Ping Statistics"></input></b> <br>
		</fieldset>
		
		<div id="output">
	<fieldset name="Output of the fieldSet">		
			<%String name=(String)request.getAttribute("name");
		
		if(name!=null)
		{
			out.print(name);	
		}
                  %>
			
	</fieldset>		
		</div>
	

	
	</form>


</div>

<div class="lefttop"> </div>

<%@include file="left.jsp" %>

</div>

</body>
</html>
