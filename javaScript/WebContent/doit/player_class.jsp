<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="employee.SEmpDAO" %>
<%@page import="java.util.*" %>
<%@page import="net.sf.json.JSONArray" %>
<%
	SEmpDAO dao = new SEmpDAO();
	List<String> list = new ArrayList<>();
	list = dao.getEmailList();
	out.println(JSONArray.fromObject(list).toString());
%>