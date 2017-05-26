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
		String name_ID = request.getParameter("name_ID");
		System.out.println("여기다여기!"+name_ID);
		String name_Password = request.getParameter("name_Password");
		String name_PasswordCheck = request.getParameter("name_PasswordCheck");
		String name_Name = request.getParameter("name_Name");
		String name_Email = request.getParameter("name_Email");
		String name_Birth = request.getParameter("name_Birth");

		String fileName = name_ID + ".txt"; // 파일 이름
		String filePath = application.getRealPath("IDDataBase//" + "//" + fileName); // 저장될 위치
		// 		String lineSeparator = System.getProperty("line.separator"); // 줄바꿈
		try {
			// 파일 생성
			File newfile = new File(filePath);
			newfile.createNewFile();
			// 파일 스기
			FileWriter fileWriter = new FileWriter(filePath);
			fileWriter.write(name_ID + "\n");
			fileWriter.write(name_Password + "\n");
			fileWriter.write(name_PasswordCheck + "\n");
			fileWriter.write(name_Name + "\n");
			fileWriter.write(name_Email + "\n");
			fileWriter.write(name_Birth + "\n");
			fileWriter.close();
			FileReader fr = new FileReader(filePath); //파일읽기객체생성
			BufferedReader br = new BufferedReader(fr); //버퍼리더객체생성
			String line = null;
			while ((line = br.readLine()) != null) { //라인단위 읽기
				out.println(line + "<br>");
			}
		} catch (IOException e) {
			System.out.println(e.toString());
		}
	%>
</body>
</html>