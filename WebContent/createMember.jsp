<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	function send_email() {
		document.send_form.submit();
	}
</script>
<title>Insert title here</title>
</head>
<body onload="send_email()">
	<%
		// 각각의 정보를 받아옴
		// 		System.out.print("");
		String answer = "";
		String Checkbox = request.getParameter("Checkbox");
		String ID = request.getParameter("ID");
		String Password = request.getParameter("Password");
		String PasswordCheck = request.getParameter("PasswordCheck");
		String Name = request.getParameter("Name");
		String Telephone = request.getParameter("Telephone");
		String Email = request.getParameter("Email");
		String Birth = request.getParameter("Birth");

		String fileName = ID + ".txt"; // 파일 이름
		String filePath = application.getRealPath("IDDataBase//" + "//" + fileName); // 저장될 위치
		// 		String lineSeparator = System.getProperty("line.separator"); // 줄바꿈
		try {
			// 파일 생성
			File newfile = new File(filePath);
			newfile.createNewFile();
			// 파일 스기
			FileWriter fileWriter = new FileWriter(filePath);
// 			fileWriter.write(ID + "\n");
			fileWriter.write(Password + "\n");
			fileWriter.write(PasswordCheck + "\n");
			fileWriter.write(Name + "\n");
			fileWriter.write(Email + "\n");
			fileWriter.write(Birth + "\n");
			fileWriter.close();
			FileReader fr = new FileReader(filePath); //파일읽기객체생성
			BufferedReader br = new BufferedReader(fr); //버퍼리더객체생성
			String line = null;
			while ((line = br.readLine()) != null) { //라인단위 읽기
				out.println(line + "<br>");
			}
			answer = "SUCESS";
		} catch (IOException e) {
			answer = "FAIL";
			System.out.println(e.toString());
		}
		PrintWriter printWriter = response.getWriter();
		printWriter.print(answer);
		printWriter.flush();
		printWriter.close();
	%>
	<div>
		<form method="POST" name="send_form" action="send_email.jsp">
			<input type="hidden" name="id" value="<%=ID%>"></input>
			<input type="hidden" name="email" value="<%=Email%>"></input>
		</form>
		<span>loading...</span>
	</div>
</body>
</html>