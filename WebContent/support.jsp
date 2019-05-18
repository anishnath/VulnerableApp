<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>


<%@include file="head.jsp" %>
<%@include file="/js/googletracking.js" %>

<title>The Vulnerable Web Application</title>

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1668399950109875',
      xfbml      : true,
      version    : 'v2.5'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>

</head>
<body>

<div id="wrap">

<%@include file="top.jsp" %>

<div id="content">

<div class="right">

<h1>Your Support Needed</h1>

<p>
Vulnerable Web Application is available for all the white hat hacker who want to gain expertise in Web Application Security, by covering owsap top 10 and many more practical example 
Support This Application, to bring more example (LDAP Injection,SSL Poddles,Heartbleed,Appserver vulnerabilty,Scanners,nmap,ZenMAP,CVE Tester)<br>
Currently this is running on Server Which billed every Month Your contribution Will help this website Keep and running <br>
	The Contribution will bring more practical Examples which will eventually enhance your skill on the Practical security Learning
</p>

<p>

To Support you can also Share Like in Facebook

</p>




</div>

<div class="lefttop"> </div>

<%@include file="left.jsp" %>

</div>

</body>
</html>
