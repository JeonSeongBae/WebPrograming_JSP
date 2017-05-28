<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인증 완료</title>
</head>
<body>
	<p>
		메일 인증이 성공하여<br>회원가입이 완료되었습니다.<br>로그인 후 이용하시길 바랍니다.<br>
	</p>
	<input type="button" name="name_Submit" value="로그인 페이지 이동" onclick="login()">
	<%
		// 각각의 정보를 받아옴
		String answer = ""; // 초기화
		String ID = request.getParameter("ID"); // 아이디를 가져옴
		String fileName = ID + ".txt"; // 파일 이름
		String filePath = application.getRealPath("WEB-INF\\IDDataBase\\") + "\\"; // 불러올 위치
		File file = new File(filePath); // 파일을 불러옴
		File[] files = file.listFiles(); // 파일 리스트 형성
		try {
			for (int i = 0; i < files.length; i++) {
				if (files[i].getName().equals(ID + ".txt")) {//그 디렉토리에 있는 파일 중 전달받은 id와 같은 이름의 파일이 있을 경우
					files[i].renameTo(
							new File(application.getRealPath("/WEB-INF/IDDataBase_certification/" + ID + ".txt")));
				}
			}

		} catch (Exception e) {
			System.out.println("인증정보 복사 실패: " + e.toString());
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