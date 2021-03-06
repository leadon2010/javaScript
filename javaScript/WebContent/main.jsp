<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="file.FileExample" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>
	<h1>File List</h1>
	<%
		String osName = System.getProperty("user.name");
		String path = "/home/" + osName + "/git/javaScript/javaScript/WebContent";
		File temp = new File(path);
		File[] fileList = temp.listFiles();

		for (File file : FileExample.sortFileArray(fileList)) {

			if (file.isDirectory()) {
				out.println("<p>" + file.getName() + "</p>");
				String addPath = path + "/" + file.getName();
				File addTemp = new File(addPath);
				File[] addList = addTemp.listFiles();
				
				for (File addFile : FileExample.sortFileArray(addList)) {
					
					String fullPath = file.getName() + "/" + addFile.getName();
					if (addFile.isDirectory()) {
						out.println("<p>" + fullPath + "</p>");
						String dupPath = addPath + "/" + addFile.getName();
						File dupTemp = new File(dupPath);
						File[] dupList = dupTemp.listFiles();
						
						for (File dupFile : FileExample.sortFileArray(dupList)) {
							fullPath = file.getName() + "/" + addFile.getName() + "/" + dupFile.getName();
							if (dupFile.isDirectory()) {
								out.println("<p>" + fullPath + "</p>");
							} else if (dupFile.getName().indexOf("html") != -1 || dupFile.getName().indexOf("jsp") != -1) {
								out.println(".. .. <a href=\"" + fullPath + "\">" + dupFile.getName() + "</a><br>");
							}
						}
						
					} else if (addFile.getName().indexOf("html") != -1 || addFile.getName().indexOf("jsp") != -1) {
						out.println(".. <a href=\"" + fullPath + "\">" + addFile.getName() + "</a><br>");
					}

				}

			} // end of if directory

		} // end of for 
	%>
</body>

</html>