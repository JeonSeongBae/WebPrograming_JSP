<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<%
		// 각각의 정보를 받아옴
		String answer = "";
		String ID = request.getParameter("ID");
		String fileName = ID + ".txt"; // 파일 이름
		String filePath = application.getRealPath("WEB-INF/IDDataBase/") + "\\"; // 불러올 위치
		File file = new File(filePath);
		File[] files = file.listFiles();
		try {
			for (int i = 0; i < files.length; i++) {
				if (files[i].getName().equals(ID + ".txt")) {//그 디렉토리에 있는 파일 중 전달받은 id와 같은 이름의 파일이 있을 경우
					File tempFile = files[i];
					File newfile = new File(application.getRealPath("/WEB-INF/IDDataBase_certification/" + ID + ".txt"));
					tempFile.renameTo(newfile);
				}
			}
		}
		catch (Exception e) {
			answer = "FAIL";
		} finally {
			PrintWriter printWriter = response.getWriter();
			printWriter.print(answer);
			printWriter.flush();
			printWriter.close();
		}
	%>

</body>
</html>