<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>CSS Template</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
	background-color: #666;
	padding: 30px;
	text-align: center;
	font-size: 35px;
	color: white;
}

/* Create two columns/boxes that floats next to each other */
nav {
	float: left;
	width: 25%;
	height: 300px; /* only for demonstration, should be removed */
	background: #ccc;
	padding: 20px;
}

/* Style the list inside the menu */
nav ul {
	list-style-type: none;
	padding: 0;
}

article {
	float: left;
	padding: 20px;
	width: 60%;
	background-color: #f1f1f1;
	height: 300px; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section:after {
	content: "";
	display: table;
	clear: both;
}

/* Style the footer */
footer {
	background-color: #777;
	padding: 10px;
	text-align: center;
	color: white;
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media ( max-width : 600px) {
	nav, article {
		width: 100%;
		height: auto;
	}
}

.center {
	display: "block";
	margin-left: auto;
	margin-right: auto;
	width: 20%;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
	$(function() {
		$("#receipt_btn").on("click", function() {
			console.log($("#receipt_table [name=item_code]").val())
		})
	})
</script>
</head>
<body>

	<header>
		<h2>입고 관리 화면</h2>
	</header>

	<section>
		<nav>
			<ul>
				<li><a href="receipt.jsp">입고관리화면</a></li>
				<li><a href="issue.jsp">출고관리화면</a></li>
				<li><a href="onhand.jsp">재고조회화면</a></li>
			</ul>
		</nav>

		<article>
			<h1>입고</h1>
			<table border='1' id="receipt_table">
				<tr>
					<th>상품코드</th>
					<th>주문수량</th>
					<th>구입단가</th>
					<th>판매가</th>
					<th>창고</th>
					<th></th>
				</tr>
				<tr>
					<td><input type="text" name="item_code" /></td>
					<td><input type="text" name="receipt_qty" /></td>
					<td><input type="text" name="receipt_price" /></td>
					<td><input type="text" name="sale_price" /></td>
					<td><input type="text" name="receipt_sub" /></td>
					<td><input type="button" value="입고" id="receipt_btn" /></td>
				</tr>
			</table>
			<p>
			<p>
			<div id="receipt_no">주문번호#</div>
			<form id="receipt_frm" action="">
				<table border='1' id="receipt_list">
					<tr>
						<td>품명코드</td>
						<td>입고단가</td>
						<td>입고수량</td>
						<td>판매단가</td>
						<td>입고금액</td>
						<td>입고창고</td>
						<td>구매업체</td>
					</tr>
				</table>
				<p>
				<p>
				<div class="center">
					<input type="submit" value="주문정보생성" />
				</div>
			</form>
		</article>
	</section>

	<footer>
		<p>Footer</p>
	</footer>

</body>
</html>
