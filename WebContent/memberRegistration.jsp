<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HW1_JSP_201302476_전성배</title>
</head>
<body>
		<table border="2">
			<thead></thead>
			<tbody>
				<tr>
					<td>2017 웹 프로그래밍 HW1<br>본 약관은 "HW1-회원가입"서비스를 이용하기 위해서는 회원등록을 완료 해야합니다.</td>
				</tr>
				<tr>
					<th><input id="Checkbox" type="checkbox" name="agree">약관에 동의합니다.</th>
				</tr>
			</tbody>
			<tfoot></tfoot>
		</table>
		<table>
			<thead></thead>
			<tbody>
				<tr>
					<td>ID</td>
					<td><input id="ID" type="text" placeholder="문자 or 숫자" required><br></td>
					<td><input type="button" value="중복체크" onclick="checkID()" required></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input id="Password" type="password" placeholder="문자+숫자, 8자리 이상" required><br></td>
				</tr>
				<tr>
					<td>Password<br>확인</td>
					<td><input id="PasswordCheck" type="password" required><br></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input id="Name" type="text" placeholder="문자열만 입력 가능" required><br></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input id="Telephone" type="tel" placeholder="ex)01(0)-000(0)-0000" required><br></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input id="Email" type="email" required><br></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input id="Birth" type="date" required><br></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td></td>
					<td><input type="button" value="제출하기" onclick="checkSubmit()" required></td>
				</tr>
			</tfoot>
		</table>
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript">
		var dupli = false;
		function checkID() { // 중복체크
			$.ajax({
				type : 'post',
				url : 'http://localhost:8080/HW1/checkID.jsp',
				data : {
					ID : document.getElementById("ID").value
				},
				success : function(response) {
					if (response == "POSSIBLE") {
						alert("사용 가능한 ID입니다.");
						dupli = true;
						document.getElementById("Password").focus();
					} else if (response == "DUPLICATION") {
						alert("이미 존재하는 ID입니다. 다른 ID를 입력해주세요.");
					} else {
						alert("형식에 맞지않는 ID입니다. 형식에 맞는 ID를 입력해주세요.");
					}
				}
			})
		}
		$('#PasswordCheck').blur(function() {
			if ((document.getElementById("Password").value != document.getElementById("PasswordCheck").value)&&(document.getElementById("Password").value!="")) {
				alert("위에 입력한 비밀번호와 값이 다릅니다. 다시 입력해주세요.");
				document.getElementById("Password").value = null;
				document.getElementById("PasswordCheck").value = null;
			}
		});
		$('#Name').blur(function() {
			var checkName = /^[a-z가-힣]+$/;
			if (!(checkName.test($('#Name').val()))&&(document.getElementById("Name").value!="")) { // 이름 확인
				alert("이름은 문자열만 입력 가능합니다.");
				document.getElementById("Name").value = null;
			}
		});
		$('#Telephone').blur(function() {
			var checkName = /^01([0|1|6|7|8]?)-+([0-9]{3,4})-+([0-9]{4})$/;
			if (!(checkName.test($('#Telephone').val()))&&(document.getElementById("Telephone").value!="")) { // 전화번호 확인
				alert("전화번호 형식을 지켜주세요.");
				document.getElementById("Telephone").value = null;
			}
		});
		$('#Email').blur(function() {
			var checkName = /^[a-z가-힣0-9]+@+[a-z가-힣0-9]+.+[a-z가-힣0-9]+$/;
			if (!(checkName.test($('#Email').val()))&&(document.getElementById("Email").value!="")) { // 이메일 확인
				alert("이메일 형식을 지켜주세요.");
				document.getElementById("Email").value = null;
			}
		});
		function checkSubmit() { // 제출하기
			$.ajax({
				type : 'post',
				url : 'http://localhost:8080/HW1/checkSubmit.jsp',
				data : {
					Checkbox : document.getElementById("Checkbox").checked,
					ID : document.getElementById("ID").value,
					Password : document.getElementById("Password").value,
					PasswordCheck : document.getElementById("PasswordCheck").value,
					Name : document.getElementById("Name").value,
					Telephone : document.getElementById("Telephone").value,
					Email : document.getElementById("Email").value,
					Birth : document.getElementById("Birth").value
				},
				success : function(response) {
					if (response == "checkCheckbox") {
						alert("약관에 동의해주시기 바랍니다.!!");
					} else if (response == "checkPassword") {
						alert("패스워드 형식을 지켜주세요.");
					} else if (response == "checkPasswordCheck") {
						alert("위에 입력한 비밀번호와 값이 다릅니다. 다시 입력해주세요.");
						document.getElementById("Password").value = null;
						document.getElementById("PasswordCheck").value = null;
						document.getElementById("Password").value.focus();
					} else if (response == "checkID") {
						alert("아이디 형식을 지켜주세요.");
					} else if (response == "blankEmail") {
						alert("Email값이 없습니다.");
					} else if (response == "blankBirth") {
						alert("Birth값이 없습니다.");
					} else if (response == "blankTelephone") {
						alert("전화번호값이 없습니다.");
					} else if (response == "blankName") {
						alert("이름값이 없습니다.");
					} else if (response == "blankPassword") {
						alert("비밀번호값이 없습니다.");
					} else if (response == "blankcheckPasswordCheck") {
						alert("비밀번호 확인값이 없습니다.");
					} else if (response == "blankID") {
						alert("ID값이 없습니다.");
					} else if (dupli != true) {
						alert("중복체크를 해주세요.");
					} else {
						createMember();
						location.href = 'http://localhost:8080/HW1/loginPage.jsp';
					}
				}
			})
		}
		function createMember() { // 계정생성
			$.ajax({
				type : 'post',
				url : 'http://localhost:8080/HW1/createMember.jsp',
				data : {
					Checkbox : document.getElementById("Checkbox").checked,
					ID : document.getElementById("ID").value,
					Password : document.getElementById("Password").value,
					Name : document.getElementById("Name").value,
					Telephone : document.getElementById("Telephone").value,
					Email : document.getElementById("Email").value,
					Birth : document.getElementById("Birth").value
				},
				success : function(response) {
					if (response == "SUCESS") {
						alert("계정을 생성하였습니다. 이메일 인증을 받으세요.");
						send_email();
					} else
						alert("계정생성에 실패하였습니다.");
				}
			})
		}
		function send_email() {
			location.href = "http://localhost:8080/HW1/email.jsp?ID="+document.getElementById("ID").value + "&Email=" + document.getElementById("Email").value;
		}
	</script>
</body>
</html>