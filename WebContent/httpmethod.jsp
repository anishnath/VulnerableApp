<!DOCTYPE html>
<html>
<head>
<title>Command Injection Examples</title>
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

By Doing Simple Curl We can Identify Which server is running, In the below Example we can see the sample server is running
on <b>express js </b> With HTTP Method Trace Enabled for More Information on HTTP Method Visit <a href="https://www.owasp.org/index.php/Test_HTTP_Methods_(OTG-CONFIG-006)">OWSAP HTTP</a>
<pre class="brush: js;">
curl -v -I  http://analytics-zariga.rhcloud.com 
</pre>

The OUTOUT of the curl

<pre class="brush: js;">
* Rebuilt URL to: http://analytics-zariga.rhcloud.com/
*   Trying 52.90.151.114...
* Connected to analytics-zariga.rhcloud.com (52.90.151.114) port 80 (#0)
> HEAD / HTTP/1.1
> Host: analytics-zariga.rhcloud.com
> User-Agent: curl/7.43.0
> Accept: */*
> 
< HTTP/1.1 200 OK
HTTP/1.1 200 OK
< Date: Mon, 01 Feb 2016 17:59:56 GMT
Date: Mon, 01 Feb 2016 17:59:56 GMT
< X-Powered-By: Express
X-Powered-By: Express
< Content-Type: text/html
Content-Type: text/html
< Access-Control-Allow-Origin: *
Access-Control-Allow-Origin: *
< Access-Control-Allow-Methods: GET,DELETE,POST,TRACE,OPTIONS,PUT,HEAD
Access-Control-Allow-Methods: GET,DELETE,POST,TRACE,OPTIONS,PUT,HEAD
< Access-Control-Allow-Headers: Content-Type
Access-Control-Allow-Headers: Content-Type
< Access-Control-Max-Age: 86400
Access-Control-Max-Age: 86400
< Content-Length: 75354
Content-Length: 75354
< Vary: Accept-Encoding
Vary: Accept-Encoding
</pre>
		</section>
		</article>

	</div>
</body>
</html>