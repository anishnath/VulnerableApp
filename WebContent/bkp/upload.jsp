
<!DOCTYPE html>
<html>
<head>
<title>Un Restricted File Upload Example</title>
<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>
<meta name="description" content="The Clickjacking attack, X-Frame-Options">
<meta name="keywords" content="clickjacking,X-Frame-Options,sqlinjection,command injection,blind sql injection,owsap top 10">
<meta name="robots" content="index,follow" />
<meta name="googlebot" content="index,follow" />
<meta name="resource-type" content="document" />
<meta name="classification" content="tools" />
<meta name="language" content="en" />
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
                            url: "UploadServlet", //this is my servlet
                
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
	<form id="form" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="methodName" id="methodName"
			value="LOGIN">
		<fieldset name="Execute Command Online">
		
		
			<legend>
				<B>File Upload:</B>
			</legend>
			<br>
			Select a file to upload::<input type="file" name="file"  size="50" /><br/>
            
			 <input type="submit" value="UploadFile" />
			 <br>
		</fieldset>
		<div id="output">
		 </div>
    
    
	</form>
		</section>
		</article>

	</div>
			
</body>
</html>





<%-- <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vulnerable Web Application</title>
</head>
<body>
<a href="main.jsp">Home</a>
<h3>File Upload:</h3>
Select a file to upload: <br />
<form action="UploadServlet" method="post"
                        enctype="multipart/form-data">
<input type="file" name="file" size="50" />
<br />
<input type="submit" value="Upload File" />
</form>
</body>
</html> --%>