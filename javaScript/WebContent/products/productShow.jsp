<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />
<title>상품상세조회</title>
</head>
<body>
	<table>
		<tr>
			<th>상품번호</th>
			<td>${pr.productId}</td>
		</tr>
		<tr>
			<th>상품명</th>
			<td>${pr.productName}</td>
		</tr>
		<tr>
			<th>상품가격</th>
			<td>${pr.productPrice}</td>
		</tr>
		<tr>
			<th>상품이미지</th>
			<td>${pr.productImg}</td>
		</tr>
		<tr>
			<th>상품설명</th>
			<td>${pr.productCont}</td>
		</tr>
	</table>
</body>
</html>