
<!DOCTYPE html>
<html>
<head>
<title>Click Jacking Example</title>
<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>
<meta name="description" content="CSRF,Cr">
<meta name="keywords" content="ls,rm,netstat">
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
                            url: "CommandServlet", //this is my servlet
                
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
	command.contains("mv")
			<section id="content">
	<form id="form" method="POST">
		<input type="hidden" name="methodName" id="methodName"
			value="EXECUTECOMMAND">
		<fieldset name="Execute Command Online">
			<legend>
				<B>CSRF</B>
				
				A Cross-site request forgery hole is when a malicious site can cause a visitor's browser to make a request to your server<br> that causes a change on the server. The server thinks that because the request comes with the user's cookies, the user wanted to submit that form.

				
			</legend>

			<br>
			<input type="button" onclick="window.open('http://analytics-zariga.rhcloud.com/csrf');" value="Click Here for CSRF" /> <br>
		</fieldset>
		<div id="output"></div>
	</form>
		</section>
		</article>
		
	</div>
</body>
</html>