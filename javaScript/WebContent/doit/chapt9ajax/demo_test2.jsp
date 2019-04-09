<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %>
<%
	String name = request.getParameter("name");
	String city = request.getParameter("city");
	
	//out.println("name : " + name + ", city : " + city);
	out.println("{\"datas\":[{\"firstName\":\"firstname1\",\"lastName\":\"last1\",\"age\":\"30\"},");
	out.println("{\"firstName\":\"firstname2\",\"lastName\":\"last2\",\"age\":\"40\"},");
	out.println("{\"firstName\":\"firstname3\",\"lastName\":\"last3\",\"age\":\"50\"},");
	out.println("{\"firstName\":\"firstname4\",\"lastName\":\"last4\",\"age\":\"60\"},");
	out.println("{\"firstName\":\"firstname5\",\"lastName\":\"last5\",\"age\":\"70\"}]}");
%>