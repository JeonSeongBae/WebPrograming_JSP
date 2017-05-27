<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.regex.Matcher"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String answer = ""; // 초기값 == 형식에 맞지 않음
		String ID = request.getParameter("ID");

		String filePath = application.getRealPath("IDDataBase//") + "\\";
		File file = new File(filePath);
		File[] files = file.listFiles();

		String checkName = "^[a-zA-Z0-9_]{6,10}$";
		Pattern pattern = Pattern.compile(checkName);
		Matcher matcher = pattern.matcher(ID);
		if (matcher.find()) { // ID 형식을 확인함
			answer = "POSSIBLE";
			for (int i = 0; files != null && i < files.length; i++) {
				if (files[i].getName().equals(ID + ".txt")) { // 중복된 아이디가 있는지 확인
					answer = "DUPLICATION";
					break;
				}
			}
		}
		PrintWriter printWriter = response.getWriter();
		printWriter.print(answer);
		printWriter.flush();
		printWriter.close();
	%>
</body>
</html>