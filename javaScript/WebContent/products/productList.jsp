<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품록록보기</title>
<link rel="stylesheet" href="addrbook.css" type="text/css"
	media="screen" />
</head>
<body>
	<h3>상품목록(productList.jsp)</h3>
	<h4>
		<a href="productForm.jsp">상품등록</a>
	</h4>
	<table border="1">
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>상품가격</th>
			<th>상품이미지</th>
			<th>상품설명</th>
		</tr>
		<c:forEach items="${datas}" var="i">
			<tr>
				<td>${i.getProductId()}</td>
				<td>${i.getProductName() }</td>
				<td>${i.getProductPrice() }</td>
				<td>${i.productImg }</td>
				<td>${i.getProductCont() }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>