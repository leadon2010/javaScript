<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="prodDAO" class="product.ProductDAO"></jsp:useBean>
<jsp:useBean id="prod" class="product.Product"></jsp:useBean>
<jsp:setProperty property="*" name="prod" />
<%
	String action = request.getParameter("action");

	if (action.equals("") || action == null) {
		pageContext.forward("productControl.jsp?action=list");

	} else if (action.equals("insert")) {
		prodDAO.insertProd(prod);
		response.sendRedirect("productControl.jsp?action=list");

	} else if (action.equals("getOne")) {
		request.setAttribute("pr", prodDAO.getProdcutOne(prod.getProductId()));
		pageContext.forward("productShow.jsp");

	} else if (action.equals("list")) {
		request.setAttribute("datas", prodDAO.getProductList());
		request.getRequestDispatcher("productList.jsp").forward(request, response);

	}
%>