<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>Cross Site Example Creating the student</title>
<!-- Include one of jTable styles. -->
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"
	type="text/css" />
<!-- Include jTable script file. -->
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#StudentTableContainer').jtable({
			title : 'Students List',
			actions : {
				listAction : 'Controller?action=list',
				createAction : 'Controller?action=create',
				updateAction : 'Controller?action=update',
				deleteAction : 'Controller?action=delete'
			},
			fields : {
				studentId : {
					title : 'Student Id',
					width : '30%',
					key : true,
					list : true,
					edit : false,
					create : false
				},
				name : {
					title : 'Name',
					width : '30%',
					edit : true
				},
				department : {
					title : 'Department',
					width : '30%',
					edit : true
				},
				emailId : {
					title : 'Email',
					width : '20%',
					edit : true
				}
			}
		});
		$('#StudentTableContainer').jtable('load');
	});
</script>


</head>
<body>

	<section id="body" class="width">
		<%@ include file="left.jsp"%>
		<section id="content" class="column-right">

			<article>




				<h4>Create the Student</h4>
				<div id="StudentTableContainer"></div>
				</div>
			</article>
			<%@ include file="footer.jsp"%>

		</section>



	</section>

</body>
</html>