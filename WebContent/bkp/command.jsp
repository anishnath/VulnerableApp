
<!DOCTYPE html>
<html>
<head>
<title>Command Injection Example</title>
<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>
<meta name="description" content="The Clickjacking attack, X-Frame-Options">
<meta name="keywords" content="clickjacking,X-Frame-Options,sqlinjection,command injection,blind sql injection,command Injection">
<%@ include file="include_css.jsp" %> 
<%@ include file="include_scripthighighlight.jsp"%>
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
				<B>Ping Statistics</B>
			</legend>
			<pre class="brush: js;">
			Without Command Execution
			</pre>
			Ping<input id="inputtext" type="text" name="text" readonly="readonly" value="ping -c4 google.com" size="50">
			<input type="button" id="executeMethod" name="executeMethod"
				value="Ping Statistics"> <br>
		</fieldset>
		<div id="output">

		

		
		</div>
	

	
	</form>
		</section>
		</article>
		
	</div>
</body>
</html>