<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script>
		window.onload = deptList;
		function deptList(){
			xhr = new XMLHTTPRequest();
			xhr.onreadystatechange = deptListCallback;
			xhr.open("GET", ./server)
		}		
	</script>
</head>
<body>
	<h3>부서등록</h3>
	<form>
		<input type="text" name="department_id" /> 
		<input type="text" name="department_name" /> 
		<input type="text" name="manager_id" /> 
		<input type="text" name="manager_id" /> 
		<input type="button" value="등록" onclick="deptIns()" />
	</form>

	<h3>부서목록</h3>
	<div id="result"></div>
</body>
</html>