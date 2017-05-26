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
		String answer = "NOTFORM"; // 초기값 == 형식에 맞지 않음
			String ID = request.getParameter("ID");

			String filePath = application.getRealPath("IDDataBase//") + "\\";
			File file = new File(filePath);
			File[] files = file.listFiles();

			String regExp = "^[a-zA-Z0-9_]{6,10}$";
			Pattern pattern = Pattern.compile(regExp);
			Matcher matcher = pattern.matcher(ID);
			boolean checking = matcher.find();
			System.out.println("filePath: " + filePath);
			System.out.println(checking);
			if (checking) {
			answer = "POSSIBLE";
			for (int i = 0; i < files.length; i++) {
				if (files[i].getName().equals(ID + ".txt")) {
					answer = "DUPLICATION";
					break;
				}
				System.out.println(i + "번째 파일: " + files[i].getName());
			}
		}
		PrintWriter printWriter = response.getWriter();
		printWriter.print(answer);
		printWriter.flush();
		printWriter.close();
	%>
</body>
</html>