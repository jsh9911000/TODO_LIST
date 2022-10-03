<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 폼</title>
<!-- CSS cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<style>
	body{
		background-color: black;	
	}
	.container{
		width: 30%;
		height: 500px;
		margin-top: 200px;
		margin-left: 580px;
		background-color: gray;
		border: 1px solid orange;
		border-radius: 8px;
	}
	#main{
		color: tomato;
		text-align: center;
		padding-bottom: 30px
	}
</style>
</head>
<body>
	<div class="container">
		<h1 id="main">회원가입</h1>
		<form action="signup.jsp" method="post">
			<label for="name">이름</label>
			<input type="text" name="name" id="name"/>
			<br />
			<label for="age">나이</label>
			<input type="text" name="age" id="age"/>
			<br />
			<label for="addr">주소</label>
			<input type="text" name="addr" id="addr"/>
			<br />
			<label for="email">이메일</label>
			<input type="text" name="email" id="email"/>
			<br />
			<label for="id">아이디</label>
			<input type="text" name="id" id="id"/>
			<br />
			<label for="pwd">비밀번호</label>
			<input type="text" name="pwd" id="pwd"/>
			<br />
			<label for="pwd_check">비밀번호 확인</label>
			<input type="text" name="pwd_check" id="pwd_check"/>
			<br />
			<button type="submit" class="btn btn-primary btn-lg" id="btn">가입</button>
		</form>
	</div>
<script>
	document.getElementById("btn").addEventListener("click", (e) => {
		const pwd = document.querySelector("#pwd").value;
		const pwd_check = document.querySelector("#pwd_check").value;
		if(pwd != pwd_check){
			e.preventDefault();
			alert("비밀번호가 틀립니다.");
		}
	})
</script>
</body>
</html>