<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<%@include file="head.jsp" %>
<title>HttpOnly Cookie Protection</title>

<script type="text/javascript">


function httpOnlyCookie() {
 document.cookie = "";
 alert(document.cookie);
}

</script>


</head>
<body>

<div id="wrap">

<%@include file="top.jsp" %>

<div id="content">

<div class="right">

<h1>HttpOnly Cookie Protection</h1>

<p>
HttpOnly cookies are not accessible from Http client,now the modern web browser is supporting 
HttpOnly flag, and it help in the following
<ul>
<li>HttpOnly restricts all access to document.cookie</li>
<li>HttpOnly can prevent in XSS attack</li>
</ul>
</p>

<pre class="brush: js;">
curl -v -I  http://curl -I -v http://zariga.com/HTTPOnly
</pre>

<hr>
and the  curl Output

<pre class="brush: js;">
* Connected to zariga (::1) port 80 (#0)
> HEAD /HTTPOnly HTTP/1.1
> Host: localhost:8090
> User-Agent: curl/7.43.0
> Accept: */*
> 
< HTTP/1.1 200 OK
HTTP/1.1 200 OK
< Server: Apache-Coyote/1.1
< SET-COOKIE: Vulnerable-Web-Application=https://goo.gl/3Bn35z;expires=Thu, 04-Feb-2016 18:18:08 
< Set-Cookie: JSESSIONID=BF8801B19B228ADDE035A103350FA7F9; Path=/; HttpOnly
< Content-Type: text/html;charset=UTF-8
< Content-Length: 9159
< Date: Thu, 04 Feb 2016 18:13:08 GMT
Date: Thu, 04 Feb 2016 18:13:08 GMT
</pre>

<INPUT TYPE=BUTTON OnClick="httpOnlyCookie();" VALUE="Display httpOnly Cookie">
	
</div>

<div class="lefttop"> </div>

<%@include file="left.jsp" %>

</div>

</body>
</html>