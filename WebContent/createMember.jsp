<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 생성</title>
</head>
<body>
	<%
		// 각각의 정보를 받아옴
		String answer = ""; // 초기화
		String ID = request.getParameter("ID"); //ID값을 불러옴
		String Password = request.getParameter("Password"); // Password값을 불러옴
		String Name = request.getParameter("Name"); // 이름 값을 불러옴
		String Telephone = request.getParameter("Telephone"); // 핸드폰 번호값을 불러옴
		String Email = request.getParameter("Email"); // Eamil값을 불러옴
		String Birth = request.getParameter("Birth"); // 생일 값을 불러옴
		String fileName = ID + ".txt"; // 파일 이름
		String filePath = application.getRealPath("WEB-INF/IDDataBase/")+"\\"; // 저장될 위치
		try {
			// 파일 쓰기
			FileWriter fileWriter = new FileWriter(filePath + fileName);
			fileWriter.write(Password + "\n");
			fileWriter.write(Name + "\n");
			fileWriter.write(Email + "\n");
			fileWriter.write(Birth + "\n");
			fileWriter.close();
			answer = "SUCESS";
		} catch (IOException e) {
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