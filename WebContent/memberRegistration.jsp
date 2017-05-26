<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
	function checkID() {
		$.ajax({
			type : 'post',
			url : 'http://localhost:8080/HW1/checkRegistration.jsp',
			data : {
				ID : document.getElementById("ID").value
			},
			success : function(response) {
				if (response == "POSSIBLE") {
					alert("사용 가능한 ID입니다.");
				} else if (response == "DUPLICATION") {
					alert("이미 존재하는 ID입니다. 다른 ID를 입력해주세요.");
				} else if (response == "NOTFORM") {
					alert("형식에 맞지않는 ID입니다. 형식에 맞는 ID를 입력해주세요.");
				}
				console.log(response);
			}
		})
	}
	function submit() {
		$.ajax({
			type : 'post',
			url : 'http://localhost:8080/HW1/checkRegistration.jsp',
			data : {
				ID : document.getElementById("ID").value,
				Password : document.getElementById("Password").value,
				Name : document.getElementById("Name").value,
				Telephone : document.getElementById("Telephone").value,
				Email : document.getElementById("Email").value,
				Birth : document.getElementById("Birth").value
			},
			success : function(response) {
				if (response == "POSSIBLE") {
					alert("POSSIBLE");
				} else if (response == "DUPLICATION") {
					alert("DUPLICATION");
				} else if (response == "NOTFORM") {
					alert("NOTFORM");
				}
				console.log(response);
			}
		})
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HW1_JSP_201302476_전성배</title>
</head>
<body>
	<form action="./createMember.jsp" id="form_info">
		<table>
			<thead></thead>
			<tbody>
				<tr>
					<td>2017 웹 프로그래밍 HW1<br> 본 약관은 "HW1-회원가입"서비스를 이용하기 위해서는
						회원등록을 완료 해야합니다.
					</td>
				</tr>
				<tr>
					<th><input type="checkbox" name="agree">약관에 동의합니다.</th>
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
						value=""><br></td>
					<td><input type="button" name="name_Check" value="중복체크"
						onclick="checkID()"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input id="Password" class="eq_ptag" type="text"
						name="name_Password"><br></td>
				</tr>
				<tr>
					<td>Password 확인</td>
					<td><input id="PasswordCheck" class="eq_ptag" type="text"
						name="name_PasswordCheck"><br></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input id="Name" class="eq_ptag" type="text"
						name="name_Name"><br></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input id="Telephone" class="eq_ptag" type="text"
						name="name_Telephone"><br></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input id="Email" class="eq_ptag" type="text"
						name="name_Email"><br></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input id="Birth" class="eq_ptag" type="date"
						name="name_Birth"><br></td>
				</tr>
			</tbody>
		</table>
		<input type="button" name="name_Check" value="제출하기" onclick="submit()">

	</form>
</body>
</html>