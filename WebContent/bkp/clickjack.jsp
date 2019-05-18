
<!DOCTYPE html>
<html>
<head>
<title>Click Jacking Example</title>
<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>
<meta name="description" content="The Clickjacking attack, X-Frame-Options">
<meta name="keywords" content="clickjacking,X-Frame-Options">
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
			<section id="content">
	<form id="form" method="POST">
		<input type="hidden" name="methodName" id="methodName"
			value="EXECUTECOMMAND">
		<fieldset name="Execute Command Online">
			<legend>
				<B>Click Jack Example</B>
			</legend>
			ClickJacking Demo This type of attack occurs when a malicious site
tricks a user into clicking on a concealed element of another site which they
have loaded in a hidden frame or iframe.
			<br>
			<input type="button" onclick="window.open('http://analytics-zariga.rhcloud.com/clickjack');" value="Click Here for Clickjack" /> <br>
		</fieldset>
		<div id="output"></div>
	</form>
		</section>
		</article>
		
	</div>
</body>
</html>