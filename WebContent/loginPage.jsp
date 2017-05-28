<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
	function login() {
		$.ajax({
			type : 'post',
			url : 'http://localhost:8080/HW1/checkLogin.jsp',
			data : {
				ID : document.getElementById("ID").value,
				Password : document.getElementById("Password").value
			},
			success : function(response) {
				if (response == "MATCH") {
					onePageEnter();
				} else if (response == "NOMATCH") {
					alert("비밀번호가 일치하지 않습니다.");
				} else if (response == "NOTEXIST") {
					alert("아이디가 존재하지 않습니다.");
				}
			}
		})
	}
	 // OnePage를 열어줌
	function onePageEnter() {
		location.href = 'OnePageDir\\OnePage.html';
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
		</thead>
		<tbody>
			<!-- ID, Password 입력칸 -->
			<tr>
				<td>ID</td>
				<td><input id="ID" class="eq_ptag" type="text" name="name_ID"
					value=""><br></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input id="Password" class="eq_ptag" type="text"
					name="name_Password"><br></td>
			</tr>
		</tbody>
		<tfoot>
			<!-- 버튼목록 -->
			<tr>
				<td><input type="button" name="name_Submit" value="로그인하기"
					onclick="login()"></td>
				<td><input type="button" name="name_Submit" value="회원가입"
					onclick="location.href='http://localhost:8080/HW1/memberRegistration.jsp'"></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>