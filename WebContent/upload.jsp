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

<h1>Unrestrcited file upload</h1>

<p>
If the the server supports file upload feature,the remote attacker he can trick the file upload feature and upload virus,malware, or just 
keep uploading the file and make the disk full.
</p>



	<form id="form" method="post" action="/UploadServlet">
		<fieldset name="Unrestrcited FIle Upload">
			<legend>
				<B>Unrestricted File Upload</B>
			</legend>
			<br>
			Select a file to upload::<input type="file" name="file"  size="50" /><br/>
            
			 <input type="submit" value="UploadFile" />
			 <br>
		</fieldset>
		<div id="output"></div>
		
		
		
	</form>
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