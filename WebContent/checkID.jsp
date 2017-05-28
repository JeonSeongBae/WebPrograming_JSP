<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.regex.Matcher"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>checkID_중복체크</title>
</head>
<body>
	<%
		String answer = "INIT"; // 초기값 == 형식에 맞지 않음

		String checkName = "^[a-zA-Z0-9]{6,10}$"; // 6자이상 10자이하의 영문(대소문자 구별) 
		Pattern pattern = Pattern.compile(checkName);

		String ID = request.getParameter("ID");
		Matcher matcher = pattern.matcher(ID);
		if (matcher.find()) { // ID 형식을 확인함
			answer = "POSSIBLE";
			String filePath = application.getRealPath("WEB-INF\\IDDataBase\\") + "\\"; // 인증받지 않은 IDData들이 들어있는 폴더
			File file = new File(filePath); // 파일경로에 파일 객체를 생성
			File[] files = file.listFiles(); // 파일리스트들을 불러옴
			for (int i = 0; i < files.length; i++) {
				if (files[i].getName().equals(ID + ".txt")) { // 중복된 아이디가 있는지 확인
					answer = "DUPLICATION";
					break;
				}
			}
		}
		// 응답을 전해줄 객체를 생성하여 전해줌
		PrintWriter printWriter = response.getWriter();
		printWriter.print(answer);
		printWriter.flush();
		printWriter.close();
	%>
</body>
</html>