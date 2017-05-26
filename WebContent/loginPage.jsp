<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
					alert("MATCH");
				} else if (response == "NOMATCH") {
					alert("NOMATCH");
				} else if (response == "NOTEXIST") {
					alert("NOTEXIST");
				}
				console.log(response);
			}
		})
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="./checkLogin.jsp" id="form_info">
		<table>
			<thead>
			</thead>
			<tbody>
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
		</table>
		<input type="button" name="name_Submit" value="로그인하기"
			onclick="login()">
	</form>
</body>
</html>