<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="addrbook.css" type="text/css"
	media="screen" />
</head>
<body>
	<h3>상품등록화면(productForm.jsp)</h3>
	<form name="frm1" method="post" action="productControl.jsp">
		<input type="hidden" name="action" value="insert">
		<table border="1" style="width: 800px">
			<tr>
				<th>상품명</th>
				<td><input type="text" name="product_name" /></td>
			</tr>
			<tr>
				<th>상품가격</th>
				<td><input type="text" name="product_price" /></td>
			</tr>
			<tr>
				<th>상품내용</th>
				<td><input type="text" name="product_cont" /></td>
			</tr>
			<tr>
				<th>상품이미지</th>
				<td><input type="text" name="product_img" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="저장" />
					<input type="reset" value="취소" /></td>
		</table>
	</form>
</body>
</html>