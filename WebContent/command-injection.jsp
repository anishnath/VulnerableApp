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

<h1>Command Injection Example File Download</h1>

<p>
If the the server supports file download feature,the remote attacker he can trick the file name using the HTTP POST or
HTTP GET method to get some other file which can reveal sensitive information, the below example shows how a file is getting 
downlaoded by altering the file name the server starts returning thoose file information
</p>



	<form id="form" method="post" action="/DownloadServlet">
		<input type="hidden" name="filename" id="filename"
			value="/temp.txt">
		<fieldset name="File Download Example">
			<legend>
				<B>Command Injection Example with File DOwnload</B>
			</legend>
			Click the button to Download
			<input type="submit" id="executeMethod" name="executeMethod"
				value="Click"> <br>
		</fieldset>
		<div id="output"></div>
		
		
		
	</form>
		<div id="output">
	<fieldset name="Output of the fieldSet">		
			<%String name=(String)request.getAttribute("name");
			
			System.out.println("name -- >" +name);
		
		if(name!=null)
		{
			out.print(name);	
		}
                  %>
                  
                  <hr>
Changing the file Information Trying to See whats in <b>"/etc/hosts"</b>		
<pre class="brush: js;">
curl 'http://zariga.com/DownloadServlet' --data 'filename=%2F/etc/hosts'
</pre>
<hr>
<p> The above command executed successfully and user is able to see the contnet, 
a remote attacker can take advantage and can reveal 
sensitive information from the server
<pre class="brush: js;">
Mitigation of Command Execution required a proper test case coverage, so that only file 
is getting downloaded and for rest it should fails
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