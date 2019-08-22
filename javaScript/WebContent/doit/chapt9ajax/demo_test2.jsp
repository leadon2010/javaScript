<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="employee.SEmpDAO"%>
<%@page import="employee.SEmployee"%>
<%@page import="java.util.List"%>
<%
	String name = request.getParameter("name");
	String city = request.getParameter("city");
	SEmpDAO dao = new SEmpDAO();
	List<SEmployee> list = dao.getEmplsList();
	System.out.println(list.size());
	int i = 0;
	//out.println("name : " + name + ", city : " + city);
	out.println("{\"datas\":[");
	for (SEmployee emp : list) {
		i++;
		out.println("{\"firstName\":\"" + emp.getFirstName() + "\",\"lastName\":\"" + emp.getLastName() + "\",\"age\":\"" + emp.getSalary() + "\"}");
		if (i != list.size())
	out.println(",");
	};
	out.println("]}");
%>