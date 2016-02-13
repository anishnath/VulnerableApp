<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<%@include file="head.jsp" %>
<%@include file="/js/googletracking.js" %>
<title>Cross Site Scripting(XSS)</title>


<!-- Include one of jTable styles. -->
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"
	type="text/css" />
<!-- Include jTable script file. -->
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#StudentTableContainer').jtable({
			title : 'Students List',
			actions : {
				listAction : 'Controller?action=list',
				createAction : 'Controller?action=create',
				updateAction : 'Controller?action=update',
				deleteAction : 'Controller?action=delete'
			},
			fields : {
				studentId : {
					title : 'Student Id',
					width : '30%',
					key : true,
					list : true,
					edit : false,
					create : false
				},
				name : {
					title : 'Name',
					width : '30%',
					edit : true
				},
				department : {
					title : 'Department',
					width : '30%',
					edit : true
				},
				emailId : {
					title : 'Email',
					width : '20%',
					edit : true
				}
			}
		});
		$('#StudentTableContainer').jtable('load');
	});
</script>


</head>
<body>

<div id="wrap">

<%@include file="top.jsp" %>

<div id="content">

<div class="right">

<h1>Cross Site Scripting(XSS)</h1>

<p>
In this type of attack, a remote hacker will try to inject a java scripts using HTTP GET or HTTP POST method,which when rendered in the 
page load's, expolit's the page
</p>

<pre class="brush: js;">
//Cross Site Scripting Example Add the following in email field
> <script>alert(4)</script>
//Example 2 Add this in Name filed and Save
<<script>alert("xss");//<</script>
</pre>

		
	<fieldset name="Output of the fieldSet">		

		<h4>Create the Student</h4>
		<div id="StudentTableContainer"></div>
			
	</fieldset>		
		
	

	
	</form>


</div>

<div class="lefttop"> </div>

<%@include file="left.jsp" %>

</div>

</body>
</html>