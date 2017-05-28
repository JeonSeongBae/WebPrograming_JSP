<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>createMember_회원 생성</title>
</head>
<body>
	<%
		// 각각의 정보를 받아옴
		String answer = ""; // 초기화
		try {
			// 파일 쓰기
			String filePath = application.getRealPath("WEB-INF/IDDataBase/") + "\\"; // 저장될 위치
			String fileName = request.getParameter("ID") + ".txt"; //ID값을 불러옴
			FileWriter fileWriter = new FileWriter(filePath + fileName);
			String Password = request.getParameter("Password"); // Password값을 불러옴
			fileWriter.write(Password + "\n");
			String Name = request.getParameter("Name"); // 이름 값을 불러옴
			fileWriter.write(Name + "\n");
			String Telephone = request.getParameter("Telephone"); // 핸드폰 번호값을 불러옴
			fileWriter.write(Telephone + "\n");
			String Email = request.getParameter("Email"); // Eamil값을 불러옴
			fileWriter.write(Email + "\n");
			String Birth = request.getParameter("Birth"); // 생일 값을 불러옴
			fileWriter.write(Birth + "\n");
			fileWriter.close();
			answer = "SUCESS";
		} catch (Exception e) {
			System.out.println("파일 쓰기중 오류가 발생했습니다." + e.toString());
		} finally {
			// 응답을 전해줄 객체를 생성하여 전해줌
			PrintWriter printWriter = response.getWriter();
			printWriter.print(answer);
			printWriter.flush();
			printWriter.close();
		}
	%>

</body>
</html>