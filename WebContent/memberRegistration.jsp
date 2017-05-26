<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
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
					document.getElementById("Password").focus();
				} else if (response == "DUPLICATION") {
					alert("이미 존재하는 ID입니다. 다른 ID를 입력해주세요.");
				} else {
					alert("형식에 맞지않는 ID입니다. 형식에 맞는 ID를 입력해주세요.");
				}
			}
		})
	}
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
				} else if (response == "checkEmail") {
					alert("checkEmail");
				} else if (response == "checkTelephone") {
					alert("전화번호 형식을 지켜주세요.");
					document.getElementById("Telephone").value = null;
				} else if (response == "checkName") {
					alert("이름은 문자열만 입력 가능합니다.");
					document.getElementById("Name").value = null;
				} else if (response == "checkPassword") {
					alert("checkPassword");
				} else if (response == "checkPasswordCheck") {
					alert("위에 입력한 비밀번호와 값이 다릅니다. 다시 입력해주세요.");
					document.getElementById("Password").value = null;
					document.getElementById("PasswordCheck").value = null;
				} else if (response == "checkID") {
					alert("checkID");
				} else if (response == "blankEmail") {
					alert("Email값이 없습니다.");
				}else if (response == "blankBirth") {
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
				} else {
					createMember();
					window.open('http://localhost:8080/HW1/loginPage.jsp')
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
					alert("SUCESS");
					
				} else if (response == "FAIL") {
					alert("FAIL");
				}
			}
		})
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HW1_JSP_201302476_전성배</title>
</head>
<body>
	<form action="" id="form_info">
		<table>
			<thead></thead>
			<tbody>
				<tr>
					<td>2017 웹 프로그래밍 HW1<br> 본 약관은 "HW1-회원가입"서비스를 이용하기 위해서는
						회원등록을 완료 해야합니다.
					</td>
				</tr>
				<tr>
					<th><input id="Checkbox" type="checkbox" name="agree">약관에
						동의합니다.</th>
				</tr>
			</tbody>
			<tfoot></tfoot>
		</table>
		<table>
			<thead></thead>
			<tbody>
				<tr>
					<td>ID</td>
					<td><input id="ID" class="eq_ptag" type="text" name="name_ID"
						placeholder="문자 or 숫자" required><br></td>
					<td><input type="button" name="name_Check" value="중복체크"
						onclick="checkID()" required></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input id="Password" class="eq_ptag" type="text"
						name="name_Password" placeholder="문자+숫자, 8자리 이상" required><br></td>
				</tr>
				<tr>
					<td>Password 확인</td>
					<td><input id="PasswordCheck" class="eq_ptag" type="text"
						name="name_PasswordCheck" required><br></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input id="Name" class="eq_ptag" type="text"
						name="name_Name" placeholder="문자열만 입력 가능" required><br></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input id="Telephone" class="eq_ptag" type="tel"
						name="name_Telephone" placeholder="ex)01(0)-000(0)-0000" required><br></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input id="Email" class="eq_ptag" type="email"
						name="name_Email" required><br></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input id="Birth" class="eq_ptag" type="date"
						name="name_Birth" required><br></td>
				</tr>
			</tbody>
			<tfoot>
				<td><input type="button" name="name_Check" value="제출하기"
					onclick="checkSubmit()" required></td>
			</tfoot>
		</table>

	</form>
</body>
</html>