<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>
	<h1>File List</h1>
	<%
		String path = "/home/ubie/Dev/git/javaScript/javaScript/WebContent";
		File temp = new File(path);
		File[] fileList = temp.listFiles();
		if (fileList.length > 0) {
			for (File file : fileList) {
				System.out.println(file.getName());
				if (file.isDirectory()) {
					out.println("<h3>" + file.getName() + "</h3>");
					String addPath = path + "/" + file.getName();
					File addTemp = new File(addPath);
					File[] addList = addTemp.listFiles();
					for (File addFile : addList) {
						String fullPath = file.getName() + "/" + addFile.getName();
						if (addFile.getName().indexOf("html") != -1) {
							System.out.println("  " + addFile.getName());
							out.println("<a href=\"" + fullPath + "\">" + addFile.getName() + "</a><br>");
						} else if (addFile.getName().indexOf("jsp") != -1) {
							System.out.println("  " + addFile.getName());
							out.println("<a href=\"" + fullPath + "\">" + addFile.getName() + "</a><br>");
						}
					}
				}
	
			}
		} else {
			System.out.println("no list");
		}
	%>
</body>

</html>