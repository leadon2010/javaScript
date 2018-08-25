<%@page import="ch08.DeptVO"%>
<%@page import="ch08.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	DeptDAO dao = new DeptDAO();
	DeptVO vo = new DeptVO();
	String v_dept_id = request.getParameter("department_id");
	vo = dao.getDept(v_dept_id);
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script>
	function updateDept() {

		document.frm.href = "updateForm.jsp";
	}
</script>
</head>
<body>
	<h3>부서상세정보</h3>
	<a href="deptControl.jsp?action=list">부서목록으로가기</a>
	<br>
	<form name="frm" action="deptControl.jsp" method="post">
		<input type="hidden" name="action" value="update">
		<table border="1">
			<tr>
				<td>부서번호</td>
				<td><input type="text" name="department_id"
					value="<%=vo.getDepartment_id()%>"></td>
			</tr>
			<tr>
				<td>부서명</td>
				<td><input type="text" name="department_name"
					value="<%=vo.getDepartment_name()%>" /></td>
			</tr>
			<tr>
				<td>매니저</td>
				<td><input type="hidden" value="<%=vo.getManager_id()%>"><%=vo.getManager_name()%></td>
			</tr>
			<tr>
				<td>지역명</td>
				<td><input type="hidden" value="<%=vo.getLocation_id()%>"><%=vo.getLocation_name()%></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="변경" /></td>
			</tr>
		</table>
	</form>
</body>
</html>