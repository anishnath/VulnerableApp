<!DOCTYPE html>
<html>
<head>
<title>Command Injection Examples</title>
<%@ include file="include_scripthighighlight.jsp"%>
<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>
<meta name="description" content="owsap,commandinjection,AI injection,XSS">
<meta name="keywords" content="ls,rm,netstat,owsap,commandinjection,AI injection,XSS">
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
<%@ include file="include.jsp"%>
	<div id="loading" style="display: none;">
		<img src="css/images/712.GIF" alt="" />Loading!
	</div>
	<article id="contentWrapper" role="main">
	
			<section id="content">



	<form id="form" method="POST">
		<input type="hidden" name="filename" id="filename"
			value="/temp.txt">
		<fieldset name="Execute Command Online">
			<legend>
				<B>Command Injection Example with File DOwnload</B>
			</legend>
			Click the button to Download
			<input type="button" id="executeMethod" name="executeMethod"
				value="Click"> <br>
		</fieldset>
		<div id="output"></div>
		
		
		
	</form>
		</section>
		</article>
		
	</div>
</body>
</html>