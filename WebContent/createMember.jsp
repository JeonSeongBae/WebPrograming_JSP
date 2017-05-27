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
		String Password = request.getParameter("Password");
		String Name = request.getParameter("Name");
		String Telephone = request.getParameter("Telephone");
		String Email = request.getParameter("Email");
		String Birth = request.getParameter("Birth");
		String fileName = ID + ".txt"; // 파일 이름
// 		String filePath = application.getRealPath("") + "\\"; // 저장될 위치
		String filePath = "C:\\Users\\user\\Desktop" + "\\"; // 저장될 위치

		System.out.println(filePath);
		try {
			// 파일 생성
			File newfile = new File(filePath);
			newfile.createNewFile();
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
		}
		finally{
			PrintWriter printWriter = response.getWriter();
			printWriter.print(answer);
			printWriter.flush();
			printWriter.close();
		}
	%>

</body>
</html>