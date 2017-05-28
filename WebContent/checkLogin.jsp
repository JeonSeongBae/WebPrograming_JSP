<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>checkLogin_로그인 확인</title>
</head>
<body>
	<%
		// 각각의 정보를 받아옴
		String answer = "NOMATCH";
		String fileName = request.getParameter("ID") + ".txt";
		String Password = request.getParameter("Password");
		try {
			String filePath = application.getRealPath("WEB-INF/IDDataBase_certification/")+"\\"; // 불러올 위치
			File file = new File(filePath);
			File[] files = file.listFiles();
			FileReader fileReader = new FileReader(filePath + fileName); //파일읽기객체생성
			BufferedReader bufferedReader = new BufferedReader(fileReader); //버퍼리더객체생성
			for (int i = 0; files != null && i < files.length; i++) {
				if (files[i].getName().equals(fileName)) { // 일치하는 파일을 찾았을 경우
					if (Password.equals(bufferedReader.readLine())) {
						answer = "MATCH";
					}
				}
			}
		} catch (Exception e) {
			answer = "NOTEXIST"; // 인증받지 않았거나 아이디가 존재하지 않음
		}
		// 응답을 전해줄 객체를 생성하여 전해줌
		PrintWriter printWriter = response.getWriter();
		printWriter.print(answer);
		printWriter.flush();
		printWriter.close();
	%>
</body>
</html>