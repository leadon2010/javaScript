<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String uri = request.getContextPath(); %>
<!DOCTYPE html>
<html>

<head>
	<style>
		table {
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}

		td,
		th {
			border: 1px solid #dddddd;
			text-align: left;
			padding: 8px;
		}

		tr:nth-child(even) {
			background-color: #dddddd;
		}
	</style>
	<meta charset="UTF-8">
	<title>Employees list</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function () {
			$.ajax({
				url: "<%=uri%>/EmpServlet",
				data: "action=list",
				dataType: "json",
				success: function (result) {
					//var data = JSON.parse(result);
					var data = result;
					console.log(data);
					var $tag = "<table border=1><caption>:::: Employee Lists ::::</caption>";
					$tag += "<tr><th>index</th><th>Name</th><th>Salary</th></tr>";
					for (var i = 0; i < data.datas.length; i++) {
						$tag += "<tr><td>" + (i + 1) + "</td><td>" + data.datas[i].firstName + "</td><td>" + data.datas[i].salary + "</td></tr>";
					}
					$tag += "</table>";
					$("#show").html($tag);
				},
				error: function (xhr, status, error) {
					console.log(error);
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