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
		String answer = "NOMATCH";
		String ID = request.getParameter("ID");
		String Password = request.getParameter("Password");

		String filePath = application.getRealPath("IDDataBase") + "\\"; // 불러올 위치
		// 		filePath += "\\";
		File file = new File(filePath);
		File[] files = file.listFiles();
		System.out.println("filePath: " + filePath);
		System.out.println("files: " + files[0]);
		try {
			FileReader fileReader = new FileReader(filePath + ID + ".txt"); //파일읽기객체생성
			BufferedReader bufferedReader = new BufferedReader(fileReader); //버퍼리더객체생성
			String line = null;
			for (int i = 0; i < files.length; i++) {
				if (files[i].getName().equals(ID + ".txt")) { // 일치하는 파일을 찾았을 경우
					bufferedReader.readLine(); // ID를 읽는 부분
					// 					System.out.println("여기: "+bufferedReader.readLine());
					line = bufferedReader.readLine(); // Password를 읽는 부분
					// 					System.out.println("line: " + line);
					// 					System.out.println("Password: " + line);
					if (Password.equals(line)) {
						answer = "MATCH";
					}
				}
				System.out.println(i + ": 파일읽기");

				// 					while ((line = bufferedReader.readLine()) != null) { //라인단위 읽기
				// 						System.out.println(line);
				// 					}
				// 				System.out.println(i + "번째 파일: " + files[i].getName());
			}
		} catch (IOException e) {
			answer = "NOTEXIST";
			// 			System.out.println("IOException: " + e.toString());
		}
		PrintWriter printWriter = response.getWriter();
		printWriter.print(answer);
		printWriter.flush();
		printWriter.close();
	%>
</body>
</html>