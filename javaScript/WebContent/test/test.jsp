<!DOCTYPE html>
<html>

<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btn").on("click", function() {
			$("#result").append("<br>", $("input").val());
			$("input").val("").focus();
		});

		$("input").on("keydown", function(e) {
			if (e.which == 13) {
				$("#result").append("<br>", $("input").val());
				$("input").val("").focus();
			}
		})
	});
</script>
</head>

<body>

	<input type="text" value="text" />
	<button id="btn">Click</button>
	<div id="result">Here</div>
	<br>

</body>

</html>