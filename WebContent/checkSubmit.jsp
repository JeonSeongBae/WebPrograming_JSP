<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.regex.Matcher"%>
<%@ page import="java.util.regex.Pattern"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String answer = ""; // 초기값 == 형식에 맞지 않음
		PrintWriter printWriter;
		String Checkbox = request.getParameter("Checkbox");
		String ID = request.getParameter("ID");
		String Password = request.getParameter("Password");
		String PasswordCheck = request.getParameter("PasswordCheck");
		String Name = request.getParameter("Name");
		String Telephone = request.getParameter("Telephone");
		String Email = request.getParameter("Email");
		String Birth = request.getParameter("Birth");
		Pattern pattern = null;
		Matcher matcher = null;

		String checkEmail = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
		String checkTelephone = "^01([0|1|6|7|8]?)-?([0-9]{3,4})-?([0-9]{4})$";
		String checkName = "^[a-z가-힣]+$";
		String checkPassword = "^[a-zA-Z0-9_]{6,10}$";
		// 		String checkPassword = "^((?=.*[a-z])+(?=.*[A-Z])+(?=.*\\d)+(?=.*\\W)).{6,20}$";
		String checkID = "^[a-zA-Z0-9_]{6,10}$";
		pattern = Pattern.compile(checkEmail);
		matcher = pattern.matcher(Email);
		// 		System.out.println("checkBox: " + Checkbox);
		if (!matcher.find()) { // 1. 이메일 확인
			answer = "checkEmail";
		}
		pattern = Pattern.compile(checkTelephone);
		matcher = pattern.matcher(Telephone);
		if (!matcher.find()) { // 2. 전화번호 확인
			answer = "checkTelephone";
		}
		pattern = Pattern.compile(checkName);
		matcher = pattern.matcher(Name);
		if (!matcher.find()) { // 이름 확인
			answer = "checkName";
		}
		// 		System.out.println(matcher);
		pattern = Pattern.compile(checkPassword);
		matcher = pattern.matcher(Password);
		if (!matcher.find()) { // 비밀번호 확인
			answer = "checkPassword";
		}
		if (Password.equals(PasswordCheck)) { // 비밀번호확인 확인
			answer = "checkPasswordCheck";
		}
		pattern = Pattern.compile(checkID);
		matcher = pattern.matcher(ID);
		if (!matcher.find()) { // ID 확인
			answer = "checkID";
		}
		if (Checkbox.equals("false")) { // 약관 동의 확인
			answer = "checkCheckbox";
			// 		System.out.println("들어옴 "+answer);
		}
		// 		System.out.println("answer: "+answer);
		answer = "";
		printWriter = response.getWriter();
		printWriter.print(answer);
		printWriter.flush();
		printWriter.close();
	%>
</body>
</html>