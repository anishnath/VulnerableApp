
<!DOCTYPE html>
<html>
<head>
<title>Click Jacking Example</title>
<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>
<meta name="description" content="The Clickjacking attack, X-Frame-Options">
<meta name="keywords" content="clickjacking,X-Frame-Options,sqlinjection,command injection,blind sql injection">
<meta name="robots" content="index,follow" />
<meta name="googlebot" content="index,follow" />
<meta name="resource-type" content="document" />
<meta name="classification" content="tools" />
<meta name="language" content="en" />
<%@ include file="include_css.jsp" %> 
<script type="text/javascript">
        $(document).ready(function() {
            $('#executeMethod').click(function (event)
            {
 			$('#form').delay(200).submit()
            });
                    
            $('#form').submit(function (event)
                    {
                    //	
                  $('#output').html('<img src="css/images/712.GIF"> loading...');
         			 event.preventDefault();
                        $.ajax({
                            type: "POST",
                            url: "LoginServlet", //this is my servlet
                
                           data: $("#form").serialize(),
                            success: function(msg){    
                            		    $('#output').empty();
                                     $('#output').append(msg);
                                     
                            }
                        }); 
                    });
        });
   
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
	<form id="form" method="POST">
		<input type="hidden" name="methodName" id="methodName"
			value="LOGIN">
		<fieldset name="Execute Command Online">
			<legend>
				<B>SQL Injection LOGIN Example</B>
			</legend>
			<br>
			UserName:<input type="text" name="username" value="admin" /><br/>
            Password:<input type="password" name="pass" value="admin"/><br/>
			 <input type="submit" value="Click To Login" />
			 <br>
		</fieldset>
		<div id="output"></div>
	</form>
		</section>
		</article>
		
	</div>
</body>
</html>


<!-- <html>
    <head>
    <meta name="google-site-verification" content="OUSAhTeh3pKSSwkrFtBsHkfe4i_sF_oM_DGi8Qq6PTM" />
        <title>Vulnerable Web Application login form</title>
    </head>
    <body>
        <form method="post" action="LoginServlet">
        UserName:<input type="text" name="username" /><br/>
        Password:<input type="password" name="pass" /><br/>
        <input type="submit" value="login" />
        </form>
    </body>
</html> -->