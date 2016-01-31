<!DOCTYPE html>
<html>
<head>
<title>Command Injection Examples</title>
<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>
<meta name="description" content="Run all the commands online">
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
                            url: "DownloadServlet", //this is my servlet
                
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
	<div id="loading" style="display: none;">
		<img src="css/images/712.GIF" alt="" />Loading!
	</div>
	<%@ include file="Intro.jsp" %> 
	   
	<article id="contentWrapper" role="main">
			<section id="content">




 Status Code: 200 OK
    Access-Control-Allow-Headers: Content-Type
    Access-Control-Allow-Methods: GET,DELETE,POST,<b>TRACE<b>,OPTIONS,PUT,HEAD
    Access-Control-Allow-Origin: *
    Access-Control-Max-Age: 86400
    Allow: GET, HEAD, POST, TRACE, OPTIONS


		</section>
		</article>

	</div>
</body>
</html>