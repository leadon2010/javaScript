<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String uri = request.getContextPath(); %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Emplist</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function () {
			$.ajax({
				url: "<%=uri%>/EmpServlet?action=list",
				success: function (result) {
					var data = JSON.parse(result);
					console.log(data);
					var $tag = "<ul>";
					for (var i = 0; i < data.result.length; i++) {
						$tag += "<li>" + data.result[i].firstName;
					}
					$tag += "</ul>";
					document.getElementById("show").innerHTML = $tag;
				}
			})
		});
	</script>
</head>

<body>
	<h2>Employee List</h2>
	<hr>
	<div id="show"></div>
</body>

</html>