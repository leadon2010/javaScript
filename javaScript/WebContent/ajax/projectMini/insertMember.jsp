<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>insertMember</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script>
		$(function () {
			//getData();
			$("#btn").on("click", function () {
				var sendData = $("#frm").serialize();
				console.log(sendData);
				$.ajax({
					url: "<%=request.getContextPath()%>/MiniControl",
					type: "post",
					data: sendData,
					success: function () {
						console.log("sc")
					}
				})
			})
		})
		function getData() {
			$.ajax({
				url: "<%=request.getContextPath()%>/MiniControl",
				type: "get",
				data: $("#frm").serialize(),
				success: function () {
					console.log("success");
				}
			})
		}
	</script>
</head>

<body>
	<form id="frm">
		<input type="hidden" name="action" value="insert">
		<table border=1>
			<tr>
				<th>ID</th>
				<th>Passwd</th>
				<th>Name</th>
				<th>Phone</th>
				<th>Address</th>
			</tr>
			<tr>
				<td><input type="text" name="id" value="1234"></td>
				<td><input type="text" name="pw" value="1234"></td>
				<td><input type="text" name="uname" value="good"></td>
				<td><input type="text" name="phone" value="1111-1111"></td>
				<td><input type="text" name="address" value="Daejeon, Korea"></td>
				<td><button type="button" id="btn">Send</button></td>
			</tr>
		</table>
	</form>
</body>

</html>