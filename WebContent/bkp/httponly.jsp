<!DOCTYPE html>
<html>
<head>
<title>HttpOnly Flag</title>
<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>
<meta name="description" content="owsap,commandinjection,AI injection,XSS">
<meta name="keywords" content="ls,rm,netstat,owsap,commandinjection,AI injection,XSS,httponly,sqlinjection,xss,csrf,httpOnly">
<%@ include file="include_css.jsp" %> 

<script type="text/javascript">


function httpOnlyCookie() {
 document.cookie = "";
 alert(document.cookie);
}

</script>
</head>
<body>

<div id="page">
<%@ include file="include.jsp"%>

	<div id="loading" style="display: none;">
		<img src="css/images/712.GIF" alt="" />Loading!
	</div>
	<article id="contentWrapper" role="main">
	
			<section id="content">



	<form id="form">
		<input type="hidden" name="filename" id="filename"
			value="/temp.txt">
		<fieldset name="Execute Command Online">
			<legend>
				<B>Http Only Cookie</B>
			</legend>
			
			<input TYPE=BUTTON OnClick="normalCookie();" VALUE="Display  Cookie">
			<INPUT TYPE=BUTTON OnClick="httpOnlyCookie();" VALUE="Display httpOnly Cookie">
		</fieldset>
		<div id="output"></div>
	</form>
		</section>
		</article>
		
	</div>
</body>
</html>