<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="addrDAO" class="addrbook.AddrBookDAO"></jsp:useBean>
<jsp:useBean id="addrbook" class="addrbook.AddrBook"></jsp:useBean>
<jsp:setProperty property="*" name="addrbook" />
<%
	String action = request.getParameter("action");

	if (action == null) {
		//out.print("no action");
		pageContext.forward("addrbook_control.jsp?action=list");

	} else if (action.equals("list")) {
		//전체목록을 조회해서 list 뷰페이지로 이동
		addrDAO.getDBList();
		request.setAttribute("datas", addrDAO.getDBList());
		//pageContext.forward("addrbook_list.jsp";)
		request.getRequestDispatcher("addrbook_list.jsp").forward(request, response);

	} else if (action.equals("insert")) {
		addrDAO.insertDB(addrbook);
		response.sendRedirect("addrbook_control.jsp?action=list");

	} else if (action.equals("edit")) {
		String passwd = request.getParameter("upasswd");
		if (passwd.equals("1111")) {
			request.setAttribute("ab", addrDAO.getDB(addrbook.getAb_id()));
			pageContext.forward("addrbook_edit_form.jsp");
		} else {
			out.print("<script>alert('passwd error');history.go(-1);</script>");
		}

	} else if (action.equals("show")) {
			request.setAttribute("ab", addrDAO.getDB(addrbook.getAb_id()));
			pageContext.forward("addrbook_show_form.jsp");

	} else if (action.equals("update")) {
		addrDAO.updateDB(addrbook);
		response.sendRedirect("addrbook_control.jsp?action=list");

	} else if (action.equals("delete")) {
		addrDAO.deleteDB(addrbook.getAb_id());
		response.sendRedirect("addrbook_control.jsp?action=list");

	} else {
		out.print("알 수 없는 action 입니다.");
	}
%>