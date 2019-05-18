
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<%@include file="head.jsp" %>
<%@include file="/js/googletracking.js" %>
<title>Click jacking X-Frame-Options header option Example</title>

</head>
<body>

<div id="wrap">

<%@include file="top.jsp" %>

<div id="content">

<div class="right">

<h1>Clickjacking(X-Frame-Options header option not set) </h1>

<p>ClickJacking Demo This type of attack occurs when a malicious site
tricks a user into clicking on a concealed element of another site which they
have loaded in a hidden frame or iframe.
</p>



	<form id="form" method="post">
		<input type="hidden" name="filename" id="filename"
			value="/temp.txt">
		<fieldset name="Clickjacking">
			<legend>
				<B>Click Jack Demo</B>
				<br>
			</legend>
			<input type="button" onclick="window.open('http://47.254.66.26/clickjack-another.jsp');" value="Click Here for Clickjack" /> <br>
		</fieldset>
		<div id="output"></div>
		
		
		
	</form>
	<br><br>
		<div id="output">
	<fieldset name="Output of the fieldSet">		
			
			<pre class="brush: js;">
			Preventing clickjacking
=======================
</p>>
Modern browsers honor the `X-Frame-Options`_ HTTP header that indicates whether
or not a resource is allowed to load within a frame or iframe. If the response
contains the header with a value of ``SAMEORIGIN`` then the browser will only
load the resource in a frame if the request originated from the same site. If
the header is set to ``DENY`` then the browser will block the resource from
loading in a frame no matter which site made the request.

<p>
Browsers that support X-Frame-Options
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</p>
* Internet Explorer 8+
* Firefox 3.6.9+
* Opera 10.5+
* Safari 4+
* Chrome 4.1+
                  
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
