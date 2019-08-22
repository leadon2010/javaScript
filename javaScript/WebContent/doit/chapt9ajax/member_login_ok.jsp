<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="employee.SEmpDAO"%>
<%
	String userId = request.getParameter("user_id");
	String userPw = request.getParameter("user_pw");
	SEmpDAO dao = new SEmpDAO();
	String retInfo = dao.getUserInfo(userId, userPw);
	out.println("{\"username\":\"" + retInfo + "\"}");
%>