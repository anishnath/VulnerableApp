<link rel="stylesheet" type="text/css" href="css/sidebar.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="/js/googletracking.js"></script>
	<script>
	$(document).ready(function() {
		
		//GET BROWSER WINDOW HEIGHT
		var currHeight = $(window).height();
		$('#sidebar, #content').css('height', currHeight);
		
		//ON RESIZE OF WINDOW
		$(window).resize(function() {
			
			//GET NEW HEIGHT
			var currHeight = $(window).height();	
			//RESIZE BOTH ELEMENTS TO NEW HEIGHT
			$('#sidebar, #content').css('height', currHeight);
			
		});
		
	});
	</script>
