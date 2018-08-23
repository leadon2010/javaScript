<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="employee.Employee"%>
<%@page import="employee.EmpDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
	String name = request.getParameter("name");
	Employee emp = new Employee();
	EmpDAO dao = new EmpDAO();
	List<Employee> list = new ArrayList<>();
	list = dao.getEmpList(name);
	for (Employee empl : list) {
		out.print("your info is " + empl.getFirstName() + ", " + empl.getLastName() + ", " + empl.getSalary() + "<br>");
	}
%>