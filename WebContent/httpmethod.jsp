<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<%@include file="head.jsp" %>
<%@include file="/js/googletracking.js" %>
<title>HTTP TRACE,TRACK Method Enabled</title>



</head>
<body>

<div id="wrap">

<%@include file="top.jsp" %>

<div id="content">

<div class="right">

<h1>HTTP TRACE,TRACK Method Enabled</h1>

<p>
By Doing Simple Curl remote attackers can Identify Which server is running, In the below Example we can see the sample server is running
on <b>express js </b> With HTTP Method Trace Enabled for More Information on HTTP Method Visit <a href="https://www.owasp.org/index.php/Test_HTTP_Methods_(OTG-CONFIG-006)">OWSAP HTTP</a>
</p>
<p>
If the remote Web server supports the TRACE and/or TRACK HTTP methods,
it make easier for remote attackers to steal cookies and authentication credentials
or bypass the HttpOnly protection mechanism
A TRACE returns the headers sent with the TRACE request to the client
</p>

<pre class="brush: js;">
curl -v -I  http://analytics-zariga.rhcloud.com 
</pre>

The  curl Output

<pre class="brush: js;">
* Rebuilt URL to: http://analytics-zariga.rhcloud.com/
*   Trying 52.90.151.114...
* Connected to analytics-zariga.rhcloud.com (52.90.151.114) port 80 (#0)
> HEAD / HTTP/1.1
> Host: analytics-zariga.rhcloud.com
> User-Agent: curl/7.43.0
> Accept: */*
> 
< HTTP/1.1 200 OK
< Date: Mon, 01 Feb 2016 17:59:56 GMT
< X-Powered-By: Express
< Content-Type: text/html
< Access-Control-Allow-Origin: *
< Access-Control-Allow-Methods: GET,DELETE,POST,TRACE,OPTIONS,PUT,HEAD
< Access-Control-Allow-Headers: Content-Type
< Access-Control-Max-Age: 86400
< Content-Length: 75354
< Vary: Accept-Encoding
</pre>
	
</div>

<div class="lefttop"> </div>

<%@include file="left.jsp" %>

</div>

</body>
</html>