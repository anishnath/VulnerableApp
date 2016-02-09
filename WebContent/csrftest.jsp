
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<%@include file="head.jsp" %>
<title>Cross Site Request Forgery (CSRF)</title>

</head>
<body>

<div id="wrap">

<%@include file="top.jsp" %>

<div id="content">

<div class="right">

<h1>Cross Site Request Forgery (CSRF) </h1>

<p>A Cross-site request forgery hole is when a malicious site can cause a visitor's browser to make a request to your server<br>
 that causes a change on the server. The server thinks that because the request comes with the user's cookies, the user wanted to submit that form.

CSRF This type of attack occurs when a malicious Web site contains a link, a form button or some javascript that is intended to perform some action on your Web site, 
using the credentials of a logged-in user who visits the malicious site in their browser
</p>



	<form id="form" method="post">
		<input type="hidden" name="filename" id="filename"
			value="/temp.txt">
		<fieldset name="CSRF">
			<legend>
				<B>Click Jack Demo</B>
				<br>
			</legend>
			<br>
			<input type="button" onclick="window.open('http://analytics-zariga.rhcloud.com/csrf');" value="Click Here for CSRF" /> <br>
		</fieldset>
		<div id="output"></div>
		
		
		
	</form>
	<br><br>
		<div id="output">
	<fieldset name="Output of the fieldSet">		
			
			<pre class="brush: js;">
			Preventing CSRF
=======================
Develop POST Request for Application data
Generate CSRF Token
                  
 </pre>
			
	</fieldset>		
		</div>
	

	
	</form>


</div>

<div class="lefttop"> </div>

<%@include file="left.jsp" %>

</div>

</body>
</html>



