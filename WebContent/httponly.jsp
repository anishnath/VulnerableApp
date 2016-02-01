<!DOCTYPE html>
<html>
<head>
<title>Command Injection Examples</title>
<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>
<meta name="description" content="owsap,commandinjection,AI injection,XSS">
<meta name="keywords" content="ls,rm,netstat,owsap,commandinjection,AI injection,XSS,httponly,sqlinjection,xss,csrf">
<%@ include file="include_css.jsp" %> 

<script type="text/javascript">

function normalCookie() {
 document.cookie = "TheCookieName=CookieValue_httpOnly";
 alert(document.cookie);
}
function httpOnlyCookie() {
 document.cookie = "TheCookieName=CookieValue_httpOnly; httpOnly";
 alert(document.cookie);
}

</script>
</head>
<body>

<div id="page">

	<div id="loading" style="display: none;">
		<img src="css/images/712.GIF" alt="" />Loading!
	</div>
	<article id="contentWrapper" role="main">
	<%@ include file="Intro.jsp" %> 
			<section id="content">



	<form id="form">
		<input type="hidden" name="filename" id="filename"
			value="/temp.txt">
		<fieldset name="Execute Command Online">
			<legend>
				<B>Command Injection Example with File DOwnload</B>
			</legend>
			
			<input TYPE=BUTTON OnClick="normalCookie();" VALUE="Display Normal Cookie">
			<INPUT TYPE=BUTTON OnClick="httpOnlyCookie();" VALUE="Display HTTPONLY Cookie">
		</fieldset>
		<div id="output"></div>
	</form>
		</section>
		</article>
		
	</div>
</body>
</html>