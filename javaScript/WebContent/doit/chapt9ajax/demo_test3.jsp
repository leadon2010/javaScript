<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="employee.EmpDAO"%>
<%@page import="employee.Employee"%>
<%@page import="java.util.List"%>
<%
	String name = request.getParameter("name");
	String city = request.getParameter("city");
	EmpDAO dao = new EmpDAO();
	List<Employee> list = dao.getEmplsList();

	//out.println("name : " + name + ", city : " + city);
	out.println("{\"datas\":[");
	for (Employee emp : list) {
		out.println("{\"firstName\":\"" + emp.getFirstName() + "\",\"lastName\":\"" + emp.getLastName()
				+ "\",\"age\":\"" + emp.getSalary() + "\"},");
	};
	out.println("]}");
%>